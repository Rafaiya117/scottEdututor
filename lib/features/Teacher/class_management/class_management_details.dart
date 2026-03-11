import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_provider.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/widget/class_details_card.dart';

class ClassManagementDetails extends ConsumerWidget {
  final String classId; 
  const ClassManagementDetails({super.key, required this.classId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(classManagementProvider);
    // Fetch classes once after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchClasses(ref);
    });

    // Filter classes by the passed id
    final classes = controller.getActiveClasses().where((c) => c.id == classId).toList();
    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                ),
                SizedBox(width: 40.w),
                Text(
                  'Class Management',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      padding:EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      body: ListView.separated(
        itemCount: classes.length,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          final item = classes[index];
          return ClassCard(classData: item);
        },
      ),
    );
  }
}