import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class CallScreen extends StatefulWidget {
  final String? field;
  const CallScreen({super.key, this.field});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer player = FlutterSoundPlayer();
  List<Map<String, dynamic>> transcriptArray = [];
  String aiTranscript = "";
  int? timerValue;
  int? timerValueoverall;
  Timer? countdownTimer;
  final uuid = const Uuid();
  final List<Map<String, dynamic>> transcriptAudio = [];
  CameraController? _cameraController;
  static const int totalSeconds = 500;
  late int remainingSeconds = totalSeconds;
  Timer? timer;
  final int appID = 626229570;
  String? videoPath;
  String? _filePath;
  bool _isMicOn = true, isPlaying = false, isRecording = false;
  bool _isVideoOn = true;
  String userName = "", id = "";

  @override
  void initState() {
    super.initState();
    startTimer();
    initializeCamera();
    // audioPlayApi();
  }

  Future<void> initializeCamera() async {
    await recorder.openRecorder();
    await player.openPlayer();
    await Permission.microphone.request();
    await Permission.storage.request();

    final cameras = await availableCameras();

    if (cameras.isNotEmpty) {
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
      );

      try {
        await _cameraController!.initialize();
        setState(() {});
      } catch (e) {
        print('Error initializing camera: $e');
      }
    } else {
      print('No cameras found');
    }
  }

  Future<void> startRecording() async {
    try {
      final path = await _getFilePath();
      await recorder.startRecorder(
        toFile: path,
        codec: Codec.pcm16WAV,
      );
      setState(() {
        isPlaying = false;
        isRecording = true;
        _filePath = path;
      });
    } catch (e) {
      setState(() {});
    }
  }

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/recording.wav';
  }

  Future<void> stopRecording() async {
    await recorder.stopRecorder().then((onValue) {
      print("Audio file recorded at: $_filePath");
      setState(() {
        isRecording = false;
        isPlaying = true;
      });
    });
  }

  Future<String?> convertAudioToBase64(String filePath) async {
    try {
      final File audioFile = File(filePath);
      if (await audioFile.exists()) {
        final bytes = await audioFile.readAsBytes();
        return base64Encode(bytes);
      } else {
        print("Audio file does not exist at the specified path.");
        return null;
      }
    } catch (e) {
      print("Error converting audio to Base64: $e");
      return null;
    }
  }

  void _startTimer() {
    setState(() {
      timerValue = 8;
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerValue! > 0) {
          timerValue = timerValue! - 1;
        } else {
          timer.cancel();
          stopRecording();

          print("Timer finished!");
        }
      });
    });
  }

  void startTimer() {
    setState(() {
      timerValueoverall = 30 * 60;
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerValueoverall! > 0) {
          timerValueoverall = timerValueoverall! - 1;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void toggleMic() {
    setState(() {
      _isMicOn = !_isMicOn;
    });
  }

  void toggleVideo() async {
    setState(() {
      _isVideoOn = !_isVideoOn;
    });

    if (_isVideoOn) {
      try {
        await _cameraController!.startVideoRecording();
      } catch (e) {
        print("Error starting video recording: $e");
      }
    } else {
      try {
        setState(() {});
      } catch (e) {
        print("Error stopping video recording: $e");
      }
    }
  }

  void endCall() {
    Get.back();
  }

  @override
  void dispose() {
    timer?.cancel();
    _cameraController?.dispose();
    player.closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/sound_equilizer.gif",
                    width: Get.width / 4.5,
                    height: 150,
                    fit: BoxFit.cover,
                    color: kSecondaryPrimaryColor,
                  ),
                  Stack(
                    children: [
                      Lottie.asset(
                        'assets/SpeakingAnimation.json',
                        height: 150,
                        width: 150,
                      ),
                      Positioned(
                          right: 20,
                          left: 20,
                          top: 23,
                          bottom: 23,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/icons/lady.png",
                                scale: 4.5,
                              ),
                            ),
                          ))
                    ],
                  ),
                  Image.asset(
                    "assets/sound_equilizer.gif",
                    width: Get.width / 4.5,
                    height: 150,
                    fit: BoxFit.cover,
                    color: kSecondaryPrimaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                child: Stack(
                  children: [
                    Container(
                      height: 400,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: kPrimaryColor,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: CameraPreview(_cameraController!),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Text Here",
                            style: const TextStyle(
                                color: kDividerColor,
                                fontSize: 15,
                                fontFamily: kCircularStdMedium),
                          ),
                          SizedBox(
                            width: Get.width - 100,
                            child: Text(
                              "Zynab AI",
                              style: const TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontFamily: kCircularStdBold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: toggleMic,
                            child: Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      const Color.fromARGB(78, 255, 255, 255)),
                              child: Icon(
                                _isMicOn ? Icons.mic : Icons.mic_off,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              // toggleVideo();
                            },
                            child: Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      const Color.fromARGB(78, 255, 255, 255)),
                              child: Icon(
                                _isVideoOn
                                    ? Icons.videocam
                                    : Icons.videocam_off,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: kRedColor),
                              child: const Icon(
                                Icons.call_end,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    formatTime(timerValueoverall!),
                    // "${timerValue!.toString().padLeft(2, '0')} seconds",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // CupertinoButton(
                  //   padding: EdgeInsets.zero,
                  //   onPressed: () {
                  //     getAllsaveInterviewHistorysController
                  //         .fetchAllsaveInterviewHistory();
                  //     Get.off(() => const FinishInterviewPage());
                  //   },
                  //   child: Container(
                  //     width: 130,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: isRecording == true
                  //             ? kRedColor
                  //             : kPrimaryColor,
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: const Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Icon(
                  //           Icons.speaker_phone_outlined,
                  //           size: 20,
                  //           color: kWhiteColor,
                  //         ),
                  //         SizedBox(width: 5),
                  //         Text(
                  //           textAlign: TextAlign.center,
                  //           'Submit Answer',
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //             fontFamily: kCircularStdMedium,
                  //             textBaseline: TextBaseline.ideographic,
                  //             color: kWhiteColor,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: Get.width - 90,
                    child: CupertinoButton(
                      color: kHighlightColor,
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "SUBMIT ANSWER",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdMedium,
                                fontSize: 14),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/icons/arrow_right.png",
                            color: kPrimaryColor,
                            scale: 1.3,
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${secs.toString().padLeft(2, '0')}';
  }

  String formatTime1(int seconds) {
    int minutes = seconds ~/ 60; // Integer division for minutes
    int remainingSeconds = seconds % 60; // Remainder is the seconds
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
