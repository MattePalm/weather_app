this project is not finished!! and the readme is for the current situation and will be updated with the code

Weather App 🌦️
A simple weather app built with Flutter. This app is a portfolio project and demonstrates how to use environment variables with .env to keep the API key secure without including it in the GitHub source code.

Features
Fetches weather data from a weather API service (e.g., OpenWeatherMap).
Displays weather information based on the user's location.

Run the following command to install all required Flutter packages:
flutter pub get

Add a .env File
Since the .env file is included in .gitignore, it won't be in this repo. To run the project, you need to create your own .env file with your API key.
The API key is free and accessible from "https://openweathermap.org".
The app uses flutter_dotenv to load the API key from the .env file.

Create a .env file in the root directory of the project.
Add the following lines, replacing your_api_key with your actual API key:
API_KEY=your_api_key
BASE_URL=https://api.openweathermap.org/data/2.5/weather?


