import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;

import '../Chat/chat_screen.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class KeepAsking extends StatefulWidget {
  const KeepAsking({super.key});

  @override
  _KeepAskingState createState() => _KeepAskingState();
}

class _KeepAskingState extends State<KeepAsking> {
  bool islisteing = false;
  String text = "";
  var speechToText = stts.SpeechToText();
  SampleItem? selectedItem;
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool _isRecording = false;
  bool isPlaying = false, sendingText = false;
  String? _filePath;

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    _player.closePlayer();
    super.dispose();
  }

  Future<void> _initializeRecorder() async {
    await _recorder.openRecorder();
    await _player.openPlayer();
    await Permission.microphone.request();
  }

  Future<void> _startRecording() async {
    Directory tempDir = await getTemporaryDirectory();
    _filePath = '${tempDir.path}/temp_audio.aac';
    await _recorder.startRecorder(
      toFile: _filePath,
      codec: Codec.aacADTS,
    );
    setState(() {
      _isRecording = true;
      sendingText = true;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder.stopRecorder();
    setState(() {
      _isRecording = false;
    });
  }

  Future<void> playAudio() async {
    if (_filePath != null) {
      await _player.startPlayer(
        fromURI: _filePath,
        codec: Codec.aacADTS,
        whenFinished: () {
          setState(() {
            isPlaying = false;
          });
        },
      );
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future<void> stopAudio() async {
    await _player.stopPlayer();
    setState(() {
      isPlaying = false;
    });
  }

  void listen() async {
    // if (!islisteing) {
    //   bool available = await speechToText.initialize();
    //   if (available) {
    //     setState(() {
    //       islisteing = true;
    //     });
    //     speechToText.listen(
    //       onResult: (result) => setState(
    //         () {
    //           text = result.recognizedWords;
    //           if (text != "") {
    //             setState(() {
    //               islisteing = false;
    //             });
    //           }
    //         },
    //       ),
    //     );
    //   }
    // } else {
    //   setState(() {
    //     islisteing = false;
    //   });
    //   speechToText.stop();
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        leading: CupertinoButton(
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(35)),
                child: Image.asset("assets/icons/h4.png"),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Tell me your symptoms",
                style: TextStyle(
                    color: kWhiteColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "I'm Listening and noting down everything for\nyou.",
                style: TextStyle(
                    color: kWhiteColor,
                    fontFamily: kCircularStdNormal,
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            _isRecording
                ? AvatarGlow(
                    glowColor: Colors.white,
                    endRadius: 80,
                    duration: const Duration(milliseconds: 2000),
                    repeat: true,
                    showTwoGlows: true,
                    curve: Curves.easeOutQuad,
                    child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: kHighlightColor,
                            borderRadius: BorderRadius.circular(99)),
                        child: Image.asset("assets/icons/mic.png", scale: 1.5)),
                  )
                : AvatarGlow(
                    glowColor: kSecondaryColor,
                    endRadius: 80,
                    duration: const Duration(milliseconds: 2000),
                    repeat: true,
                    showTwoGlows: true,
                    curve: Curves.easeOutQuad,
                    child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: kHighlightColor,
                            borderRadius: BorderRadius.circular(99)),
                        child: Image.asset("assets/icons/mic.png", scale: 1.5)),
                  ),
            SizedBox(
              height: Get.height / 6,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Tap the microphone below and speak in\nyour own words.",
                style: TextStyle(
                    color: kWhiteColor,
                    fontFamily: kCircularStdNormal,
                    fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {
                    _isRecording ? _stopRecording() : _startRecording();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(width: 1, color: kWhiteColor)),
                          child: Center(
                            child: _isRecording
                                ? const Icon(
                                    Icons.square,
                                    size: 15,
                                    color: kWhiteColor,
                                  )
                                : const Icon(
                                    Icons.play_arrow_rounded,
                                    size: 22,
                                    color: kWhiteColor,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Tap to ${_isRecording ? "Stop" : "Start"}",
                        style: const TextStyle(
                            color: kWhiteColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    if (sendingText) {
                      if (!_isRecording) {
                        Get.to(() => UserChatPage(
                              filePath: _filePath,
                            ));
                      }
                    }
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: _isRecording
                            ? const Color.fromARGB(255, 220, 220, 220)
                            : kWhiteColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: _isRecording
                                ? const Color.fromARGB(255, 220, 220, 220)
                                : kWhiteColor,
                            width: 1)),
                    child: Image.asset(
                      "assets/icons/send.png",
                      scale: 1.6,
                      color: kSecondaryColor,
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
