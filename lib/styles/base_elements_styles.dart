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