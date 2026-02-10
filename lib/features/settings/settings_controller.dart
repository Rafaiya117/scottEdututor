import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/features/settings/settings_model.dart';

class SettingsController {
  List<SettingsItemModel> getItems(BuildContext context) {
    return [
      SettingsItemModel(
        svgIconPath: 'assets/icons/key.svg',
        title: 'Change Password',
        subtitle: 'Update your account password',
        onTap: ()=> context.push('/change_password')
      ),
      SettingsItemModel(
        svgIconPath: 'assets/icons/user.svg',
        title: 'Personal information',
        subtitle: 'Download your learning data',
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
        title: 'Logout                           ',
        subtitle: '',
      ),
    ];
  }
}
