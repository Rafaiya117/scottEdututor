
import 'package:scoctt_edututo/features/Teacher/attendance/attandance_model.dart';

class AttendanceController {
  List<AttandanceModel> getInitialData() {
    return List.generate(
      12,
      (index) => AttandanceModel(
        name: 'ALEX DENIAL',
        phone: '0187889545469',
        status: index == 11 ? 'Absent' : 'Present',
      ),
    );
  }
}