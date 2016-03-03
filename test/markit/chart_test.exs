defmodule Markit.ChartTest do
  use ExUnit.Case
  doctest Markit.Chart

  test "parses a valid response" do
    {:ok, body} = File.read("test/data/chart_response.json")

    result = Markit.Chart.process_response_body(body)

    assert result == %Markit.Chart{
        labels: nil,
        positions: [0, 1],
        dates: ["2016-03-02T00:00:00", "2016-03-03T00:00:00"],
        elements: [
          %Markit.ChartElement{
            currency: "USD", timestamp: nil, symbol: "AAPL", type: "price",
            data_series: %{
              close: %Markit.DataSeries{
                min: 100.75,
                max: 101.48,
                min_date: "2016-03-02T00:00:00",
                max_date: "2016-03-03T00:00:00",
                values: [100.75, 101.48]
              }
            }
          }
        ]
    }
  end

end
