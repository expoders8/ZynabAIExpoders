import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class MultipalSicknessPage extends StatefulWidget {
  const MultipalSicknessPage({super.key});

  @override
  State<MultipalSicknessPage> createState() => _MultipalSicknessPageState();
}

class _MultipalSicknessPageState extends State<MultipalSicknessPage> {
  final TextEditingController searchController = TextEditingController();
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
              "What sickness are\nyou facing?",
              style: TextStyle(
                  color: kWhiteColor,
                  fontFamily: kCircularStdNormal,
                  fontSize: 19),
            ),
            TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: kWhiteColor),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kWhiteColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                buildSicknessWidget("Wheezes"),
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
                buildSicknessWidget("Sore Throat")
              ],
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
                buildSicknessWidget("Wheezes"),
                const SizedBox(width: 10),
                buildSicknessWidget("Rash"),
                const SizedBox(width: 10),
                buildSicknessWidget("Chest Pain")
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildSicknessWidget("Wheezes"),
                const SizedBox(width: 10),
                buildSicknessWidget("Rash"),
                const SizedBox(width: 10),
                buildSicknessWidget("Chest Pain")
              ],
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
                buildSicknessWidget("Wheezes"),
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
                buildSicknessWidget("Sore Throat")
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildSicknessWidget("Fever"),
                const SizedBox(width: 10),
                buildSicknessWidget("Cough"),
                const SizedBox(width: 10),
                buildSicknessWidget("Vomiting")
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  buildSicknessWidget(String text) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xFF808080),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: const TextStyle(
              color: kWhiteColor, fontFamily: kCircularStdNormal, fontSize: 15),
        ),
      ),
    );
  }
}
