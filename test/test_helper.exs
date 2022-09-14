Mox.defmock(WeatherBehaviourMock, for: ClientWeather)
Application.put_env(:client_weather, :weather, WeatherBehaviourMock)
ExUnit.start()
