import 'package:carcassonne/config/constants.dart';
import 'package:carcassonne/models/action_points_model.dart';
import 'package:carcassonne/models/player_model.dart';
import 'package:carcassonne/styles/base_colors.dart';
import 'package:carcassonne/styles/base_elements_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:carcassonne/config/constants.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<ActionPoints> actions = [];

  ///Инициалзиция виджета
  @override
  void initState() {
    super.initState();
    _setSavedActions();
  }

  Future<void> _setSavedActions() async {
    var actionsBox = await Hive.openBox<ActionPoints>(savedGameResult);
    setState(() {
      actions = actionsBox.values.toList();
      actions.sort((a, b) => b.createAt.compareTo(a.createAt));
    });
    await actionsBox.close();
  }

  List<Widget> getBeautifulLabel(ActionPoints action) {
    List<Widget> collectionLabel = [];
    UnitPlayer player = getDefaultPlayerByName(action.namePlayer);

    collectionLabel.add(Text(formatTime(action.createAt, separation: true),
        style: middleBlueLabelBold));
    if (player.image != null) {
      collectionLabel.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SvgPicture.asset(
          player.image!,
          height: 24,
        ),
      ));
    }
    collectionLabel.add(Text("${player.name} | ", style: middleBlueLabelBold));
    collectionLabel.add(Text(
        "${action.isNegative ? "-" : "+"}${action.countPoint} ",
        style: middleBlueLabelBold));
    collectionLabel.add(Text(
        "(${lowerThreeSymbols(russianMonths[action.createAt.month].toString())})",
        style: middleGreyLabelBold));
    return collectionLabel;
  }

  Future<void> _clearHistory() async {
    var actionsPointsBox = await Hive.openBox(savedGameResult);
    if (actionsPointsBox.isOpen) {
      actionsPointsBox.deleteFromDisk();
      setState(() {
        actions.clear();
      });
    }
    //if (actionsPointsBox.isOpen) await actionsPointsBox.close();
  }

  String lowerThreeSymbols(String stringToEdit) {
    return stringToEdit.toLowerCase().substring(0, 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RoundedIconButton(
                        icon: Icons.auto_delete,
                        onTap: () {
                          _clearHistory();
                        },
                      ),
                      // RoundedIconButton(
                      //   icon: Icons.refresh_rounded,
                      //   onTap: () {},
                      // ),
                      RoundedIconButton(
                        icon: Icons.videogame_asset,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )),
              Expanded(
                  flex: 10,
                  child: actions.isEmpty
                      ? const Center(
                          child: Text("История пуста!",
                              style: buttonContentBigTextStyle),
                        )
                      : ListView.builder(
                          itemCount: actions.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: whiteBackgroundColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: blueGamerColor,
                                      offset: Offset(0, 4),
                                      blurRadius: 0, // Размытие тени
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          getBeautifulLabel(actions[index])),
                                ),
                              ),
                            );
                          }))
            ]),
      ),
    );
  }
}
