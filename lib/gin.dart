import 'package:firstapp/api.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'drink_model.dart';
import 'full_screen.dart';
import 'new_page.dart';

class Gin extends StatefulWidget {
  const Gin({super.key});

  @override
  State<Gin> createState() => _AllDrinksState();
}

class _AllDrinksState extends State<Gin> {
  ApiClient apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Drink>>(
        future: apiClient.getDrinks('gin'),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Text(
              'LOADING...',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            );
          } else {
            return SizedBox(
              child: ListView.builder(
                padding: const EdgeInsets.all(4),
                itemCount: snapshot.data!.length,
                prototypeItem: const ListTile(),
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPage(
                                drink: snapshot.data![i],
                              ),
                            ),
                          );
                        }),
                        leading: GestureDetector(
                          child: SizedBox(
                            width: 48,
                            height: 48,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3, color: Colors.blueGrey),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${snapshot.data?[i].image}"),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreen(
                                    imageUrl:
                                        "${snapshot.data?[i].image}"),
                              ),
                            );
                          },
                        ),
                        title: Text(
                          "Name: ${snapshot.data![i].name}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing:
                            Text("ID: ${snapshot.data?[i].id ?? ""}"),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
