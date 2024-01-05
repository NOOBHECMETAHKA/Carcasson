import 'package:flutter/material.dart';
import 'base_colors.dart';

final ButtonStyle buttonPrimaryStyle = ElevatedButton.styleFrom(
    primary: blueGamerColor,
    elevation: 0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))));

const TextStyle buttonContentPrimaryStyle = TextStyle(
    color: whiteGamerColor, fontSize: 26, fontWeight: FontWeight.w600);

final ButtonStyle buttonIconsStyle = ElevatedButton.styleFrom(
  shadowColor: blueGamerColor,
    primary: whiteBackgroundColor,
    elevation: 0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))));

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const RoundedIconButton({super.key, required this.icon, required this.onTap});

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
