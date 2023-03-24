import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week9demo_weatherapp/WeatherObject.dart';

class Networking {
  static Future<List<String>> getCities(String searchQuere) async {
    http.Response response = await http.get(
        Uri.parse('http://gd.geobytes.com/AutoCompleteCity?&q=$searchQuere'));
    if (response.statusCode == 200) {
      var list = List<String>.from(jsonDecode(response.body));
      return list;
    } else {
      List<String> list = [];
      return list;
    }
  }

  static Future<WeatherObject> getWeather(String city) async {
    WeatherObject weatherObject = WeatherObject();

    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=071c3ffca10be01d334505630d2c1a9c'));
    if (response.statusCode == 200) {
      weatherObject.temp = jsonDecode(response.body)['main']['temp'];
      weatherObject.mainWeather =
          jsonDecode(response.body)['weather'][0]['main'];
      weatherObject.icon = jsonDecode(response.body)['weather'][0]['icon'];
      weatherObject.humidity = jsonDecode(response.body)['main']['humidity'];
      weatherObject.cityName = jsonDecode(response.body)['name'];
    } else {
      weatherObject.temp = 0.0;
      weatherObject.mainWeather = "";
      weatherObject.icon = "";
      weatherObject.humidity = 0;
      weatherObject.cityName = "";
    }
    return weatherObject;
  }

  static Future<WeatherObject> getWeatherInLocation(
      double lon, double lat) async {
    WeatherObject weatherObject = WeatherObject();
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=071c3ffca10be01d334505630d2c1a9c'));
    if (response.statusCode == 200) {
      weatherObject.temp = jsonDecode(response.body)['main']['temp'];
      weatherObject.mainWeather =
          jsonDecode(response.body)['weather'][0]['main'];
      weatherObject.icon = jsonDecode(response.body)['weather'][0]['icon'];
      weatherObject.humidity = jsonDecode(response.body)['main']['humidity'];
      weatherObject.cityName = jsonDecode(response.body)['name'];
    } else {
      weatherObject.temp = 0.0;
      weatherObject.mainWeather = "";
      weatherObject.icon = "";
      weatherObject.humidity = 0;
      weatherObject.cityName = "";
    }
    return weatherObject;
  }
}
