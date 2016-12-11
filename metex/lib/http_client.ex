defmodule Metex.HttpClient do
  def get(url) do
    HTTPoison.get(url)
  end
end
