String getWeatherIcon(String description, int sunrise, int sunset) {
    DateTime now = DateTime.now();
    bool isDaytime =
        now.isAfter(DateTime.fromMillisecondsSinceEpoch(sunrise * 1000)) && now.isBefore(DateTime.fromMillisecondsSinceEpoch(sunset * 1000));

    if (description.contains('heavy intensity rain')) {
      //return const BoxedIcon(WeatherIcons.rain_wind, size: 127);
      return isDaytime ? "assets/icon/4801-weather-partly-shower.json" : "assets/icon/4797-weather-rainynight.json";
    } else if (description.contains('moderate rain')) {
      return isDaytime ? "assets/icon/4801-weather-partly-shower.json" : "assets/icon/4797-weather-rainynight.json";
    } else if (description.contains('light rain') || description.contains('Drizzle') || description.contains('Showers')) {
      return isDaytime ? "assets/icon/4801-weather-partly-shower.json" : "assets/icon/4797-weather-rainynight.json";
    } else if (description.contains('cloud') || description.contains('overcast Clouds') || description.contains('Scattered Clouds')) {
      return isDaytime ? "assets/icon/4800-weather-partly-cloudy.json" : "assets/icon/4796-weather-cloudynight.json";
    } else if (description.contains('wind')) {
      return "assets/icon/4806-weather-windy.json";
    } else if (description.contains('snow')) {
      return isDaytime ? "assets/icon/4802-weather-snow-sunny.json" : "assets/icon/4798-weather-snownight.json";
    } else if (description.contains('haze')) {
      return "assets/icon/4795-weather-mist.json";
    } else if (description.contains('thunderstorm')) {
      return "assets/icon/4805-weather-thunder.json";
    } else if (description.contains('drizzle')) {
      return isDaytime ? "assets/icon/4801-weather-partly-shower.json" : "assets/icon/4797-weather-rainynight.json";
    } else if (description.contains('fog')) {
      return "assets/icon/4795-weather-mist.json";
    } else if (description.contains('mist')) {
      return "assets/icon/4795-weather-mist.json";
    } else if (description.contains('tornado')) {
      return isDaytime ? "assets/icon/4792-weather-stormshowersday.json" : "assets/icon/4803-weather-storm.json";
    } else if (description.contains('clear sky') || description.contains('Sun')) {
      return isDaytime ? "assets/icon/4804-weather-sunny.json" : "assets/icon/4799-weather-night.json";
    } else {
      return isDaytime ? "assets/icon/4804-weather-sunny.json" : "assets/icon/4799-weather-night.json";
      ;
    }
  }