import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButton extends ConsumerWidget{
  final String buttontext;
  final Color buttonColor;
  final Color buttonTextColor;
  final double buttonWidth;
  final double buttonHeight;

  const CustomButton({
    super.key,
    required this.buttontext,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.buttonHeight,
    required this.buttonWidth
  });

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold();
  }
}