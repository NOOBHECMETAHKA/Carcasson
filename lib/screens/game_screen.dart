import 'package:flutter/material.dart';
import 'package:carcassonne/styles/base_elements_styles.dart';
import 'package:carcassonne/styles/base_colors.dart';

import 'package:carcassonne/models/player_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextEditingController pointEditor = TextEditingController();

  int selectedPlayer = -1;

  List<UnitPlayer> players = List.of([
    UnitPlayer("Чёрный", point: 0, image: 'lib/img/svg/Black-unit.svg'),
    UnitPlayer("Зелёный", point: 0, image: 'lib/img/svg/Green-unit.svg'),
    UnitPlayer("Красный", point: 0, image: 'lib/img/svg/Red-unit.svg'),
    UnitPlayer("Жёлтый", point: 0, image: 'lib/img/svg/Yellow-unit.svg'),
    UnitPlayer("Синий", point: 0, image: 'lib/img/svg/Blue-unit.svg'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedIconButton(
                      icon: Icons.align_horizontal_left,
                      onTap: () {},
                    ),
                    RoundedIconButton(
                      icon: Icons.home_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              )),
          Expanded(flex: 1, child: TextField(
            keyboardType: TextInputType.number,
          )),
          Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                              onLongPress: () {
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
                  flex: 1,
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
                            RoundedIconButton(
                                icon: Icons.add,
                                onTap: () {
                                  setState(() {
                                    players[selectedPlayer].point++;
                                  });
                                }),
                            RoundedIconButton(
                                icon: Icons.remove,
                                onTap: () {
                                  setState(() {
                                    if (players[selectedPlayer].point != 0) {
                                      players[selectedPlayer].point--;
                                    }
                                  });
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

//===Outher Styles

class TwoColumnList extends StatelessWidget {
  const TwoColumnList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index'),
          subtitle: Text('Subtitle $index'),
          leading: Icon(Icons.list),
          onTap: () {
            print('Tapped on Item $index');
          },
        );
      },
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const RoundedIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: blueGamerColor,
              offset: Offset(0, 4),
              blurRadius: 0, // Размытие тени
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
            color: whiteBackgroundColor,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  icon,
                  size: 36.0,
                  color: blueGamerColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
