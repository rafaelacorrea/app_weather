# App Weather

[![Continuous Integration](https://github.com/rafaelacorrea/app_weather/actions/workflows/ci.yml/badge.svg)](https://github.com/rafaelacorrea/app_weather/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/rafaelacorrea/app_weather/branch/main/graph/badge.svg?token=GH1V5V9XJH)](https://codecov.io/gh/rafaelacorrea/app_weather)

It is a app used to return the location temperature.

## Installation

```bash
git clone 
mix deps.get
```

## Run

```bash
iex -S mix
```
```elixir
iex>  App.Weather.temperature_of "Brazil, Para"
```

