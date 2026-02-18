import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:scoctt_edututo/features/student/ai_tutor/ai_model.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

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
      var voices = await _tts.getVoices;
      if (voices.isNotEmpty) {
        await _tts.setVoice({"name": voices.first["name"], "locale": voices.first["locale"]});
      }
    } catch (e) {
      state = state.copyWith(lastError: e.toString());
    }
    _tts.setCompletionHandler(() {
    state = state.copyWith(isTalking: false);
  });
  }

  Future<void> startConversation() async {
  if (state.isListening) {
    await _speech.stop();
    state = state.copyWith(isListening: false, isTalking: false);
    return;
  }

  bool available = await _speech.initialize();
  if (!available) return;

  state = state.copyWith(isListening: true, isTalking: false);

  _speech.listen(onResult: (result) async {
    if (result.finalResult) {
      await _speech.stop();
      state = state.copyWith(isListening: false);

      String reply = _generateReply(result.recognizedWords);
      
      state = state.copyWith(isTalking: true);
      await _tts.speak(reply);
    }
  });
}

  String _generateReply(String input) {
    input = input.toLowerCase();
    if (input.contains("hello")) return "Hello! How can I help you today?";
    if (input.contains("how are you")) return "I am doing great. Thank you for asking!";
    return "That sounds interesting!";
  }

  void disposeTools() {
    _tts.stop();
    _speech.stop();
  }
}