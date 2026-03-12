import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_model.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_provider.dart';

class CourseDetailsView extends ConsumerStatefulWidget {
  final String CourseId;
  const CourseDetailsView({super.key, required this.CourseId});

  @override
  ConsumerState<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends ConsumerState<CourseDetailsView> {

  late Future<Courses?> _courseFuture;

  @override
  void initState() {
    super.initState();
    final controller = ref.read(courseProvider);
    _courseFuture = controller.fetchCourseById(
      ref: ref,
      courseId: widget.CourseId,
    );
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Courses?>(
      future: _courseFuture,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return BackgroundTemplate(
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final Courses? courses = snapshot.data;

        if (courses == null) {
          return const Center(child: Text("Course not found"));
        }

        return BackgroundTemplate(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.h),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 45.h, left: 7.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/arrow_back.svg',
                          ),
                        ),
                        SizedBox(width: 40.w),
                        Text(
                          'Course Management',
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32.h),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [

                      /// HEADER
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6E4E2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          courses.title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      /// BODY
                      // BODY container inside CourseDetailsView
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              courses.content.isNotEmpty
                                  ? courses.content
                                  : "No content available",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}