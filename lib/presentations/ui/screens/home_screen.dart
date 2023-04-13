import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mygpt/features/config/theme.dart';
import 'package:mygpt/services/api_services.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../widgets/smart_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _lastWords = '';
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  @override
  initState() {
    initSpeech();

    super.initState();
  }

  @override
  void dispose() {
    speechToText.stop();
    super.dispose();
  }

  /// This has to happen only once per app
  Future<void> initSpeech() async {
    speechEnabled = await speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      shape: BoxShape.circle),
                ),
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/virtualAssistant.png")),
                      shape: BoxShape.circle),
                  height: 123,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin:
                const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
                    .copyWith(topLeft: const Radius.circular(0)),
                border: Border.all(color: Pallete.borderColor)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Good Morning,What Task Can i Do for You ?",
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: 25),
              ),
            ),
          ),
          FadeInLeft(
            duration: const Duration(microseconds: 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(left: 22, top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Here are a Few Features",
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: SlideInLeft(
                  duration: const Duration(microseconds: 2),
                  child: const FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: 'Dall-E',
                    descriptionText:
                        'Get inspired and stay creative with your personal assistant powered by Dall-E',
                  ),
                ),
              ),
              FadeInUp(
                duration: const Duration(microseconds: 2),
                child: const FeatureBox(
                  color: Pallete.secondSuggestionBoxColor,
                  headerText: 'Dall-E',
                  descriptionText:
                      'Get inspired and stay creative with your personal assistant powered by Dall-E',
                ),
              ),
              FadeInUp(
                duration: const Duration(microseconds: 2),
                child: const FeatureBox(
                  color: Pallete.thirdSuggestionBoxColor,
                  headerText: 'Dall-E',
                  descriptionText:
                      'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await apiServices.isArtPrompt(_lastWords);
            await stopListening();
          } else {
            initSpeech();
          }
        },
        child: const Icon(CupertinoIcons.mic),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        "MyGPT",
        style: TextStyle(color: Colors.black),
      ),
      leading: const Icon(
        CupertinoIcons.hand_thumbsdown,
        color: Colors.black,
      ),
      centerTitle: true,
    );
  }
}
