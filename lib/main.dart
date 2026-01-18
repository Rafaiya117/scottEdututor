import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoctt_edututo/config/app_router_config.dart';
import 'package:scoctt_edututo/config/connectivity_state.dart';

void main() {
  runApp(
    const ProviderScope(
      child:MyApp(),
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final router = ref.watch(routerProvider);
  final connectivityAsync = ref.watch(connectivityStatusProvider);

  return ScreenUtilInit(
    designSize: const Size(393, 852),
    minTextAdapt: true,
    builder: (_, __) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        builder: (context, child) {
          return connectivityAsync.when(
            data: (isConnected) {
              return Stack(
                children: [
                  child!,
                  if (!isConnected)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(8.0),
                        child: SafeArea(
                          child: Center(
                            child: Text(
                              'No Internet Connection',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, _) => child!,
          );
        },
      );
    },
  );
}
}

