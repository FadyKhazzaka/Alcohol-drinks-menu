import 'package:firstapp/all_drinks.dart';
import 'package:firstapp/api.dart';
import 'package:firstapp/gin.dart';
import 'package:firstapp/search.dart';
import 'package:firstapp/vodka.dart';

import 'package:firstapp/wine.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

import 'google_map.dart';

@override
Widget buildSuggestions(BuildContext context) {
  return Container();
}


// ignore: camel_case_types
class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
}

// ignore: camel_case_types
class _pageState extends State<page> with TickerProviderStateMixin {
  ApiClient apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(
      length: 5,
      vsync: this,
    );

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: const [
            Tab(
              text: 'All Drinks',
              icon: Icon(
                Icons.local_drink,
                size: 25,
                color: Colors.black,
              ),
            ),
            Tab(
              text: 'Gin',
              icon: Icon(
                Icons.local_bar,
                size: 25,
                color: Colors.black,
              ),
            ),
            Tab(
              text: 'Vodka',
              icon: Icon(
                Icons.local_drink_rounded,
                size: 25,
                color: Colors.black,
              ),
            ),
            Tab(
              text: 'Wine',
              icon: Icon(
                Icons.wine_bar,
                size: 25,
                color: Colors.black,
              ),
            ),
            Tab(
              text: 'Map',
              icon: Icon(
                Icons.wine_bar,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final searchQuery =
                  await showSearch(context: context, delegate: SearchDrinks());
              print(searchQuery);
            },
            icon: const Icon(
              Icons.search,
              size: 33,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 219, 215, 215),
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/1283219/pexels-photo-1283219.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                      fit: BoxFit.fill),
                ),
                child: Text(''),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home', style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.pushNamed(context, 'homePage');
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings', style: TextStyle(fontSize: 18)),
                onTap: () {
                  //Navigator.pushNamed(context, 'allDrinks');
                },
              ),
              const Divider(),
              ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Log Out', style: TextStyle(fontSize: 18)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  }),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 219, 215, 215),
        child: DefaultTabController(
          length: 5,
          child: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    AllDrinks(),
                    Gin(),
                    Vodka(),
                    Wine(),
                    GoogleMap(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
