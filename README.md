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

	iex> Markit.Lookup.get!("NFLX").body |> List.first
	%Markit.Company{Exchange: "NASDAQ", Name: "Netflix Inc", Symbol: "NFLX"}
