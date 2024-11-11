import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/services/weather_service.dart';

import 'weather_page.dart';
Future<void> main() async {
  await dotenv.load(); // Load .env-filen
 
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
 const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}