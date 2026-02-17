import 'package:flutter/material.dart';
import 'package:scoctt_edututo/features/student/my_courses/widget/enroll_popup.dart';

void showReportsSummaryDialog(
  BuildContext context, {
  required String studentName,
  required String courseName,
  required String grade,
  required String score,
  required double progressValue,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(20), // Adjusts how close to screen edges
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        width: double.infinity, // This makes it full width
        child: Padding(
          padding: const EdgeInsets.all(24.0), // Restored to 24 for better breathing room
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reports Summary',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ...[
                {'label': 'Student Name', 'value': studentName},
                {'label': 'Course Name', 'value': courseName},
                {'label': 'Grade', 'value': grade},
                {'label': 'Score', 'value': score},
              ].map((item) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['label']!,
                          style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(item['value']!,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const Divider(color: Color(0xFFE3F2FD), thickness: 1.5, height: 28),
                    ],
                  )),

              // Progress Section
              const Text('Progress Score',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('${(progressValue * 100).toInt()}%',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progressValue,
                        minHeight: 10,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD0AD6B)),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(color: Color(0xFFE3F2FD), thickness: 1.5, height: 32),
              const SizedBox(height: 10),

              // Footer Action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'You can now enroll in this course',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      showEnrollmentPopup(context);
                    },
                    icon: const Icon(Icons.arrow_forward, color: Colors.green, size: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}