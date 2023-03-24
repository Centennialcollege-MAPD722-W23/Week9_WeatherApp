import 'package:flutter/material.dart';
import 'package:week9demo_weatherapp/WeatherObject.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherObject weatherObject =
        ModalRoute.of(context)!.settings.arguments as WeatherObject;
    var icon = weatherObject.icon;
    var imageURL = "https://openweathermap.org/img/wn/$icon@2x.png";
    print(icon);
    return Scaffold(
        appBar: AppBar(title: Text('Weather Details')),
        body: Container(
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: Column(children: [
                Stack(
                  children: <Widget>[
                    Image.network(imageURL,
                        height: 250, width: double.infinity, fit: BoxFit.cover),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      Text(weatherObject.cityName,
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                          )),
                      Text("TEMP:${weatherObject.temp}",
                          style: const TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                          )),
                      Text("Humidity:${weatherObject.humidity}",
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
              ]),
            )));
  }
}
