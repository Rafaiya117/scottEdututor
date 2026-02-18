
import 'package:file_picker/file_picker.dart';
import 'package:scoctt_edututo/features/Teacher/create_quiz/create_quiz_model.dart';
//!------------2--------------!
// class QuizState {
//   final List<PlatformFile> uploadedFiles;
//   QuizState({this.uploadedFiles = const []});

//   QuizState copyWith({List<PlatformFile>? uploadedFiles}) {
//     return QuizState(uploadedFiles: uploadedFiles ?? this.uploadedFiles);
//   }
// }

class QuizState {
  final List<PlatformFile> uploadedFiles;
  final List<QuizModel> quizzes; 

  QuizState({
    this.uploadedFiles = const [],
    this.quizzes = const [],
  });

  QuizState copyWith({
    List<PlatformFile>? uploadedFiles,
    List<QuizModel>? quizzes,
  }) {
    return QuizState(
      uploadedFiles: uploadedFiles ?? this.uploadedFiles,
      quizzes: quizzes ?? this.quizzes,
    );
  }
}