import 'package:firstapp/gin.dart';
import 'package:firstapp/home_page.dart';
import 'package:firstapp/login_page.dart';


// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'all_drinks.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => const Login(),
        'homePage': (context) => const page(),
        'allDrinks': (context) => const AllDrinks(),
        'gin': (context) => const Gin(),
      
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
