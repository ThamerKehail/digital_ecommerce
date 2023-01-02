import 'package:flutter/material.dart';

class ProductSearch extends SearchDelegate<String> {
  List x;
  ProductSearch(this.x);
  final cities = [
    "Amman",
    "Zarqa",
    "Irbid",
    "Ajloun",
    "Aqaba",
    "Maan",
    "Tafila",
    "Petra",
    "mafraq",
    "ratha",
    "Salt",
    "jerash",
    "karak",
  ];
  final recentCity = [
    "mafraq",
    "ratha",
    "Salt",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: null,
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggessionList = query.isEmpty ? recentCity : x;
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.location_city),
          title: Text(suggessionList[index]),
        );
      },
      itemCount: suggessionList.length,
    );
  }
}
