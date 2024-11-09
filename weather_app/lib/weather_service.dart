//this handles tghe api call to the open weather api
import 'package:flutter_dotenv/flutter_dotenv.dart';

void envInformation() async {
  await dotenv.load(); 

 
  print("API Key: ${dotenv.env['API_KEY']}");
  print ("inne i weatherservice main");
}