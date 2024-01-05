import 'package:carcassonne/providers/theme_provider.dart';
import 'package:carcassonne/styles/base_elements_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        Expanded(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RoundedIconButton(
              icon: Icons.theater_comedy,
              onTap: () {
                context.read<ThemeProvider>().toggleTheme();
              },
            ),
            RoundedIconButton(
              icon: Icons.cast,
              onTap: () {
                
              },
            ),
            RoundedIconButton(
              icon: Icons.videogame_asset,
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ))
      ]),
    );
  }
}
