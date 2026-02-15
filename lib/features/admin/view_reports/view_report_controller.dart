import 'package:scoctt_edututo/features/admin/view_reports/view_report_model.dart';

class ViewReportController {
  List<reportData> getStudentData() {
    return List.generate(15, (index) => reportData(
      name: 'Emma Rodriguez',
      className: 'Class ${index + 1}',
      progress: '67%',
    ));
  }
}