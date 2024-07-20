import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  // Handles the FetchWeather event
  void _onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      print('Fetching current location...');
      final position = await _determinePosition();
      print('Location fetched: ${position.latitude}, ${position.longitude}');
      final weather =
          await _fetchWeather(position.latitude, position.longitude);
      print('Weather fetched: $weather');
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      print('Error: $e');
      emit(WeatherError(message: e.toString()));
    }
  }

  // Determines the current position of the device
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  // Fetches weather data from the OpenWeatherMap API based on latitude and longitude
  Future<Map<String, dynamic>> _fetchWeather(double lat, double lon) async {
    final apiKey = 'c5a08d174456777c9c2bc0f2fbe774d6';
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
