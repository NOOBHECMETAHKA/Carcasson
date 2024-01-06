//libs
import 'package:carcassonne/config/constants.dart';
import 'package:carcassonne/models/player_model.dart';
import 'package:flutter/material.dart';
//styles
import 'package:carcassonne/styles/base_elements_styles.dart';
import 'package:carcassonne/styles/base_colors.dart';
//configs
import 'package:carcassonne/config/routes.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Метод создания новой игры
  Future<void> newGameUnits() async {
    var unitPlayersBox = await Hive.openBox<UnitPlayer>(savedGameConstant);
    await unitPlayersBox.clear();
    await unitPlayersBox.addAll(getDefaultPlayers());
    await unitPlayersBox.close();
    return;
  }

  Future<void> _clearHistory() async {
    var actionsPointsBox = await Hive.openBox(savedGameResult);
    if (actionsPointsBox.isOpen) {
      actionsPointsBox.deleteFromDisk();
    }
    if (actionsPointsBox.isOpen) await actionsPointsBox.close();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [blueGamerColor, whiteBackgroundColor],
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
                  onPressed: () {
                    Navigator.pushNamed(context, gameRoute);
                  },
                  style: buttonPrimaryStyle,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    child: Text(
                      "Продолжить",
                      style: buttonContentPrimaryStyle,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await newGameUnits();
                  await _clearHistory();
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, gameRoute);
                },
                style: buttonPrimaryStyle,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
