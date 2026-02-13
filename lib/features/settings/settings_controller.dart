import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/features/settings/settings_model.dart';
import 'package:scoctt_edututo/features/user_role/user_role_model.dart';

class SettingsController {
  List<SettingsItemModel> getItems(BuildContext context, UserRoleType roleType) {
    return [
      SettingsItemModel(
        svgIconPath: 'assets/icons/key.svg',
        title: 'Change Password',
        subtitle: 'Update your account password',
        onTap: () {
          // Switch case for Change Password routing
          switch (roleType) {
            case UserRoleType.teacher:
              context.push('/teacher_change_password');
              break;
            case UserRoleType.parent:
              context.push('/change_password'); 
              break;
            case UserRoleType.student:
              context.push('/student_change_password');
              break;
            default:
              context.push('/change_password');
          }
        },
      ),
      SettingsItemModel(
        svgIconPath: 'assets/icons/user.svg',
        title: 'Personal information',
        subtitle: 'Update your profile details',
        onTap: () {
          // Switch case for Personal Information routing
          switch (roleType) {
            case UserRoleType.parent:
              context.push('/edit_parents_profile');
              break;
            case UserRoleType.teacher:
              context.push('/edit_teacher_profile');
              break;
            case UserRoleType.student:
              context.push('/edit_student_profile');
              break;
            default:
              context.push('/profile_details');
          }
        },
      ),
      SettingsItemModel(
        svgIconPath: 'assets/icons/help.svg',
        title: 'Privacy & Policy',
        subtitle: 'Get help with your account',
        onTap: () => context.push('/privacy'),
      ),
      SettingsItemModel(
        svgIconPath: 'assets/icons/termcondition.svg',
        title: 'Terms & Condition',
        subtitle: 'Read our terms and privacy policy',
        onTap: () => context.push('/terms'),
      ),
      SettingsItemModel(
        svgIconPath: 'assets/icons/logout_prefix.svg',
        title: 'Logout',
        subtitle: '',
        onTap: () {
          // Navigate to login and clear navigation stack
          context.go('/login');
        },
      ),
    ];
  }
}