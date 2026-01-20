import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_auth_inputfield.dart';
import 'package:scoctt_edututo/core/componets/custom_button.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/auth/login/login_provider.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(loginControllerProvider);
    final rememberMe = ref.watch(rememberMeProvider);

    return BackgroundTemplate(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo_one.png',
              width: 79.w,
              height: 79.h,
            ),
            SizedBox(height: 20.h),
            Text(
              'Welcome Back',
              style: GoogleFonts.montserrat(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Enter Email and password access your account',
              style: GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            CustomAuthInputfield(
              label: 'Email',
              hintText: 'Enter email',
              height: 44.h,
              width: double.infinity,
              controller: loginController.emailController,
            ),
            SizedBox(height: 20.h),
            CustomAuthInputfield(
              label: 'Password',
              hintText: 'Enter password',
              height: 44.h,
              width: double.infinity,
              controller: loginController.passwordController,
              isPassword: true,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    loginController.toggleRememberMe(ref, value);
                  },
                  activeColor: Colors.black,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  'Remember me',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.28),
                TextButton(
                  onPressed: () {
                    context.push('/forgot_password');
                  },
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      color: Colors.brown,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.brown,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(
              buttontext: 'Login',
              buttonColor: const Color(0xFFD0AD6B),
              buttonTextColor: Colors.white,
              buttonHeight: 44.h,
              buttonWidth: double.infinity,
              ontap: () {
                final role = ref.read(selectedRoleProvider);
                if (role == null) {
                  debugPrint('Role not selected yet');
                  return;
                }
                context.push('/main');
              },
            ),
          ],
        ),
      ),
    );
  }
}
