import 'package:scoctt_edututo/features/Teacher/report_details/report_details_model.dart';

class ReportDetailsController {
  List<String> getHeaders() {
    return ['Name', 'Class', 'Score', 'Action'];
  }

  List<DetailReport> getRows() {
    return [
      DetailReport(id: '101', values: ['Alice', '10A', '85', 'View more']),
      DetailReport(id: '102', values: ['Bob', '10B', '90', 'View more']),
      DetailReport(id: '103', values: ['Charlie', '10C', '88', 'View more']),
    ];
  }
}