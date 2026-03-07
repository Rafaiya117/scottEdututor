import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/features/auth/auth_services/auth_provider/auth_provider.dart';
import 'package:scoctt_edututo/features/settings/settings_model.dart';
import 'package:scoctt_edututo/features/user_role/user_role_model.dart';

class SettingsController {
  List<SettingsItemModel> getItems(BuildContext context, UserRoleType roleType,WidgetRef ref) {
    return [
      SettingsItemModel(
        svgIconPath: 'assets/icons/key.svg',
        title: 'Change Password',
        subtitle: 'Update your account password',
        onTap: () {
          // Switch case for Change Password routing
          switch (roleType) {
            case UserRoleType.teacher:
              context.push('/change_password');
              break;
            case UserRoleType.parent:
              context.push('/change_password'); 
              break;
            case UserRoleType.student:
              context.push('/change_password');
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
              context.push('/teacher_edit_profile');
              break;
            case UserRoleType.student:
              context.push('/edit_student_info');
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
        title: 'Logout                                ',
        subtitle: '',
        onTap: () async {
          await ref.read(authServiceProvider).logout();
          context.go('/login');
        },
      ),
    ];
  }
}