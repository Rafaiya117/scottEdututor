import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';

class QuizDetails extends ConsumerWidget {
   QuizDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
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
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 80.w),
                    Text(
                      'Quizzes Details',
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDetailsContainer(), // Top Info Card
            SizedBox(height: 16.h),
            _buildQuestionContainer(), // Question Card
            SizedBox(height: 16.h),
            _buildQuestionContainer(), // Repeating to show scrollability
          ],
        ),
      ),
    );
  }

  // --- UI Helper Methods ---

  Widget _buildDetailsContainer() {
    return Container(
      padding:  EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildDetailRow("Quiz Name :", "Algebra II Chapter 2"),
          _buildDetailRow("Course :", "Algebra II"),
          _buildDetailRow("Class :", "Class 1"),
          _buildDetailRow("Date :", "14/02/2026"),
          _buildDetailRow("Time :", "04 : 45 pm"),
          _buildDetailRow("Qus No", "30"),
          _buildDetailRow("Time Limit :", "20 min"),
          _buildDetailRow("Total points :", "30"),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style:GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style:GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContainer() {
    return Container(
      padding:  EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Question 1", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
           Text("What is your name", style: GoogleFonts.poppins(fontSize: 20, color: Color(0xFF9E9E9E))),
           SizedBox(height: 16),
           Text("Answer Options", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
           SizedBox(height: 12),
          _buildOptionField("Option 1"),
          _buildOptionField("Option 2"),
          _buildOptionField("Option 3"),
          _buildOptionField("Option 4"),
           SizedBox(height: 16),
           Text("Points", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
           SizedBox(height: 8),
          Container(
            width: 120,
            padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color:  Color(0xFFD4AF6A).withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Text("10", style: GoogleFonts.poppins(color: Color(0xFF9E9E9E))),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionField(String hint) {
    return Container(
      margin:  EdgeInsets.only(bottom: 10),
      padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color:  Color(0xFFD4AF6A).withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.radio_button_unchecked, size: 20, color: Colors.grey[700]),
           SizedBox(width: 12),
          Text(hint, style: GoogleFonts.poppins(color: Colors.grey[400])),
        ],
      ),
    );
  }
}