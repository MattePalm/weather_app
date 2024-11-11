import 'package:flutter/material.dart';
import 'package:weather_app/model.dart/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:lottie/lottie.dart';
class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State <WeatherPage> createState() => _WeatherPageState();

}

class _WeatherPageState extends State<WeatherPage> {

//dotenv.env['API_KEY']

  //apikey
  final _weatherService = WeatherService(dotenv.env['API_KEY'] ?? "default_key");  // det är här vi måste hämta apinyckeln
  Weather? _weather;
  //fetch weather
_fetchWeather() async {
  //get the current city
  //get the weather for the current city
try {
String city = await _weatherService.getCurrentCity();
  print('Fetched city name: $city');
  final weather = await _weatherService.getWeather(city);
  setState(() {
    _weather = weather;
  });
} catch (e) {
   print('Error fetching weather: $e');
}
}
  //weather animation?

  String getWeatherAnimation(String mainCondition) {
    switch (mainCondition) {
      case "Thunderstorm":
        return 'assets/thunder.json';
      case "Drizzle":
      case "Rain":
      case "Shower rain":
        return 'assets/rainy.json';
      case "Snow":
        return 'assets/snow.json';
      case "Clear":
        return 'assets/sunny.json';
      case "Clouds":
      case "Mist":
      case "Smoke":
      case "Haze":
      case "Dust":
      case "Fog":
        return 'assets/cloudy.json';
      default:
        return 'assets/sunny.json';
    }
  }


  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
       
        children: [
          Text(_weather?.cityName ?? "ladda cityyy"),

          Lottie.asset(getWeatherAnimation(_weather?.mainCondition ?? "")),

          Text("${_weather?.temp.round()}°C"),

          Text(_weather?.mainCondition ?? ""),
        ],
         ),
      ),
    );
  }
}
