import 'dart:convert';
import 'package:http/http.dart' as http;
import 'drink_model.dart';

class ApiClient {
  Future<List<Drink>> getDrinks(String? drinkCategories) async {
    final response = await http.get(Uri.https('thecocktaildb.com',
        '/api/json/v1/1/search.php', {'s': drinkCategories ?? ''}));

    if (response.statusCode == 200) {
      List data = (json.decode(response.body)['drinks'] as List);
      List<Drink> newList = [];
      for (int i = 0; i < data.length; i++) {
        newList.add(Drink.fromJson(data[i]));
      }
      return newList;
    } else {
      throw Exception('Failed to Load');
    }
  }
}
