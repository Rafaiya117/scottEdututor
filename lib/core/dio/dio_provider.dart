import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
});
