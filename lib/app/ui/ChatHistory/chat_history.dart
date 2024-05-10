import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class ChatHistoryPage extends StatefulWidget {
  const ChatHistoryPage({super.key});

  @override
  State<ChatHistoryPage> createState() => _ChatHistoryPageState();
}

class _ChatHistoryPageState extends State<ChatHistoryPage> {
  String selectedHistory = "media";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        leading: CupertinoButton(
          padding: const EdgeInsets.all(9),
          onPressed: () {
            Get.back();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kWhiteColor, width: 1)),
            child: Image.asset(
              "assets/icons/arrow_left.png",
              color: kWhiteColor,
              scale: 1.5,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Chat history\nand media files",
              style: TextStyle(
                  color: kWhiteColor,
                  fontFamily: kCircularStdNormal,
                  fontSize: 19),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedHistory = "media";
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: selectedHistory == "media"
                            ? kHighlightColor
                            : const Color(0xFF808080),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Media",
                      style: TextStyle(
                          color: selectedHistory == "media"
                              ? kPrimaryColor
                              : kWhiteColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedHistory = "chathistory";
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: selectedHistory == "chathistory"
                            ? kHighlightColor
                            : const Color(0xFF808080),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Chat History",
                      style: TextStyle(
                          color: selectedHistory == "chathistory"
                              ? kPrimaryColor
                              : kWhiteColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                buildHistory("01"),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                const SizedBox(height: 10),
                buildHistory("02"),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                const SizedBox(height: 10),
                buildHistory("03"),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                const SizedBox(height: 10),
                buildHistory("04"),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                const SizedBox(height: 10),
                buildHistory("05"),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                const SizedBox(height: 10),
                buildHistory("06"),
                const Divider(
                  thickness: 0.8,
                  color: kDividerColor,
                ),
                const SizedBox(height: 10),
                buildHistory("07")
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  buildHistory(String number) {
    return Row(
      children: [
        selectedHistory == "chathistory"
            ? Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: kHighlightColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Text(
                  number,
                  style: const TextStyle(
                      color: kPrimaryColor, fontFamily: kCircularStdMedium),
                )),
              )
            : Image.asset(
                "assets/icons/h8.png",
                scale: 3.2,
              ),
        const SizedBox(width: 7),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let’s reduce a fever at home.",
              style: TextStyle(
                  color: kWhiteColor,
                  fontFamily: kCircularStdMedium,
                  fontSize: 14),
            ),
            Text(
              "23rd Mar",
              style: TextStyle(
                  color: kWhiteColor,
                  fontFamily: kCircularStdNormal,
                  fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: kWhiteColor, width: 0.5)),
          child: Image.asset(
            "assets/icons/download.png",
            color: kWhiteColor,
            scale: 1.4,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: kWhiteColor, width: 0.5)),
          child: Image.asset(
            "assets/icons/arrow_left.png",
            color: kWhiteColor,
            scale: 1.4,
          ),
        )
      ],
    );
  }
}
