class WeatherModel {
  String getWeatherConditionIcon(String weatherCondition) {
    if (weatherCondition == 'thunderstorm') {
      return '⛈';
    } else if (weatherCondition == 'rain') {
      return '🌧';
    } else if (weatherCondition == 'few clouds') {
      return'⛅️';
    } else {
      return '🌈';
    }
  }
}
