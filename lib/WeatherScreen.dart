import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0.0;

  @override
  Widget build(BuildContext context) {
    temp = ModalRoute.of(context)!.settings.arguments as double;

    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(child: Text(temp.toString())),
    );
  }
}
