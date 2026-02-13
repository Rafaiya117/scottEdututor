import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// ------------------- Gradient Theme Provider -------------------

class GradientTheme {
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;

  const GradientTheme({
    required this.colors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  });
}


final gradientThemeProvider = StateProvider<GradientTheme>((ref) => const GradientTheme(
  colors: [Color(0xFF252525), Color(0xFFD4B579)],
));

// ------------------- Background Template -------------------

class BackgroundTemplate extends ConsumerWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final Widget? bottomNavigationBar; 

  const BackgroundTemplate({
    super.key,
    this.body,
    this.appBar,
    this.padding,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final gradientTheme = ref.watch(gradientThemeProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: appBar, // optional AppBar
      bottomNavigationBar: bottomNavigationBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientTheme.colors,
            begin: gradientTheme.begin,
            end: gradientTheme.end,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: body ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
