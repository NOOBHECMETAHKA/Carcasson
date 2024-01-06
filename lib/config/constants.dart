//models
import 'package:carcassonne/models/player_model.dart';

//Название коробки (Hiver хранилища) юнитов
const String savedGameConstant = 'carcassonne';
//Название коробки (Hiver хранилища) истории
const String savedGameResult = 'history';

List<UnitPlayer> getDefaultPlayers() {
  return List.of([
    UnitPlayer("Чёрный", 0, image: 'lib/img/svg/Black-unit.svg'),
    UnitPlayer("Зелёный", 0, image: 'lib/img/svg/Green-unit.svg'),
    UnitPlayer("Красный", 0, image: 'lib/img/svg/Red-unit.svg'),
    UnitPlayer("Жёлтый", 0, image: 'lib/img/svg/Yellow-unit.svg'),
    UnitPlayer("Синий", 0, image: 'lib/img/svg/Blue-unit.svg'),
  ]);
}

//Получения определённого юнита
UnitPlayer getDefaultPlayerByName(String nameUnit) {
  return getDefaultPlayers().where((element) => element.name == nameUnit).first;
}

///Русский словаь месяцов
Map<int, String> russianMonths = {
  1: "Январь",
  2: "Февраль",
  3: "Март",
  4: "Апрель",
  5: "Май",
  5: "Июнь",
  6: "Июль",
  8: "Август",
  9: "Сентябрь",
  10: "Октябрь",
  11: "Ноябрь",
  12: "Декабрь",
};


String formatTime(DateTime time, {bool? separation}) {
  String hour = time.hour.toString().padLeft(2, '0');
  String minute = time.minute.toString().padLeft(2, '0');
  String second = time.second.toString().padLeft(2, '0');
  return separation != null && separation  ? '$hour:$minute:$second | ' : '$hour:$minute:$second';
}
