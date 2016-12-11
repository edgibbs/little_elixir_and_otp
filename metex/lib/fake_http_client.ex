defmodule Metex.FakeHttpClient do
  def get(url) do
    cond do
      String.match?(url, ~r/Zzyyxx/) -> :error
      true ->
        {:ok, %HTTPoison.Response{
            body: body,
            status_code: 200
          }
        }
    end
  end

  defp body do
    """
    {
      "main":
        {
          "temp": 291.5
        }
    }

    """
  end
end
