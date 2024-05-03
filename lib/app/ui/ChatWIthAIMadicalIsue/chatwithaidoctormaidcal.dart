import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynabaiexpoders/app/routes/app_pages.dart';
import 'package:zynabaiexpoders/config/constant/color_constant.dart';
import 'package:zynabaiexpoders/config/constant/font_constant.dart';

class ChatWithDoctorMadicalPage extends StatefulWidget {
  const ChatWithDoctorMadicalPage({super.key});

  @override
  State<ChatWithDoctorMadicalPage> createState() => _ChatWithDoctorPageState();
}

class _ChatWithDoctorPageState extends State<ChatWithDoctorMadicalPage> {
  FocusNode focusNode = FocusNode();
  var msgController = TextEditingController();
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
      body: Padding(
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
              "Dental Medical Issues",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: kCircularStdMedium,
                  fontSize: 15),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildSicknessWidget("Tooth Decay"),
                const SizedBox(width: 10),
                buildSicknessWidget("Bad Breath"),
                const SizedBox(width: 10),
                buildSicknessWidget("Dry")
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildSicknessWidget("Tooth Fractures"),
                const SizedBox(width: 10),
                buildSicknessWidget("Tooth Erosion"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildSicknessWidget("Oral Thrush"),
                const SizedBox(width: 10),
                buildSicknessWidget("plus")
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                SizedBox(
                  width: Get.width - 88,
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
                              border:
                                  Border.all(color: kBorderColor, width: 1.0)),
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
                          Get.toNamed(Routes.userChatPage);
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
                const SizedBox(width: 10),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: kHighlightColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset("assets/icons/mic.png", scale: 1.5),
                )
              ],
            ),
          ],
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
