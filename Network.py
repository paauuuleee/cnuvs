import pandas as pd
import pandas_ta as ta
import numpy as np
import matplotlib.pyplot as plt

import yfinance as yf

import torch
import torch.nn as nn
import torch.optim as optim

from sklearn.preprocessing import StandardScaler
from sklearn.metrics import root_mean_squared_error

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

scaler = StandardScaler()

def add_indicators(df):
    df = df.sort_values(by=['Ticker', 'Date'])

    df['RSI'] = df.groupby('Ticker')['Close'].transform(lambda x: ta.rsi(close=x, length=14))
    df['Target_Return'] = df.groupby('Ticker')['Close'].transform(lambda x: np.log(x / x.shift(1)))

    df = df.dropna()

    return df

df = pd.read_csv("./stock_data.csv", delimiter=";")
df.groupby('Ticker')
df = add_indicators(df)
#df = yf.download("AAPL", start="2010-01-01", end="2024-06-30")

#print(df)

df['Close'] = scaler.fit_transform(df[['Close']])

seq_length = 31
data = []

for i in range(len(df) - seq_length):
    data.append(df.Close[i:i+seq_length])

data = np.array(data)

train_size = int(0.8 * len(data))

X_train = torch.from_numpy(data[:train_size, :-1, :]).type(torch.Tensor).to(device)
Y_train = torch.from_numpy(data[:train_size, -1, :]).type(torch.Tensor).to(device)
X_test = torch.from_numpy(data[train_size:, :-1, :]).type(torch.Tensor).to(device)
Y_test = torch.from_numpy(data[train_size:, -1, :]).type(torch.Tensor).to(device)

class PredictionModel(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_layers, output_dim):
        super(PredictionModel, self).__init__()

        self.num_layers = num_layers
        self.hidden_dim = hidden_dim

        self.lstm = nn.LSTM(input_dim, hidden_dim, num_layers, batch_first=True, dropout=0.2)
        self.fc = nn.Linear(hidden_dim, output_dim)

    def forward(self, x):
        h0 = torch.zeros(self.num_layers, x.size(0), self.hidden_dim, device=device)
        c0 = torch.zeros(self.num_layers, x.size(0), self.hidden_dim, device=device)

        out, (hn, cn) = self.lstm(x, (h0.detach(), c0.detach()))
        out = self.fc(out[:, -1, :])

        return out

model = PredictionModel(input_dim=1, hidden_dim=32, num_layers=2, output_dim=1).to(device)

criterion = nn.MSELoss()
optimizer = optim.Adam(model.parameters(), lr=0.01)

num_epochs = 200

for i in range(num_epochs):
    Y_train_pred = model(X_train)

    loss = criterion(Y_train, Y_train_pred)

    if i % 25 == 0:
        print(i, loss)

    optimizer.zero_grad()
    loss.backward()
    optimizer.step()

model.eval()

Y_test_pred = model(X_test)

Y_train_pred = scaler.inverse_transform(Y_train_pred.detach().cpu().numpy())
Y_train = scaler.inverse_transform(Y_train.detach().cpu().numpy())
Y_test_pred = scaler.inverse_transform(Y_test_pred.detach().cpu().numpy())
Y_test = scaler.inverse_transform(Y_test.detach().cpu().numpy())

train_rmse = root_mean_squared_error(Y_train[:, 0], Y_train_pred[:, 0])
test_rmse = root_mean_squared_error(Y_test[:, 0], Y_test_pred[:, 0])

# Plots

fig = plt.figure(figsize=[10, 6])

gs = fig.add_gridspec(4, 1)

ax1 = fig.add_subplot(gs[:3, 0])
ax1.plot(df.iloc[-len(Y_test):].index, Y_test, color = 'blue', label='Actual Price')
ax1.plot(df.iloc[-len(Y_test):].index, Y_test_pred, color ='green', label='Predicted Price')
ax1.legend()
plt.title(f"AAPL Price Prediction")
plt.xlabel("Date")
plt.ylabel("Price")

ax2 = fig.add_subplot(gs[3, 0])
ax2.axhline(test_rmse, color='blue', linestyle='--', label='RMSE')
ax2.plot(df[-len(Y_test):].index, abs(Y_test - Y_test_pred), color ='r', label='Prediction Error')
ax2.legend()
plt.title(f"AAPL Price Prediction Error")
plt.xlabel("Date")
plt.ylabel("Error")

plt.tight_layout()
plt.show()