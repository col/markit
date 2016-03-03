defmodule Markit do

  def lookup(keyword) do
    Markit.Lookup.get!(keyword).body
  end

  def quote(symbol) do
    Markit.Quote.get!(symbol).body
  end

end
