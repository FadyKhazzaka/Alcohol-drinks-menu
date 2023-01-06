import 'package:getwidget/getwidget.dart';

import 'package:firstapp/home_page.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      } else if (value != 'fady') {
                        return 'Wrong name';
                      }
                    },
                    autocorrect: false,
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value != 'fady') {
                        return 'Wrong password';
                      }
                    },
                    autocorrect: false,
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const page();
                        }));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          Row(
            children: const [
              SizedBox(
                width: 30,
              ),
              GFButton(
                padding: EdgeInsets.all(9),
                size: 100,
                color: Colors.blueGrey,
                onPressed: null,
                text: "",
                icon: Icon(
                  Icons.facebook,
                  size: 80,
                  color: Colors.black,
                ),
                shape: GFButtonShape.pills,
              ),
              SizedBox(
                width: 20,
              ),
              GFButton(
                padding: EdgeInsets.all(9),
                size: 100,
                color: Colors.blueGrey,
                onPressed: null,
                text: "",
                icon: Icon(
                  Icons.snapchat,
                  size: 80,
                  color: Colors.black,
                ),
                shape: GFButtonShape.pills,
              ),
              SizedBox(
                width: 20,
              ),
              GFButton(
                padding: EdgeInsets.all(4),
                blockButton: false,
                size: 100,
                color: Colors.blueGrey,
                onPressed: null,
                text: "",
                icon: Icon(
                  Icons.whatsapp,
                  size: 80,
                  color: Colors.black,
                ),
                shape: GFButtonShape.pills,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
