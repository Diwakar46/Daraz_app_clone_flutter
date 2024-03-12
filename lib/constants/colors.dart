import 'package:flutter/material.dart';

class MyColors {
  static final Color kprimary = Colors.orange.withOpacity(0.1);
  static const Color kprimary2 = Colors.orangeAccent;
  static const Color kscaffold = Color.fromARGB(241, 255, 255, 255);
  static final Color kgrey = Colors.grey.withBlue(100);
  static final Color kred = Colors.red.withOpacity(10);
  static const Color kblack = Color.fromARGB(66, 140, 75, 75);
  static const Color kwhite = Colors.white;
  static const Color kCard = Colors.white70;
  static const Color kOrangeAccent = Colors.orangeAccent;
  static LinearGradient productbgGradient = const LinearGradient(
      colors: [Colors.grey, Colors.white12],
      end: Alignment.bottomCenter,
      begin: Alignment.bottomCenter);
  static Color kcircularProgressIndicator = Colors.orangeAccent;

  static LinearGradient myGradient = LinearGradient(
    colors: [MyColors.kprimary, Colors.orange],
    end: Alignment.bottomCenter,
    begin: Alignment.bottomCenter,
  );
}
