import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/admin/user/user_model.dart';

class UserController extends StateNotifier<List<AppUser>> {
  UserController() : super([
    AppUser(name: 'Emma Rodriguez', email: 'vgyyug@gmail.com', role: 'Admin'),
    AppUser(name: 'Emma Rodriguez', email: 'vgyyug@gmail.com', role: 'Student'),
    AppUser(name: 'Emma Rodriguez', email: 'vgyyug@gmail.com', role: 'Parent'),
    AppUser(name: 'Emma Rodriguez', email: 'vgyyug@gmail.com', role: 'Teacher'),
  ]);

  // Add logic here for future features like delete or search
  void addUser(AppUser user) {
    state = [...state, user];
  }
}