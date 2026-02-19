import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:scoctt_edututo/features/student/ai_tutor/ai_model.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

// class AvatarController extends Notifier<TalkingAvatarState> {
//   final FlutterTts _tts = FlutterTts();
//   final stt.SpeechToText _speech = stt.SpeechToText();

//   @override
//   TalkingAvatarState build() {
//     _initTts();
//     return TalkingAvatarState();
//   }

// //   Future<void> _initTts() async {
// //   try {
// //     await _tts.setLanguage("en-US");
// //     await _tts.setPitch(1.0);
// //     await _tts.setVolume(1.0); 
    
// //     var voices = await _tts.getVoices;
// //     if (voices.isNotEmpty) {
// //       await _tts.setVoice({"name": voices.first["name"], "locale": voices.first["locale"]});
// //     }
// //   } catch (e) {
// //     state = state.copyWith(lastError: e.toString());
// //   }
  
// //   _tts.setCompletionHandler(() {
// //     state = state.copyWith(isTalking: false);
// //   });
// // }

// // Future<void> startConversation() async {
// //   if (state.isListening) {
// //     await _speech.stop();
// //     state = state.copyWith(isListening: false, isTalking: false);
// //     return;
// //   }

// //   bool available = await _speech.initialize();
// //   if (!available) return;

// //   state = state.copyWith(isListening: true, isTalking: false);

// //   _speech.listen(onResult: (result) async {
// //   if (result.finalResult) {
// //     await _speech.stop();
// //     state = state.copyWith(isListening: false);

// //     String reply = _generateReply(result.recognizedWords);
    
// //     // Set talking state BEFORE calling speak
// //     state = state.copyWith(isTalking: true);
// //     await _tts.speak(reply);
// //   }
// // });
// // }

// Future<void> _initTts() async {
//   try {
//     // 1. Ensure the engine is set to Google (best for Male voices on Android)
//     await _tts.setEngine("com.google.android.tts");

//     List<dynamic> voices = await _tts.getVoices;
    
//     // 2. Explicitly look for the most common Google Male Voice IDs
//     // These IDs are standard for the "Male" voice in Google TTS
//     var maleVoice = voices.firstWhere(
//       (v) => v["name"].toString().toLowerCase().contains("en-us-x-iol-local") || 
//              v["name"].toString().toLowerCase().contains("en-us-x-sfg-local"),
//       orElse: () => voices.firstWhere(
//         (v) => v["name"].toString().toLowerCase().contains("male") && 
//                v["locale"].toString().contains("en"),
//         orElse: () => null,
//       ),
//     );

//     if (maleVoice != null) {
//       await _tts.setVoice({"name": maleVoice["name"], "locale": maleVoice["locale"]});
//     }

//     // 3. Lower the pitch slightly to ensure it sounds deeper/masculine
//     await _tts.setPitch(0.9); 

//     _tts.setStartHandler(() => state = state.copyWith(isTalking: true));
//     _tts.setCompletionHandler(() => state = state.copyWith(isTalking: false));
//   } catch (e) {
//     print("TTS Error: $e");
//   }
// }

// Future<void> startConversation() async {
//   state = state.copyWith(isTalking: true, isListening: false);
//   String message = "Hi there, I didn't catch your word. I am you AI companion! to help you out";

//   // 3. Force language and speak
//   await _tts.setLanguage("en-US");
//   await _tts.speak(message);
// }

//   String _generateReply(String input) {
//     input = input.toLowerCase();
//     if (input.contains("hello")) return "Hello! How can I help you today?";
//     if (input.contains("how are you")) return "I am doing great. Thank you for asking!";
//     return "That sounds interesting!";
//   }

//   void disposeTools() {
//     _tts.stop();
//     _speech.stop();
//   }
// }

class AvatarController extends Notifier<TalkingAvatarState> {
  final FlutterTts _tts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();

  @override
  TalkingAvatarState build() {
    _initTts();
    return TalkingAvatarState();
  }

  Future<void> _initTts() async {
    try {
      // Force Google Engine for better male voice support on emulators
      await _tts.setEngine("com.google.android.tts");
      await _tts.setLanguage("en-US");
      await _tts.setPitch(0.9); // Lower pitch for a more masculine sound

      List<dynamic> voices = await _tts.getVoices;
      if (voices.isNotEmpty) {
        // Specifically target common Google Male voice IDs
        var maleVoice = voices.firstWhere(
          (v) => v["name"].toString().toLowerCase().contains("en-us-x-iol-local") || 
                 v["name"].toString().toLowerCase().contains("male"),
          orElse: () => voices.firstWhere((v) => v["locale"].toString().contains("en"), orElse: () => voices.first),
        );
        await _tts.setVoice({"name": maleVoice["name"], "locale": maleVoice["locale"]});
      }
    } catch (e) {
      state = state.copyWith(lastError: e.toString());
    }

    // Handlers to sync Lottie and Dots with the audio
    _tts.setStartHandler(() => state = state.copyWith(isTalking: true));
    _tts.setCompletionHandler(() => state = state.copyWith(isTalking: false));
  }

  Future<void> startConversation() async {
    // For now, bypass mic and read out loud immediately per request
    state = state.copyWith(isTalking: true, isListening: false);
    String message = "Hi there, I didn't catch your word. I am your AI companion to help you out!";
    await _tts.speak(message);
  }

  void disposeTools() {
    _tts.stop();
    _speech.stop();
  }
}