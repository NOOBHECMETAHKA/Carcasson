//models
import 'package:carcassonne/models/player_model.dart';

const String savedGameConstant = 'carcassonne';

List<UnitPlayer> getDefaultPlayers() {
  return List.of([
    UnitPlayer("Чёрный", 0, image: 'lib/img/svg/Black-unit.svg'),
    UnitPlayer("Зелёный", 0, image: 'lib/img/svg/Green-unit.svg'),
    UnitPlayer("Красный", 0, image: 'lib/img/svg/Red-unit.svg'),
    UnitPlayer("Жёлтый", 0, image: 'lib/img/svg/Yellow-unit.svg'),
    UnitPlayer("Синий", 0, image: 'lib/img/svg/Blue-unit.svg'),
  ]);
}

UnitPlayer getDefaultPlayerByName(String nameUnit) {
  return getDefaultPlayers().where((element) => element.name == nameUnit).first;
}
