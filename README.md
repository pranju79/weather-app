# Weather App

This Flutter project is designed to provide users with a seamless onboarding experience, followed by login and registration functionality. After successful login, the app displays the user's current location weather details using the OpenWeather API. The app is developed using the Bloc pattern and integrates various dependencies for functionality. Additionally, the app is responsive and works across all device sizes.

• Features
Onboarding Pages
User Authentication (Login and Registration)
Weather Information of User's Current Location
Location Services Integration
Responsive Design for All Devices

• Dependencies
The following dependencies are used in this project:
flutter_bloc: State management using the Bloc pattern.
http: For making network requests to the OpenWeather API.
geolocator: For accessing the device's location services.

• Getting Started
Prerequisites
Ensure you have Flutter installed on your machine. If not, follow the instructions on the official Flutter installation guide.

Installation
1. Clone the repository:
git clone https://github.com/pranju79/weather-app.git
cd weather_app

2. Install the dependencies:
flutter pub get

3. Running the App
Before running the app, make sure to enable location services on your device or emulator.
Connect your device or start an emulator.
Run the app:
flutter run

• API Integration
This project uses the OpenWeather API to fetch weather data. Make sure to replace the placeholder API key in the code with your own OpenWeather API key.
const String apiKey = 'YOUR_API_KEY';

• Responsive Design
The app is designed to be responsive and works seamlessly across all device sizes:
Mobile: width < 600
Tablet: 600 <= width < 1024
Desktop: width >= 1024








