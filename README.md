# Markit

Access stock market data from [Markit.com](http://www.markit.com)

## Installation

  1. Add markit to your list of dependencies in `mix.exs`:

        def deps do
          [{:markit, "~> 0.0.1"}]
        end

  2. Ensure markit is started before your application:

        def application do
          [applications: [:markit]]
        end

## Usage

  iex> Markit.lookup("NFLX")
  [%Markit.Company{exchange: "NASDAQ", name: "Netflix Inc", symbol: "NFLX"}]

  iex> Markit.quote("AAPL")
  %Markit.Quote{change: 0.840000000000003, change_percent: 0.833746898263031, change_percent_ytd: -3.48660459813795, change_ytd: 105.26, high: 101.7, last_price: 101.59, low: 100.45, market_cap: 563274186970, ms_date: 42432.4447800926, name: "Apple Inc", open: 100.55, symbol: "AAPL", timestamp: "Thu Mar 3 10:40:29 UTC-05:00 2016", volume: 880987}
