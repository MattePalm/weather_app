

Weather App 🌦️

A simple weather app built with Flutter. This app is a portfolio project and demonstrates how to use environment variables with .env to keep the API key secure without including it in the GitHub source code.

Features

Fetches weather data from the OpenWeatherMap API.

Displays weather information based on the user's current location.

Provides animations based on current weather conditions.


Supported Weather Animations

The application currently provides animations for the following weather conditions:

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

The animations are downloaded from LottieFiles.

Installation

1. Clone the Project

Clone the repository to your local machine:

git clone https://github.com/your-username/weather_app.git
cd weather_app

2. Install Dependencies

Run the following command to install all required Flutter packages:

flutter pub get

3. Add a .env File

Since the .env file is included in .gitignore, it won't be available in this repo. To run the project, you need to create your own .env file with your API key.

1. Get a free API key from OpenWeatherMap.


2. Create a .env file in the root directory of the project.


3. Add the following lines, replacing your_api_key with your actual API key:

API_KEY=your_api_key
BASE_URL=https://api.openweathermap.org/data/2.5/weather?



The app uses flutter_dotenv to load the API key from the .env file.

4. Run the App

After setting up the .env file and installing dependencies, run the app with:

flutter run


This project is in its testing phase and is provided as a portfolio demonstration.


---

