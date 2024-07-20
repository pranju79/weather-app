# Weather App

This Flutter project is designed to provide users with a seamless onboarding experience, followed by login and registration functionality. After successful login, the app displays the user's current location weather details using the OpenWeather API. The app is developed using the Bloc pattern and integrates various dependencies for functionality. Additionally, the app is responsive and works across all device sizes.

• Dependencies
<br/>The following dependencies are used in this project:
<br/>1. flutter_bloc: State management using the Bloc pattern.
<br/>2. http: For making network requests to the OpenWeather API.
<br/>3. geolocator: For accessing the device's location services.

• Getting Started
<br/>Prerequisites
<br/>Ensure you have Flutter installed on your machine. If not, follow the instructions on the official Flutter installation guide.

Installation
1. Clone the repository:
<br/>git clone https://github.com/pranju79/weather-app.git
<br/>cd weather-app

2. Install the dependencies:
<br/>flutter pub get

3. Running the App
<br/>Before running the app, make sure to enable location services on your device or emulator.
<br/>Connect your device or start an emulator.
<br/>Run the app:
<br/>flutter run

• API Integration
<br/>This project uses the OpenWeather API to fetch weather data. 
<br/>Make sure to replace the placeholder API key in the code with your own OpenWeather API key.
<br/>const String apiKey = 'YOUR_API_KEY';

• Responsive Design
<br/>The app is designed to be responsive and works seamlessly across all device sizes:
<br/>Mobile: width < 600
<br/>Tablet: 600 <= width < 1024
<br/>Desktop: width >= 1024








