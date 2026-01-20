import 'package:flutter/material.dart';

class SettingsItemModel {
  final String svgIconPath;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  SettingsItemModel({
    required this.svgIconPath,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
}

