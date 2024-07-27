import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 104, 104, 104),  // Almost black
      Color.fromARGB(255, 66, 66, 66),  // Dark gray
      Color(0xFF121212),  // Almost black
    ],
  );
}