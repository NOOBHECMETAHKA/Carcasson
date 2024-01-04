import 'package:hive/hive.dart';

part 'player_model.g.dart';

@HiveType(typeId: 0)
class UnitPlayer extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int point = 0;
  @HiveField(2)
  String? image;

  UnitPlayer(this.name, {required int point, this.image});
}
