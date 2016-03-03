defmodule Markit.Lookup do
  use HTTPoison.Base

  def process_url(company) do
    "http://dev.markitondemand.com/MODApis/Api/v2/Lookup/json?input=#{company}"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!(as: [%Markit.Company{}])
  end
end
