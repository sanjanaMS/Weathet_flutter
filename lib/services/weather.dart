import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apikey='a798c41ba863aee4ef754c1c79fad171';
const openWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future getCurrentLocationData() async{
    Location myLocation=Location();
    await myLocation.getCurrentLocation();
    NetworkHelper networkHelper=NetworkHelper('$openWeatherMapURL?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apikey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  Future getCityWeather(String cityName)async{
    var cityurl='$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper network=NetworkHelper(cityurl);
    var weatherData= await network.getData();
    return weatherData;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
