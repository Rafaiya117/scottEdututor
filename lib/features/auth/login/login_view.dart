import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_auth_inputfield.dart';
import 'package:scoctt_edututo/core/utils/constent.dart';
import 'package:scoctt_edututo/features/auth/login/login_provider.dart';

class LoginView extends ConsumerWidget{
  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final loginController = ref.read(loginControllerProvider);
    return Scaffold(
      extendBodyBehindAppBar: true, 
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body:SingleChildScrollView(
        child:Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: AppGradient.appgradientColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo_one.png',
                    width:79.w,
                    height: 79.h,
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    'Welcome Back',
                    style:GoogleFonts.montserrat(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                      color:Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'Enter Email and password access your account',
                    style:GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color:Colors.white,
                      //letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  CustomAuthInputfield(
                    label: 'Email',
                    hintText: 'Enter email',
                    height: 44.h,
                    width: double.infinity,
                    controller: loginController.emailController,
                  ),
                  SizedBox(height: 20.h,),
                  CustomAuthInputfield(
                    label: 'Password',
                    hintText: 'Enter password',
                    height: 44.h,
                    width: double.infinity,
                    controller: loginController.passwordController,
                    isPassword: true,
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