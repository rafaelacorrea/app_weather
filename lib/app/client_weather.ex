defmodule ClientWeather do
  @moduledoc false

  @callback temperature_of(String.t()) :: String.t()

  def temperature_of(location) do
    weather_client().temperature_of(location)
  end

  defp weather_client() do
    Application.get_env(:client_weather, :weather, App.Weather)
  end
end
