import 'package:dio/dio.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/features/auth/auth_services/auth_models/auth_model.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<LoginResponseModel> login({required String email,required String password,}) async {
    final response = await dio.post(
      '/auth/login/',
      data: {
        "email": email,
        "password": password,
      },
    );

    final model = LoginResponseModel.fromJson(response.data);

    await TokenStorage.saveAuth(model);

    return model;
  }

  Future<void> logout() async {
    await TokenStorage.clear();
  }

  // ---------------- FORGOT PASSWORD (SEND OTP) ----------------
  Future<String> sendForgotPasswordOtp(String email) async {
    final response = await dio.post(
      '/auth/forgot-password/',
      data: {
        "email": email,
      },
    );

    return response.data['detail'] ?? "If this email exists, an OTP has been sent.";
  }

  // ---------------- Verify Otp ----------------
  Future<String> verifyOtp({required String email,required String otp,}) async {
  final response = await dio.post(
    '/auth/verify-otp/',
    data: {
      "email": email,
      "otp": otp,
    },
  );
  return response.data['reset_token'];
}

  // ---------------- Reset passowrd ----------------
  Future<String> resetPassword({required String resetToken,required String newPassword,required String confirmPassword,}) async {
  final response = await dio.post(
    '/auth/reset-password/',
    data: {
      "reset_token": resetToken,
      "new_password": newPassword,
      "confirm_password": confirmPassword,
    },
  );
    return response.data['detail'] ??"Password has been reset successfully.";
  }
}