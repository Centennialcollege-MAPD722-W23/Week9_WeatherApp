import 'package:flutter/material.dart';
import 'package:week9demo_weatherapp/Networking.dart';
import 'package:week9demo_weatherapp/WeatherObject.dart';

class CitiesSearchDelegate extends SearchDelegate {
  List<String> citiesList = [];
  WeatherObject weatherObject = WeatherObject();

  Future getAllCities(String q) async {
    var list = await Networking.getCities(q);
    citiesList = List<String>.from(list).toList();
  }

  Future getWeatherInCity(String c, BuildContext context) async {
    weatherObject = await Networking.getWeather(c);
    Navigator.pushNamed(context, '/weather', arguments: weatherObject);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: getAllCities(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: citiesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(citiesList.elementAt(index)),
                  onTap: () {
                    final splitted = citiesList
                        .elementAt(index)
                        .split(' '); // ['Toronto', ' ON', ' United State']
                    var fullCityName = "";
                    for (int i = 0; i < splitted.length; i++) {
                      fullCityName += splitted[i].trimLeft();
                    }
                    getWeatherInCity(fullCityName, context);
                  },
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: getAllCities(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: citiesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(citiesList.elementAt(index)),
                  onTap: () {
                    final splitted = citiesList
                        .elementAt(index)
                        .split(' '); // ['Toronto', ' ON', ' United State']
                    var fullCityName = "";
                    for (int i = 0; i < splitted.length; i++) {
                      fullCityName += splitted[i].trimLeft();
                    }
                    getWeatherInCity(fullCityName, context);
                  },
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
