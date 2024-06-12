import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;

import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class ChatWithDoctorPage extends StatefulWidget {
  const ChatWithDoctorPage({super.key});

  @override
  State<ChatWithDoctorPage> createState() => _ChatWithDoctorPageState();
}

class _ChatWithDoctorPageState extends State<ChatWithDoctorPage> {
  FocusNode focusNode = FocusNode();
  var msgController = TextEditingController();
  bool islisteing = false;
  String text = "";
  var speechToText = stts.SpeechToText();
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool isRecording = false;
  bool isPlaying = false;
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

  Future<void> startRecording() async {
    Directory tempDir = await getTemporaryDirectory();
    _filePath = '${tempDir.path}/temp_audio.aac';
    await _recorder.startRecorder(
      toFile: _filePath,
      codec: Codec.aacADTS,
    );
    setState(() {
      isRecording = true;
    });
  }

  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
    setState(() {
      isRecording = false;
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
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        leading: CupertinoButton(
          padding: const EdgeInsets.all(9),
          onPressed: () {
            Get.back();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: kWhiteColor),
            child: Image.asset(
              "assets/icons/arrow_left.png",
              scale: 1.5,
            ),
          ),
        ),
        title: const Text(
          "Chat with AI Doctor",
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontFamily: kCircularStdMedium),
        ),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: kHighlightColor),
              child: Image.asset(
                "assets/icons/phone.png",
                scale: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 5),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: kWhiteColor),
              child: Image.asset(
                "assets/icons/square_dots.png",
                scale: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: kHighlightColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "ai",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdMedium,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/icons/lady.png",
                    fit: BoxFit.cover,
                    height: 250,
                    width: 152,
                  )
                ],
              ),
              const Text(
                "I’m Zynab\nYour ai Doctor.\nAsk me anything.",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 25),
              ),
              const SizedBox(height: 30),
              const Text(
                "Pick sickness",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 15),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildSicknessWidget("Fever"),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Cough"),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Sore Throat")
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildSicknessWidget("Vomiting"),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Vomiting"),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Chest Pain")
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildSicknessWidget("Rash"),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Diarrhea"),
                  const SizedBox(width: 10),
                  buildSicknessWidget("plus")
                ],
              ),
              const SizedBox(height: 23),
              Row(
                children: [
                  SizedBox(
                    width: Get.width - 111,
                    height: 50,
                    child: TextFormField(
                      controller: msgController,
                      focusNode: focusNode,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      cursorColor: kPrimaryColor,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        fillColor: kWhiteColor,
                        filled: true,
                        hintText: "Ask me anything.",
                        hintStyle: const TextStyle(color: kPrimaryColor),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 5, bottom: 5, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: kBorderColor, width: 1.0)),
                            child: Image.asset(
                              "assets/icons/plus.png",
                              scale: 1,
                            ),
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              "assets/icons/send.png",
                              scale: 1.6,
                            ),
                          ),
                          onPressed: () async {
                            Get.toNamed(Routes.chatWithDoctorMadicalPage);
                          },
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kWhiteColor, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kWhiteColor, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        errorStyle: const TextStyle(color: kErrorColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kWhiteColor, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kWhiteColor, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      isRecording ? stopRecording() : startRecording();
                    },
                    child: AvatarGlow(
                      animate: islisteing,
                      repeat: true,
                      endRadius: 40,
                      glowColor: const Color(0xFFCCDA00),
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            color: kHighlightColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: isRecording
                            ? const Icon(Icons.close)
                            : Image.asset("assets/icons/mic.png", scale: 1.5),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildSicknessWidget(String text) {
    return text == "plus"
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.toNamed(Routes.multipalSicknessPage);
            },
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryColor),
                  child: Image.asset(
                    "assets/icons/plus.png",
                    scale: 1.5,
                    color: kWhiteColor,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  "23 sickness",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 15),
                )
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
            child: Text(
              text,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontFamily: kCircularStdNormal,
                  fontSize: 15),
            ),
          );
  }
}
