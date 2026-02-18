import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/student/ai_tutor/ai_provider.dart';
import 'package:scoctt_edututo/features/student/ai_tutor/widget/dot_widget.dart';



class TalkingAvatarPage extends ConsumerWidget {
  const TalkingAvatarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarState = ref.watch(avatarControllerProvider);
    final controller = ref.read(avatarControllerProvider.notifier);

    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Padding(
                padding:EdgeInsets.only(top: 45.h,left: 7.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 90.w,),
                    Text(
                      'AI Tutor',
                      style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 260,
                  child: Lottie.asset(
                    "assets/json/talking.json",
                    animate: avatarState.isTalking,
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => controller
                      .startConversation(), // This triggers the state change
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 100.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF333333),
                      borderRadius: BorderRadius.circular(31),
                    ),
                    child: Center(
                      child: avatarState.isListening
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                animatingDot(12, 0.6, 0),
                                const SizedBox(width: 8),
                                animatingDot(20, 1.0, 0.2),
                                const SizedBox(width: 8),
                                animatingDot(12, 0.6, 0.4),
                              ],
                            )
                          : SvgPicture.asset(
                              "assets/icons/mic.svg",
                              height: 50,
                              colorFilter: const ColorFilter.mode(
                                Color(
                                  0xFFC5A377,
                                ), // Applying the gold color from your image
                                BlendMode.srcIn,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}