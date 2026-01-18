import 'package:flutter/material.dart';

class AppGradient {
  static const appgradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF000000),
      Color(0xFFD4B579),
    ],
    // stops: [
    //   0.42, 
    //   1.0, 
    // ],
  );
}
