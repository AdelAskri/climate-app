class WeatherModel {
  String getWeatherConditionIcon(String weatherCondition) {
    if (weatherCondition == 'thunderstorm') {
      return '⛈';
    } else if (weatherCondition == 'rain') {
      return '🌧';
    } else if (weatherCondition == 'few clouds') {
      return'⛅️';
    }else if (weatherCondition == 'clear sky') {
      return'☀️';
    }else if (weatherCondition == 'scattered clouds') {
      return'☁️';
    }else if (weatherCondition == 'broken clouds') {
      return'☁️';
    }else if (weatherCondition == 'snow') {
      return'❄️';
    }else if (weatherCondition == 'mist') {
      return'🌫';
    }  else {
      return '🌈';
    }
  }
}
