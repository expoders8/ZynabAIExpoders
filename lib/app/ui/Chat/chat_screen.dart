import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;
import 'package:voice_message_package/voice_message_package.dart';

import '../../../config/constant/constant.dart';
import '../../routes/app_pages.dart';
import '../Keep asking/keepasking.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class UserChatPage extends StatefulWidget {
  final String? filePath;
  const UserChatPage({
    super.key,
    this.filePath,
  });

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

enum SampleItem { getHelp, sendFeedback }

class _UserChatPageState extends State<UserChatPage> {
  final TextEditingController msgController = TextEditingController();
  bool islisteing = false;
  String text = "";
  var speechToText = stts.SpeechToText();
  SampleItem? selectedItem;
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool isRecording = false;
  bool isPlaying = false;
  String? _filePath;
  String selectedPerson = "";
  @override
  void initState() {
    var person = getStorage.read("selctetperson") ?? "";
    setState(() {
      selectedPerson = person;
    });
    super.initState();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    _player.closePlayer();
    super.dispose();
  }

  Future<void> initializeRecorder() async {
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
        title: Text(
          "Chat with AI ${selectedPerson == "Doctor" ? "Patients" : "Doctor"}",
          style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontFamily: kCircularStdMedium),
        ),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              launch('tel:1234567899');
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
              bottomSheetforChat();
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
          const SizedBox(width: 5)
        ],
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: Get.height > 500 ? Get.height - 180 : Get.height - 164,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(22)),
                              child: const Text(
                                "I have a fever",
                                style: TextStyle(color: kWhiteColor),
                              )),
                          const SizedBox(width: 10),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                              "assets/icons/h3.png",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                              "assets/icons/h4.png",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 14),
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Text(
                                  "I’m sorry to hear that",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: kCircularStdMedium),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 14),
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Text(
                                  "Fevers can be uncomfortable.\nMake sure you’re resting and staying\nhydrated. Have you taken any\nfever-reducing medication?",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: kCircularStdMedium),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: Get.width - 68,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  buildNearby(
                                      "Dr. Pooja\nPatel",
                                      "assets/icons/h1.png",
                                      "4.5",
                                      "Dentist / 2+ yrs"),
                                  buildNearby(
                                      "Dr. Aryaa\nPatel",
                                      "assets/icons/h2.png",
                                      "4.8",
                                      "Surgeons / 8+ yrs"),
                                  buildNearby(
                                      "Dr. Aryaa\nPatel",
                                      "assets/icons/h3.png",
                                      "4.8",
                                      "Surgeons / 8+ yrs")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                              "assets/icons/h4.png",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 14),
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Text(
                                  "Sure, follow these steps",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: kCircularStdMedium),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: 30,
                                    child: Container(
                                      height: 158,
                                      width: 222,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 14),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2F2F2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    child: Container(
                                      height: 158,
                                      width: 222,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 14),
                                      decoration: BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 14),
                                    decoration: BoxDecoration(
                                      color: kHighlightColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.black26,
                                          ),
                                          child: const Text(
                                            "AI Powered",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 14,
                                                fontFamily: kCircularStdNormal),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Let’s reduce\na fever at home.",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          kCircularStdMedium),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 38,
                                                      width: 38,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  kPrimaryColor,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Image.asset(
                                                          "assets/icons/download.png",
                                                          scale: 1.3),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    CupertinoButton(
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {
                                                        Get.toNamed(Routes
                                                            .aISharePDFPage);
                                                      },
                                                      child: Container(
                                                        height: 38,
                                                        width: 38,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                kPrimaryColor,
                                                            border: Border.all(
                                                                color:
                                                                    kPrimaryColor,
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: Image.asset(
                                                            "assets/icons/arrow_right.png",
                                                            scale: 1.3),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(width: 20),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.asset(
                                                "assets/icons/ladyCard.png",
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 50,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(22)),
                              child: Image.asset(
                                "assets/icons/sendimage.png",
                                height: 180,
                                width: 200,
                              )),
                          const SizedBox(width: 10),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                              "assets/icons/h3.png",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(22)),
                              child: const Text(
                                "Yes, I took some ibuprofen earlier.",
                                style: TextStyle(color: kWhiteColor),
                              )),
                          const SizedBox(width: 10),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                              "assets/icons/h3.png",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (widget.filePath != null)
                            VoiceMessageView(
                              activeSliderColor: kYellowColor,
                              circlesTextStyle:
                                  const TextStyle(color: kWhiteColor),
                              counterTextStyle:
                                  const TextStyle(color: kWhiteColor),
                              backgroundColor: kPrimaryColor,
                              controller: VoiceController(
                                audioSrc: widget.filePath!,
                                maxDuration: const Duration(seconds: 10),
                                isFile: true,
                                onComplete: () {},
                                onPause: () {},
                                onPlaying: () {},
                                onError: (err) {},
                              ),
                              innerPadding: 12,
                              cornerRadius: 20,
                            ),
                          const SizedBox(width: 10),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                              "assets/icons/h3.png",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width - 105,
                      height: 50,
                      child: TextFormField(
                        controller: msgController,
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
                          prefixIcon: GestureDetector(
                            onTap: () {
                              bottomSheetforSendFile();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, top: 5, bottom: 5, right: 10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: kBorderColor, width: 1.0)),
                                  child: const Icon(
                                    Icons.attach_file_outlined,
                                    size: 20,
                                  )),
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
                            onPressed: () async {},
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
                        // _isRecording ? _stopRecording() : _startRecording();
                        Get.to(() => const KeepAsking());
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
                          child:
                              Image.asset("assets/icons/mic.png", scale: 1.5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildNearby(String text, image, review, year) {
    return Card(
      shadowColor: const Color.fromARGB(10, 0, 0, 0),
      elevation: 5,
      child: Container(
          // width: size.width,
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Image.asset(
                  image,
                  scale: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                year,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdNormal,
                    fontSize: 12),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.toNamed(Routes.doctoreDetailsPage);
                    },
                    child: Container(
                      width: 39,
                      height: 39,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        review,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 23),
                      ),
                      const Text(
                        "212 Reviews",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }

  bottomSheetforSendFile() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      builder: (context) {
        return Wrap(
          children: [
            const Center(
              child: ImageIcon(
                AssetImage("assets/icons/des.png"),
                size: 30,
                color: Color(0XffBFC5CC),
              ),
            ),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: 180,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Send file",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 22,
                            fontFamily: kCircularStdNormal),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFE5E6E0),
                                  ),
                                  height: 55,
                                  width: 55,
                                  child: Image.asset(
                                    "assets/icons/gallary.png",
                                    scale: 1.6,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Image",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: kCircularStdNormal),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 34),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFE5E6E0),
                                  ),
                                  height: 55,
                                  width: 55,
                                  child: Image.asset(
                                    "assets/icons/video.png",
                                    scale: 1.6,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Video",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: kCircularStdNormal),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFE5E6E0),
                                  ),
                                  height: 55,
                                  width: 55,
                                  child: Image.asset(
                                    "assets/icons/doc.png",
                                    scale: 1.7,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Document",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: kCircularStdNormal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bottomSheetforChat() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      builder: (context) {
        return Wrap(
          children: [
            const Center(
              child: ImageIcon(
                AssetImage("assets/icons/des.png"),
                size: 30,
                color: Color(0XffBFC5CC),
              ),
            ),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: 150,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "New Chat",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 22,
                              fontFamily: kCircularStdNormal),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          Get.back();
                          Get.toNamed(Routes.chatHistoryPage);
                        },
                        child: const Text(
                          "Chat History",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 22,
                              fontFamily: kCircularStdNormal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
