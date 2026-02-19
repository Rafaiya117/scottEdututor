import 'package:flutter/material.dart';
Widget animatingDot(double size, double opacity, double delay) {
  return TweenAnimationBuilder<double>(
    tween: Tween(begin: 0.8, end: 1.2),
    duration: Duration(milliseconds: (600 + (delay * 1000)).toInt()), 
    curve: Curves.easeInOut,
    builder: (context, value, child) {
      return Transform.scale(
        scale: value,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF90CAF9).withOpacity(opacity),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF90CAF9).withOpacity(0.4),
                blurRadius: 10 * value,
                spreadRadius: 1,
              )
            ],
          ),
        ),
      );
    },
  );
}