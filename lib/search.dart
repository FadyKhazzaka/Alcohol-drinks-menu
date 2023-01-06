import 'package:firstapp/api.dart';
import 'package:flutter/material.dart';
import 'drink_model.dart';
import 'new_page.dart';

class SearchDrinks extends SearchDelegate {
  final ApiClient apiClient = ApiClient();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Drink>>(
      future: apiClient.getDrinks(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data;
          return ListView.builder(
            itemCount: results?.length,
            itemBuilder: (context, index) {
              final result = results![index];
              return ListTile(
                title: Text(result.category ?? ''),
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPage(
                        drink: snapshot.data![index],
                      ),
                    ),
                  );
                }),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Drink>>(
      future: apiClient.getDrinks(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data;
          return ListView.builder(
            itemCount: results?.length,
            itemBuilder: (context, index) {
              final result = results![index];
              if (result.name!
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  result.strIngredient2
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase())) {
                return SizedBox(
                  height: 80,
                  width: 20,
                  child: ListTile(
                    title: Text(
                      " ${snapshot.data![index].name}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPage(
                            drink: snapshot.data![index],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }
              return Container();
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
