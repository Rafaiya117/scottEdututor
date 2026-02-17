import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoctt_edututo/core/utils/constent.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TalkingAvatarPage extends StatefulWidget {
  const TalkingAvatarPage({super.key});

  @override
  State<TalkingAvatarPage> createState() => _TalkingAvatarPageState();
}

class _TalkingAvatarPageState extends State<TalkingAvatarPage> {
  final FlutterTts tts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool isTalking = false;
  bool isListening = false;

  List<dynamic> voices = [];
  dynamic selectedVoice;

  @override
  void initState() {
    super.initState();
    getVoices();
  }

  Future<void> getVoices() async {
    try {
      voices = await tts.getVoices;
      if (voices.isNotEmpty) {
        selectedVoice = voices.first;
        await tts.setVoice({
          "name": selectedVoice["name"],
          "locale": selectedVoice["locale"],
        });
      }
    } catch (e) {
      debugPrint("Voice error: $e");
    }
  }

  Future<void> _startListening() async {
    bool available = await _speech.initialize();
    if (!available) return;

    setState(() {
      isListening = true;
      isTalking = true; // 👈 mouth starts moving immediately
    });

    _speech.listen(
      onResult: (result) async {
        if (result.finalResult) {
          await _speech.stop();

          setState(() {
            isListening = false;
          });

          String userSpeech = result.recognizedWords;

          String reply = _generateReply(userSpeech);

          await tts.speak(reply);

          setState(() {
            isTalking = false; // 👈 stop mouth after reply
          });
        }
      },
    );
  }

  String _generateReply(String input) {
    input = input.toLowerCase();

    if (input.contains("hello")) {
      return "Hello! How can I help you today?";
    } else if (input.contains("how are you")) {
      return "I am doing great. Thank you for asking!";
    } else {
      return "That sounds interesting!";
    }
  }

  @override
  void dispose() {
    tts.stop();
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Talking Avatar",style: TextStyle(
          color: Colors.white,
        ),)
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradient.appgradientColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 260,
                child: Lottie.asset(
                  "assets/json/talking.json",
                  animate: isTalking,
                ),
              ),
        
              const SizedBox(height: 40),
        
              GestureDetector(
                onTap: _startListening,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isListening ? Colors.red : Colors.blue,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/mic.svg",
                    height: 28,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
