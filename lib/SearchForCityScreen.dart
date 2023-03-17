import 'package:flutter/material.dart';

import 'SearchDelegate.dart';

class SearchForCityScreen extends StatefulWidget {
  const SearchForCityScreen({super.key});

  @override
  State<SearchForCityScreen> createState() => _SearchForCityScreenState();
}

class _SearchForCityScreenState extends State<SearchForCityScreen> {
  var list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search For Cities'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CitiesSearchDelegate());
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: ((context, index) {
            return ListTile(title: Text(list.elementAt(index)));
          }),
        ));
  }
}
