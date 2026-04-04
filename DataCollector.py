import pandas as pd
import numpy as np
import yfinance as yf

tickers = [
    "NVDA", "TSLA", "AMD", "AMZN",
    "MSFT", "AAPL", "JNJ", "PG",
    "XOM", "JPM", "WMT", "CAT",
    "SPY", "QQQ", "^VIX"
]

def download_stock_data(ticker, startDate):
    print(f"Starting download for {len(tickers)} tickers...")

    data = yf.download(ticker, start=startDate, auto_adjust=True)

    df = data.stack(level=1).rename_axis(['Date', 'Ticker']).reset_index()

    df.to_csv("stock_data.csv", index=False, sep=";")
    print(f"Finished downloading for {len(tickers)} tickers.")
    return df

if __name__ == "__main__":
    df = download_stock_data(tickers, "2010-01-01")
    print(df.head())
