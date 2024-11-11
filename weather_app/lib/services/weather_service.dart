//this handles tghe api call to the open weather api
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/model.dart/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
 static const basUrl = "https://api.openweathermap.org/data/2.5/weather";
 final String apiKey; 
 


  WeatherService(this.apiKey);

  Future<Weather> getWeather(String city) async {
    
    final response = await http.get(Uri.parse('$basUrl?q=$city&appid=$apiKey&units=metric'));
  
    if (response.statusCode == 200) {
      print("sdfdsf: ${Weather.fromJson(jsonDecode(response.body)).mainCondition}");
      
  return Weather.fromJson(jsonDecode(response.body));
} else {
  print('Failed to load weather data: ${response.statusCode} - ${response.reasonPhrase}');
  throw Exception('Failed to load weather data');
}
  
}

Future<String> getCurrentCity() async {
 
 //get permission to use the current location
LocationPermission permission = await Geolocator.requestPermission();

if (permission == LocationPermission.denied) {
  permission = await Geolocator.requestPermission();

}
 try {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('Position: ${position.latitude}, ${position.longitude}');  
    
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    
    if (placemarks.isNotEmpty) {
      String? cityName = placemarks[0].locality;
      String? area = placemarks[0].administrativeArea;
      if (cityName !=null &&cityName.isNotEmpty) {
        cityName = '$cityName, $area';
        return cityName ?? "Stockholm";
      }else {     
        cityName = '$area';
        return cityName ?? "kan inte hitta din position"; // fallback if no city name is found
      }
     
    } else {
      print('Inga platser hittades vid koordinaterna');
      return "Stockholm"; // fallback if no placemarks are found
    }
  } catch (e) {
    print('Error fetching city: $e');
    return "Stockholm"; // fallback if an error occurs
  }

}
}
