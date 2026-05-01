from xml.parsers.expat import model

import pandas as pd
import pandas_ta as ta
import numpy as np
import matplotlib.pyplot as plt

import torch
import torch.nn as nn

from sklearn.preprocessing import StandardScaler
from sklearn.metrics import root_mean_squared_error

DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")
LEARNING_RATE = 0.001
LOSS_WEIGHTS = (0.6, 0.3, 0.1)  # 1d, 1w, 1m

def add_indicators(df):
    df = df.sort_values(by=['Ticker', 'Date'])

    df['RSI'] = df.groupby('Ticker')['Close'].transform(lambda x: ta.rsi(close=x, length=14))
    df['Target_Return'] = df.groupby('Ticker')['Close'].transform(lambda x: np.log(x / x.shift(1)))

    df = df.dropna()

    return df

def build_sequences(df_ticker, feature_cols, seq_length):
    X, Y = [], []

    for i in range(len(df_ticker) - seq_length - 21):
        X.append(df_ticker[feature_cols].iloc[i:i+seq_length].values)

        base_price = df_ticker['Close'].iloc[i+seq_length-1]
        Y.append([
            df_ticker['Close'].iloc[i+seq_length] / base_price - 1,
            df_ticker['Close'].iloc[i+seq_length+4] / base_price - 1,
            df_ticker['Close'].iloc[i+seq_length+20] / base_price - 1,
        ])

    return np.array(X), np.array(Y)

def build_all_sequences(df, feature_cols, seq_length):
    all_X, all_Y = [], []

    for ticker, group in df.groupby('Ticker'):
        group = group.reset_index(drop=True)

        feature_scaler = StandardScaler()
        group[['RSI', 'Target_Return']] = feature_scaler.fit_transform(group[['RSI', 'Target_Return']])

        X, Y = build_sequences(group, feature_cols, seq_length)
        all_X.append(X)
        all_Y.append(Y)

    return np.concatenate(all_X), np.concatenate(all_Y)

def weighted_loss(output, target):
    losses = [w * nn.MSELoss()(output[:, i], target[:, i]) for i, w in enumerate(LOSS_WEIGHTS)]
    return sum(losses)

def train(df, seq_length, epochs):
    feature_cols = ['Close', 'RSI', 'Target_Return']
    X, Y = build_all_sequences(df, feature_cols, seq_length)

    train_size = int(0.8 * len(X))

    X_train = torch.from_numpy(X[:train_size]).type(torch.Tensor).to(DEVICE)
    Y_train = torch.from_numpy(Y[:train_size]).type(torch.Tensor).to(DEVICE)
    X_test = torch.from_numpy(X[train_size:]).type(torch.Tensor).to(DEVICE)
    Y_test = torch.from_numpy(Y[train_size:]).type(torch.Tensor).to(DEVICE)

    model = PredictionModel(input_dim=len(feature_cols), hidden_dim=64, num_layers=2, output_dim=3).to(DEVICE)
    optimizer = torch.optim.Adam(model.parameters(), lr=LEARNING_RATE)

    model.train()
    for epoch in range(epochs):
        optimizer.zero_grad()

        output = model(X_train)

        loss = weighted_loss(output, Y_train)
        loss.backward()
        optimizer.step()

        if epoch % 10 == 0:
            print(f"Epoch {epoch}/{epochs} - Loss: {loss.item():.6f}")

    model.eval()
    with torch.no_grad():
        Y_train_pred = model(X_train)
        Y_test_pred = model(X_test)

    Y_train = Y_train.cpu().numpy()
    Y_train_pred = Y_train_pred.cpu().numpy()
    Y_test = Y_test.cpu().numpy()
    Y_test_pred = Y_test_pred.cpu().numpy()

    train_rmse = root_mean_squared_error(Y_train[:, 0], Y_train_pred[:, 0])
    test_rmse = root_mean_squared_error(Y_test[:, 0], Y_test_pred[:, 0])
    print(f"Train RMSE: {train_rmse:.4f} | Test RMSE: {test_rmse:.4f}")

    return model, Y_train, Y_train_pred, Y_test, Y_test_pred, train_rmse, test_rmse

def predict(ticker, df, model, seq_length):
    df_ticker = df[df['Ticker'] == ticker].reset_index(drop=True)

    feature_scaler = StandardScaler()
    df_ticker[['RSI', 'Target_Return']] = feature_scaler.fit_transform(df_ticker[['RSI', 'Target_Return']])

    feature_cols = ['Close', 'RSI', 'Target_Return']
    X, Y = build_sequences(df_ticker, feature_cols, seq_length)

    X_tensor = torch.from_numpy(X).type(torch.Tensor).to(DEVICE)
    Y = Y

    model.eval()
    with torch.no_grad():
        Y_pred = model(X_tensor).cpu().numpy()

    return Y, Y_pred

def plot(ticker, df, model, seq_length, train_rmse, test_rmse):
    Y_test, Y_test_pred = predict(ticker, df, model, seq_length)

    df_ticker = df[df['Ticker'] == ticker].reset_index(drop=True)
    test_dates = df_ticker['Date'].values[-len(Y_test):]

    fig = plt.figure(figsize=[10, 8])
    gs = fig.add_gridspec(5, 1)

    ax1 = fig.add_subplot(gs[:2, 0])
    ax1.plot(test_dates, Y_test[:, 0], color='blue', label='Actual 1d Return')
    ax1.plot(test_dates, Y_test_pred[:, 0], color='green', label='Predicted 1d Return')
    ax1.legend()
    ax1.set_title(f"{ticker} Return Prediction")
    ax1.set_ylabel("Return")

    ax2 = fig.add_subplot(gs[2:4, 0])
    ax2.plot(test_dates, Y_test[:, 1], color='blue', label='Actual 1w Return', linestyle='--')
    ax2.plot(test_dates, Y_test_pred[:, 1], color='green', label='Predicted 1w Return', linestyle='--')
    ax2.plot(test_dates, Y_test[:, 2], color='purple', label='Actual 1m Return', linestyle=':')
    ax2.plot(test_dates, Y_test_pred[:, 2], color='orange', label='Predicted 1m Return', linestyle=':')
    ax2.legend()
    ax2.set_ylabel("Return")

    ax3 = fig.add_subplot(gs[4, 0])
    ax3.axhline(test_rmse, color='blue', linestyle='--', label=f'RMSE: {test_rmse:.4f}')
    ax3.plot(test_dates, abs(Y_test[:, 0] - Y_test_pred[:, 0]), color='r', label='1d Prediction Error')
    ax3.legend()
    ax3.set_title(f"{ticker} Prediction Error")
    ax3.set_xlabel("Date")
    ax3.set_ylabel("Error")

    plt.tight_layout()
    plt.show()

class PredictionModel(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_layers, output_dim):
        super(PredictionModel, self).__init__()

        self.num_layers = num_layers
        self.hidden_dim = hidden_dim

        self.lstm = nn.LSTM(input_dim, hidden_dim, num_layers, batch_first=True, dropout=0.2)
        self.fc = nn.Linear(hidden_dim, output_dim)

    def forward(self, x):
        h0 = torch.zeros(self.num_layers, x.size(0), self.hidden_dim, device=DEVICE)
        c0 = torch.zeros(self.num_layers, x.size(0), self.hidden_dim, device=DEVICE)

        out, (hn, cn) = self.lstm(x, (h0.detach(), c0.detach()))
        out = self.fc(out[:, -1, :])

        return out

df = pd.read_csv("./stock_data.csv", delimiter=";")
df = add_indicators(df)

model, Y_train, Y_train_pred, Y_test, Y_test_pred, train_rmse, test_rmse = train(df, 31, 200)

plot('AAPL', df, model, 31, train_rmse, test_rmse)