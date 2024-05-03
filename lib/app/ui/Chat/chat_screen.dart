import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class UserChatPage extends StatefulWidget {
  const UserChatPage({
    super.key,
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
  void listen() async {
    if (!islisteing) {
      bool available = await speechToText.initialize();
      if (available) {
        setState(() {
          islisteing = true;
        });
        speechToText.listen(
          onResult: (result) => setState(
            () {
              text = result.recognizedWords;
              if (text != "") {
                setState(() {
                  islisteing = false;
                });
              }
            },
          ),
        );
      }
    } else {
      setState(() {
        islisteing = false;
      });
      speechToText.stop();
    }
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
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: Get.height - 190,
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
                                                                .circular(25)),
                                                    child: Image.asset(
                                                        "assets/icons/download.png",
                                                        scale: 1.3),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Container(
                                                    height: 38,
                                                    width: 38,
                                                    decoration: BoxDecoration(
                                                        color: kPrimaryColor,
                                                        border: Border.all(
                                                            color:
                                                                kPrimaryColor,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: Image.asset(
                                                        "assets/icons/arrow_right.png",
                                                        scale: 1.3),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                      listen();
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
                        child: Image.asset("assets/icons/mic.png", scale: 1.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition1(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.bottomCenter,
              scale: animation,
              child: child,
            );
          },
        );
}
