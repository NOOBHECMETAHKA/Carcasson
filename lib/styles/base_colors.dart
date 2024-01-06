import 'package:flutter/material.dart';

const Color blueGamerColor = Color.fromARGB(255, 3, 96, 160);
Color whiteGamerColor = const Color.fromARGB(255, 255, 255, 255);
Color whiteBackgroundColor = const Color.fromARGB(255, 250, 250, 250);
const Color lastUpdateGreyBackgorundColor = Color.fromARGB(255, 230, 230, 230);

//Units colors
const Color yellowUnitColor = Color.fromARGB(255, 211, 204, 31);
const Color blueUnitColor = Color.fromARGB(255, 38, 109, 246);
const Color greenUnitColor = Color.fromARGB(255, 66, 150, 69);
const Color blackUnitColor = Color.fromARGB(255, 32, 32, 32);
const Color redUnitColor = Color.fromARGB(255, 190, 19, 19);

Color getPlayerColor(String color) {
  switch (color) {
    case "Чёрный":
      return blackUnitColor;
    case "Зелёный":
      return greenUnitColor;
    case "Красный":
      return redUnitColor;
    case "Жёлтый":
      return yellowUnitColor;
    case "Синий":
      return blueUnitColor;
  }
  return Colors.pink;
}
