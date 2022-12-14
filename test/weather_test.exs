defmodule App.Weather.Test do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  @api "http://api.openweathermap.org/data/2.5/weather?q="

  test "should return a encoded endpoint when take a location" do
    appid = App.Weather.get_appid()
    endpoint = App.Weather.get_endpoint("Rio de Janeiro")
    assert "#{@api}Rio%20de%20Janeiro&appid=#{appid}" == endpoint
  end

  test "should return Celsius when take Kelvin" do
    kelvin_example = 296.48
    celsius_example = 23.3
    temperature = App.Weather.kelvin_to_celsius(kelvin_example)
    assert temperature == celsius_example
  end

  test "should return temperature when take a valid location" do
    expect(WeatherBehaviourMock, :temperature_of, fn args ->
      assert args == "Rio de janeiro"
      args
    end)

    temperature = ClientWeather.temperature_of("Rio de janeiro")

    assert String.contains?(temperature, "Rio de janeiro") == true
  end

  test "should return not found when take an invalid location" do
    expect(WeatherBehaviourMock, :temperature_of, fn args ->
      assert args == "00000"
      "#{args} not found"
    end)

    result = ClientWeather.temperature_of("00000")
    assert result == "00000 not found"
  end

  test "should return the start PID Belém" do
    result = App.Weather.start(["Belém"])
    [{_pid, city}] = result
    assert city == "Belém"
  end
end
