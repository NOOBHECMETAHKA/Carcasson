//libs
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
//configs
import 'package:carcassonne/config/routes.dart';
//models
import 'package:carcassonne/models/player_model.dart';
import 'package:carcassonne/models/action_points_model.dart';
//providers
import 'package:carcassonne/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UnitPlayerAdapter());
  Hive.registerAdapter(ActionPointsAdapter());
  runApp(ChangeNotifierProvider(create: (context) => ThemeProvider(), lazy: false,
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Не рабочая шняга
      theme: Provider.of<ThemeProvider>(context).themeData, //Контроллер тем
      initialRoute: homeRoute, //Инициализация главной страницы
      routes: routeCarcasonne, //Подключение именованных маршрутов
    );
  }
}
