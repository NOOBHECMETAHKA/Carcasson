//libs
import 'package:flutter/material.dart';
//screens
import 'package:carcassonne/screens/game_screen.dart';
import 'package:carcassonne/screens/home_screen.dart';
import 'package:carcassonne/screens/history_screen.dart';
import 'package:carcassonne/screens/setting_screen.dart';

//Главная страница home_screen.dart
const String homeRoute = '/';
//Страница счётчика game_screen.dart
const String gameRoute = '/home';
//Страница истории
const String historyRoute = '/history';
//Страница настроек
const String settingsRoute = '/settings';

//Маршрутизатор
Map<String, WidgetBuilder> routeCarcasonne = {
  homeRoute: (context) => const HomeScreen(),
  gameRoute: (context) => const GameScreen(),
  settingsRoute: (context) => const SettingsScreen(),
  historyRoute: (context) => const HistoryScreen(),
};
