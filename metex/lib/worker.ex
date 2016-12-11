defmodule Metex.Worker do
  @http_client Application.get_env(:metex, :http_client)

  def temperature_of(location) do
    result = url_for(location) |> @http_client.get |> parse_response
    case result do
      {:ok, temp} ->
        "#{location}: #{temp}°C"
      :error ->
        "#{location} not found"
    end
  end

  defp url_for(location) do
    location = URI.encode(location)
    result = "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{apikey}"
    result
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> JSON.decode! |> compute_temperature
  end

  defp parse_response(other) do
    :error
  end

  defp compute_temperature(json) do
    try do
      temp = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :error
    end
  end

  defp apikey do
    "4b9b365e00166a6d0a147ff524e25ea7"
  end
end
