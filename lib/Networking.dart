import 'dart:convert';

import 'package:http/http.dart' as http;

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

  static Future<double> getWeather(String city) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=071c3ffca10be01d334505630d2c1a9c'));
    if (response.statusCode == 200) {
      double temp = jsonDecode(response.body)['main']['temp'];
      String des = jsonDecode(response.body)['weather'][0]['main'];
      String icon = jsonDecode(response.body)['weather'][0]['icon'];
      int visibility = jsonDecode(response.body)['visibility'];

      return temp;
    } else {
      double temp = -300;
      return temp;
    }
  }
}
