import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/dio/dio_provider.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/features/auth/auth_services/auth_models/auth_model.dart';
import 'package:scoctt_edututo/features/auth/auth_services/service/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.read(dioProvider);
  return AuthService(dio);
});

final authProvider = FutureProvider<LoginResponseModel?>((ref) async {
  return await TokenStorage.getAuth();
});