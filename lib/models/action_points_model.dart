import 'package:hive/hive.dart';

part 'action_points_model.g.dart';

@HiveType(typeId: 1)
class ActionPoints extends HiveObject {
  @HiveField(0)
  DateTime createAt;
  @HiveField(1)
  int countPoint;
  @HiveField(2)
  String namePlayer;

  ActionPoints(this.createAt, this.countPoint, this.namePlayer);
}
