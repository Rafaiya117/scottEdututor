import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/enroll_quiz_test/enroll_quiz_test_controller.dart';

class EnrolQuizView extends ConsumerWidget {
  const EnrolQuizView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);
    final controller = ref.read(quizProvider.notifier);

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
                padding:EdgeInsets.only(top: 45.h,left: 7.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        //context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/menu_icon.svg'),
                    ),
                    SizedBox(width: 120.w,),
                    Text(
                      'Enrol Quiz Test',
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuizDetailsHeader(),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () => controller.addQuestion(),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD4AF37)),
                child: Text("Add Questions", style: TextStyle(color: Colors.white)),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: quizState.questions.length,
              itemBuilder: (context, index) => _QuestionCard(index: index),
            ),
            SizedBox(height: 20),
            _buildFooterButtons(),
          ],
        ),
      ),
    );
  }
Widget _buildQuizDetailsHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quiz Details", 
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        _darkField("Quiz Name", "e.g., Linear Equations Quiz"),
        // Now using actual dropdown logic
        _darkDropdown("Course", "Select course...", ["Math", "Science", "History"]),
        _darkDropdown("Class (Optional)", "All classes...", ["Class A", "Class B"]),
        _darkField("Passing Score (%)", "75"),
      ],
    );
  }

  Widget _darkField(String label, String hint) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white70)),
        SizedBox(height: 5),
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: _inputDecoration(hint),
        ),
      ],
    ),
  );

  Widget _darkDropdown(String label, String hint, List<String> items) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white70)),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          dropdownColor: Color(0xFF333333),
          style: TextStyle(color: Colors.white),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) {},
          decoration: _inputDecoration(hint),
          iconEnabledColor: Colors.white,
        ),
      ],
    ),
  );

  // Helper to keep the white border logic consistent
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Color(0xFF333333),
      // Set the border color to white
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey)),
            child: Text("Cancel", style: TextStyle(color: Colors.black)),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF333333)),
            child: Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class _QuestionCard extends ConsumerWidget {
  final int index;
  const _QuestionCard({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(quizProvider.notifier);

    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Question ${index + 1}", style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => controller.removeQuestion(index),
              )
            ],
          ),
          TextField(
            decoration: InputDecoration(hintText: "Enter Your Qus", border: OutlineInputBorder()),
            onChanged: (v) => controller.updateQuestionText(index, v),
          ),
          SizedBox(height: 10),
          Text("Answer Options", style: TextStyle(fontWeight: FontWeight.w600)),
          ...List.generate(4, (optIndex) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              onChanged: (v) => controller.updateOption(index, optIndex, v),
              decoration: InputDecoration(
                hintText: "Option ${optIndex + 1}",
                prefixIcon: Radio(value: optIndex, groupValue: null, onChanged: (v) {}),
                border: OutlineInputBorder(),
              ),
            ),
          )),
          _cardDropdown("Correct Answer"),
          _cardDropdown("Point"),
        ],
      ),
    );
  }

  Widget _cardDropdown(String label) => Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButtonFormField(items: [], onChanged: (v) {}, decoration: InputDecoration(border: OutlineInputBorder())),
      ],
    ),
  );
}