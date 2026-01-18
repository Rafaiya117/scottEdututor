import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/role_card_custom.dart';
import 'package:scoctt_edututo/core/utils/constent.dart';
import 'package:scoctt_edututo/features/user_role/user_role_controller.dart';
import 'package:scoctt_edututo/features/user_role/user_role_model.dart';

class RoleSelectionView extends ConsumerWidget {
  RoleSelectionView({super.key});

  final RoleSelectionController controller = RoleSelectionController();

  @override
 Widget build(BuildContext context, WidgetRef ref) {
    final List<UserRole> roles = controller.getRoles();
    return Scaffold(
      extendBodyBehindAppBar: true, 
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppGradient.appgradientColor),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 128),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo_two.png',
                    width: 239.w,
                    height: 109.h,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Select your role',
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: roles.map((role) {
                      return RoleCard(
                        height: 90.h,
                        width: double.infinity,
                        role: role,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
