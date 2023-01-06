import 'package:flutter/material.dart';
import 'drink_model.dart';
import 'full_screen.dart';

class NewPage extends StatelessWidget {
  final Drink drink;

  const NewPage({Key? key, required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: const Color.fromARGB(255, 219, 215, 215),
        child: ListView(children: [
          Container(
            margin: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FullScreen(imageUrl: "${drink.image}"),
                      ),
                    );
                  },
                  child: Container(
                    height: 370,
                    width: 310,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("${drink.image}"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 4,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Name: ${drink.name}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const Divider(
                  color: Colors.blueGrey,
                  thickness: 1.5,
                ),
                const SizedBox(height: 5),
                if (drink.category != null)
                  const Text(
                    'Category:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                const SizedBox(height: 10),
                if (drink.category != null)
                  SizedBox(
                      width: 350,
                      child: Text(
                        "${drink.category}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                const Divider(
                  color: Colors.blueGrey,
                  thickness: 1.5,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Instructions:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  child: Text(
                    "${drink.instructions}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  color: Colors.blueGrey,
                  thickness: 1.5,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Glass:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  child: Text(
                    "${drink.glass}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  color: Colors.blueGrey,
                  thickness: 1.5,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ingredient 1:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  child: Text(
                    "${drink.ingredient}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ingredient 2:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  child: Text(
                    "${drink.ingredient1}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                if (drink.ingredient5 != null)
                  const Text(
                    'Ingredient 3:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                const SizedBox(height: 10),
                if (drink.ingredient5 != null)
                  SizedBox(
                    width: 350,
                    child: Text(
                      "${drink.ingredient3}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(height: 20),
                if (drink.ingredient5 != null)
                  const Text(
                    'Ingredient 4:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                const SizedBox(height: 10),
                if (drink.ingredient5 != null)
                  SizedBox(
                    width: 350,
                    child: Text(
                      "${drink.ingredient4}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(height: 20),
                if (drink.ingredient5 != null)
                  const Text(
                    'Ingredient 5:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                const SizedBox(height: 10),
                if (drink.ingredient5 != null)
                  SizedBox(
                    width: 350,
                    child: Text(
                      "${drink.ingredient5}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
