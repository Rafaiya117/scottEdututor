import 'package:scoctt_edututo/features/Teacher/report_details/report_table_model.dart';

class ReportTableController {
  List<reportData> getStudentData() {
    return List.generate(15, (index) => reportData(
      name: 'Emma Rodriguez',
      className: 'Class ${index + 1}',
      progress: '67%',
    ));
  }
}