import 'package:flutter/material.dart';

class AppGradient {
  static final appgradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFFD4B579).withValues(alpha: 0.58),
      const Color(0xFF252525),
    ],
    // stops: [
    //   0.42, 
    //   1.0, 
    // ],
  );
}
