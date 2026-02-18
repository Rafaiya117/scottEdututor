import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/student/ai_tutor/ai_controller.dart';
import 'package:scoctt_edututo/features/student/ai_tutor/ai_model.dart';

final avatarControllerProvider = NotifierProvider<AvatarController, TalkingAvatarState>(() {
  return AvatarController();
});