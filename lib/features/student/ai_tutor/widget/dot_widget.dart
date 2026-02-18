import 'package:flutter/material.dart';

// Widget buildDot(double size, double opacity) {
//   return Container(
//     width: size,
//     height: size,
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       color: const Color(0xFF90CAF9).withOpacity(opacity), // Light blue from image
//       boxShadow: [
//         BoxShadow(
//           color: const Color(0xFF90CAF9).withOpacity(0.3),
//           blurRadius: 8,
//           spreadRadius: 2,
//         )
//       ],
//     ),
//   );
// }

Widget animatingDot(double size, double opacity, double delay) {
  return TweenAnimationBuilder<double>(
    tween: Tween(begin: 0.8, end: 1.2),
    duration: const Duration(milliseconds: 600),
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