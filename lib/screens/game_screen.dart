//libs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
//styles
import 'package:carcassonne/styles/base_elements_styles.dart';
import 'package:carcassonne/styles/base_colors.dart';
//configs
import 'package:carcassonne/config/constants.dart';
//models
import 'package:carcassonne/models/player_model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  /// Контроллер текста
  /// * Для начисления и отчисления большого количества очков мгновенно
  TextEditingController pointEditorEditController = TextEditingController();

  /// Значение выбранного элемета
  /// * Скрывает нижнюю панель
  /// * Указывает на выбранного юнита
  int selectedPlayer = -1;

  List<UnitPlayer> players = [];

  List<UnitPlayer> getDefaultPlayers() {
    return List.of([
      UnitPlayer("Чёрный", 0, image: 'lib/img/svg/Black-unit.svg'),
      UnitPlayer("Зелёный", 0, image: 'lib/img/svg/Green-unit.svg'),
      UnitPlayer("Красный", 0, image: 'lib/img/svg/Red-unit.svg'),
      UnitPlayer("Жёлтый", 0, image: 'lib/img/svg/Yellow-unit.svg'),
      UnitPlayer("Синий", 0, image: 'lib/img/svg/Blue-unit.svg'),
    ]);
  }

  @override
  void initState() {
    super.initState();
    setSavedPlayers();
  }

  Future<void> setSavedPlayers() async {
    var unitPlayersBox = await Hive.openBox<UnitPlayer>(savedGameConstant);
    List<UnitPlayer> unitsPlayers = unitPlayersBox.values.toList();
    setState(() {
      players = unitsPlayers.isEmpty ? getDefaultPlayers() : unitsPlayers;
    });
    if (unitsPlayers.isEmpty) await unitPlayersBox.addAll(players);
    await unitPlayersBox.close();
  }

  Future<void> changeValuesPoints(UnitPlayer player) async {
    var unitPlayersBox = await Hive.openBox(savedGameConstant);
    if (unitPlayersBox.isOpen) {
      UnitPlayer playerToUpdate =
          UnitPlayer(player.name, player.point, image: player.image);
      await unitPlayersBox.put(player.key, playerToUpdate);
    }
    if (unitPlayersBox.isOpen) await unitPlayersBox.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedIconButton(
                      icon: Icons.history,
                      onTap: () {},
                    ),
                    RoundedIconButton(
                      icon: Icons.align_horizontal_left,
                      onTap: () {
                        setState(() {
                          players.sort((a, b) => a.point.compareTo(b.point));
                          players = players.reversed.toList();
                          selectedPlayer = -1;
                        });
                      },
                    ),
                    RoundedIconButton(
                      icon: Icons.home_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: pointEditorEditController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLines: 1,
                maxLength: 8,
                readOnly: selectedPlayer == -1,
                style: const TextStyle(
                    fontSize: 20,
                    color: blueGamerColor,
                    fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  border: OutlineInputBorder(gapPadding: 0),
                  hintText: 'Начисления 😁',
                ),
              ),
            ),
          ),
          Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: getPlayerColor(players[index].name),
                              offset: const Offset(0, 4),
                              blurRadius: 0, // Размытие тени
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Material(
                            //Цвет заднего плана рамки
                            color: selectedPlayer == index
                                ? lastUpdateGreyBackgorundColor
                                : whiteBackgroundColor,
                            child: InkWell(
                              //Блок нажатия
                              onTap: () {
                                setState(() {
                                  selectedPlayer = index;
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  selectedPlayer = -1;
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            players[index].image!,
                                            height: 75,
                                          ),
                                          Text(
                                            players[index].name,
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: getPlayerColor(
                                                    players[index].name)),
                                          ),
                                          Text(
                                            players[index].point.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color: getPlayerColor(
                                                    players[index].name)),
                                          )
                                        ]),
                                  )),
                            ),
                          ),
                        ),
                      );
                    }),
              )),
          selectedPlayer != -1
              ? Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getPlayerLabel(players[selectedPlayer].name),
                        Row(
                          children: [
                            /// Кнопка добавления очков
                            /// Если в поле "Начисления" введено значение, то количество очков увеличится
                            /// Если пусто прибавится 1
                            RoundedIconButton(
                                icon: Icons.add,
                                onTap: () {
                                  setState(() {
                                    int? points = int.tryParse(
                                        pointEditorEditController.text);
                                    if (points != null) {
                                      players[selectedPlayer].point =
                                          players[selectedPlayer].point +
                                              points;
                                    } else {
                                      players[selectedPlayer].point++;
                                    }
                                    pointEditorEditController.text = "";
                                  });
                                  changeValuesPoints(players[selectedPlayer]);
                                }),
                            RoundedIconButton(
                                icon: Icons.remove,
                                onTap: () {
                                  setState(() {
                                    int? points = int.tryParse(
                                        pointEditorEditController.text);
                                    if (points != null) {
                                      if (players[selectedPlayer].point -
                                              points <
                                          0) {
                                        players[selectedPlayer].point = 0;
                                      } else{
                                        players[selectedPlayer].point = 
                                        players[selectedPlayer].point - points;
                                      }
                                    } else if (players[selectedPlayer].point !=
                                        0) {
                                      players[selectedPlayer].point--;
                                    } 
                                  });
                                  changeValuesPoints(players[selectedPlayer]);
                                }),
                          ],
                        )
                      ],
                    ),
                  ))
              : const Text('...'),
        ],
      ),
    );
  }

  Container getPlayerLabel(String playerName) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: getPlayerColor(playerName), width: 5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          playerName,
          style: TextStyle(fontSize: 24, color: getPlayerColor(playerName)),
        ),
      ),
    );
  }
}