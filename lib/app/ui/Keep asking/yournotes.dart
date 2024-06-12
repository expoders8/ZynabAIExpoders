import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class YourNotesPage extends StatefulWidget {
  const YourNotesPage({super.key});

  @override
  _YourNotesPageState createState() => _YourNotesPageState();
}

class _YourNotesPageState extends State<YourNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(35)),
                  child: Image.asset("assets/icons/h4.png"),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Your Notes:",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontFamily: kCircularStdMedium,
                        fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: kHighlightColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                          child: Text(
                        "01",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 14),
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 150,
                          width: 2,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: kHighlightColor, width: 0.8)),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 65,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF929292),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "DOCTOR",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 3.0),
                              child: Text(
                                "Chief Complaint",
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 65,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF929292),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "PATIENT",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(
                              width: 260,
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.0),
                                child: Text(
                                  "I’ve had a sore throat and runny nose for the past three days.",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: kHighlightColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                          child: Text(
                        "02",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 14),
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 130,
                          width: 2,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: kHighlightColor, width: 0.8)),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 65,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF929292),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "DOCTOR",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 3.0),
                              child: Text(
                                "History of Present Illness",
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 65,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF929292),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "PATIENT",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(
                              width: 305,
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.0),
                                child: Text(
                                  "The sore throat started first, feels scratchy and painful, especially when swallowing",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: kHighlightColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                          child: Text(
                        "03",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 14),
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 130,
                          width: 2,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: kHighlightColor, width: 0.8)),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 65,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF929292),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "DOCTOR",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 3.0),
                              child: Text(
                                "Past Medical History",
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 65,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF929292),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "PATIENT",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(
                              width: 260,
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.0),
                                child: Text(
                                  "Generally healthy, no major illnesses or surgeries",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 1, color: kWhiteColor)),
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: kHighlightColor,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Tap to start adding more notes",
                        style: TextStyle(
                            color: kWhiteColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: Get.width,
                  child: CupertinoButton(
                    color: kHighlightColor,
                    borderRadius: BorderRadius.circular(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "ADD TO PROFILE",
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
                    onPressed: () {
                      // Get.toNamed(Routes.appointmentScheduledPage);
                    },
                  ),
                ),
                const SizedBox(height: 90)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
