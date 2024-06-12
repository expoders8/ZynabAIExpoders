import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class KeepAsking extends StatefulWidget {
  const KeepAsking({super.key});

  @override
  _KeepAskingState createState() => _KeepAskingState();
}

class _KeepAskingState extends State<KeepAsking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 75,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(35)),
              child: Image.asset("assets/icons/h4.png"),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Keep asking…",
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
              "I’m listening and noting down \neverything for you",
              style: TextStyle(
                  color: kWhiteColor,
                  fontFamily: kCircularStdNormal,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          AvatarGlow(
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
          ),
          SizedBox(
            height: Get.height / 4.7,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1, color: kWhiteColor)),
                  child: const Center(
                    child: Icon(
                      Icons.square,
                      size: 15,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Text(
                "Tap to stop",
                style: TextStyle(
                    color: kWhiteColor,
                    fontFamily: kCircularStdNormal,
                    fontSize: 16),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
