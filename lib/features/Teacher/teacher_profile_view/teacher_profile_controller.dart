import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoctt_edututo/core/componets/cusmon_snackbar.dart';
import 'package:scoctt_edututo/core/dio/dio_provider.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';

class TeacherProfileController {
  final nameCtrl = TextEditingController(text: 'Emma Jonson');
  final id = TextEditingController(text: '123456');
  final emailCtrl = TextEditingController(text: 'emmajohnson@email.com');
  final phoneCtrl = TextEditingController(text: '123456789');
  File? profileImageFile;

  Future<void> fetchProfile(WidgetRef ref) async {
    try {
      final dio = ref.read(dioProvider);
      final auth = await TokenStorage.getAuth();
      final token = auth?.access;

      final response = await dio.get(
        '/teacher/teacher/get_profile/', 
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      final data = response.data;

      nameCtrl.text = "${data['first_name']} ${data['last_name']}";
      id.text = data['id'].toString();
      emailCtrl.text = data['email'] ?? "";
      phoneCtrl.text = data['phone'] ?? "";
    } catch (e) {
      debugPrint("Profile fetch error: $e");
    }
  }

  //!---------- Image Pickere ------------!
    Future<void> pickProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImageFile = File(pickedFile.path);
    }
  }

  //!-------- Update profile ----------!
  Future<void> updateProfile(WidgetRef ref, BuildContext context) async {
    try {
      final dio = ref.read(dioProvider);
      final auth = await TokenStorage.getAuth();
      final token = auth?.access;

      final formData = FormData.fromMap({
        "first_name": nameCtrl.text.split(' ').first,
        "last_name": nameCtrl.text.split(' ').length > 1
        ? nameCtrl.text.split(' ').last: '',
        "phone": phoneCtrl.text,
        if (profileImageFile != null)
          "profile_photo": await MultipartFile.fromFile(profileImageFile!.path),
      });

      final response = await dio.put(
        '/teacher/teacher/profile/update/',
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      showCustomSnackBar(
        context,
        response.data['detail'] ?? "Profile updated successfully",
        CustomSnackType.success,
      );
    } catch (e) {
      showCustomSnackBar(
        context,
        "Failed to update profile: $e",
        CustomSnackType.error,
      );
    }
  }
}
