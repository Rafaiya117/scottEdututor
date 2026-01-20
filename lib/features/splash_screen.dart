import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        context.push('/user_roloe_selection');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundTemplate(
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.png',
          width: 165.w,
          height: 165.h,
        ),
      ),
    );
  }
}
