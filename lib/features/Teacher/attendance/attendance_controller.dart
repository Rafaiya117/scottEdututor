
import 'package:scoctt_edututo/features/Teacher/attendance/attandance_model.dart';

class AttendanceController {
  List<AttandanceModel> getInitialData() {
    return List.generate(12, (index) => AttandanceModel(
      name: 'ALEX DENIAL',
      phone: '0187889545489',
      status: '',
    ));
  }
}