import 'package:flutter/material.dart';
import 'package:week9demo_weatherapp/LocationManager.dart';
import 'package:week9demo_weatherapp/Networking.dart';
import 'package:week9demo_weatherapp/WeatherObject.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  void goToSearch(BuildContext context) {
    Navigator.pushNamed(context, '/search');
  }

  void getLocation(BuildContext context) async {
    WeatherObject weatherObject = WeatherObject();
    LocationManager locationManager = LocationManager();
    await locationManager.getLocation();
    weatherObject = await Networking.getWeatherInLocation(
        locationManager.longitude, locationManager.latitude);
    print(locationManager.latitude);
    print(locationManager.longitude);
    Navigator.pushNamed(context, '/weather', arguments: weatherObject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                goToSearch(context);
              },
              child: const Text('Search For Cities')),
          ElevatedButton(
              onPressed: () {
                getLocation(context);
              },
              child: const Text('Get Weather In Current Location')),
        ],
      )),
    );
  }
}
