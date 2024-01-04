import 'package:flutter/material.dart';
import 'package:carcassonne/styles/base_elements_styles.dart';
import 'package:carcassonne/styles/base_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [blueGamerColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('lib/img/units_without_background.png'),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: buttonPrimaryStyle,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    child: Text(
                      "Продолжить",
                      style: buttonContentPrimaryStyle,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: buttonPrimaryStyle,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  child: Text(
                    "Новая игра",
                    style: buttonContentPrimaryStyle,
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Сделано Mishka',
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          )
        ],
      )),
    );
  }
}
