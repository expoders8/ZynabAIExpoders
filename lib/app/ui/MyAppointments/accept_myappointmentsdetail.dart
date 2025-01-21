import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../Keep asking/keepasking.dart';

class AcceptedMyAppointmentDetailPage extends StatefulWidget {
  const AcceptedMyAppointmentDetailPage({super.key});

  @override
  State<AcceptedMyAppointmentDetailPage> createState() =>
      _AcceptedMyAppointmentDetailPageState();
}

class _AcceptedMyAppointmentDetailPageState
    extends State<AcceptedMyAppointmentDetailPage> {
  int selectCatgoryIndex = 0, selectAsstenIndex = 0;
  int selectedTimendex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: kWhiteColor),
              child: Image.asset(
                "assets/icons/collection.png",
                scale: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: kCardColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0)),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                              color: kHighlightColor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: const Center(
                                            child: Text(
                                              "ai",
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontFamily:
                                                      kCircularStdMedium,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "New Patient\nRequest",
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontFamily: kCircularStdMedium,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const SizedBox(
                                      width: 160,
                                      child: Text(
                                        "Amelia\nKimani",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdMedium,
                                            fontSize: 25),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "5Th Mar 2024",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 15),
                                    ),
                                    const Text(
                                      "10:30 AM",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 6),
                                Image.asset(
                                  "assets/icons/g2.png",
                                  scale: 1.6,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 150,
                              child: CupertinoButton(
                                borderRadius: BorderRadius.circular(25),
                                padding: EdgeInsets.zero,
                                color: kPrimaryColor,
                                onPressed: () {
                                  Get.to(() => const KeepAsking());
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "START NOTES",
                                      style: TextStyle(
                                          color: kWhiteColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 14),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.radio_button_checked_outlined,
                                      color: kRedColor,
                                      size: 17,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: kHighlightColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(14.0),
                              bottomRight: Radius.circular(14.0)),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Column(
                          children: [
                            const SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Get.toNamed(Routes.userChatPage);
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: kHighlightColor,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                color: kPrimaryColor,
                                                width: 0.5)),
                                        child: Image.asset(
                                          "assets/icons/send.png",
                                          scale: 1.5,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () async {
                                        launch('tel:1234567899');
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: kHighlightColor,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                color: kPrimaryColor,
                                                width: 0.5)),
                                        child: Image.asset(
                                          "assets/icons/phone.png",
                                          scale: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/alarm.png",
                      fit: BoxFit.contain,
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Set Alarm",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                shadowColor: const Color.fromARGB(10, 0, 0, 0),
                elevation: 5,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Appointment",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 22),
                            ),
                            Container(
                              width: Get.width / 4.1,
                              decoration: BoxDecoration(
                                  color: kBackGroundColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                          color: kWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Image.asset(
                                          "assets/icons/check_yellow.png"),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Text(
                                      "Upcoming",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "5",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 17),
                              ),
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(2, -4),
                                  child: const Text(
                                    "th",
                                    textScaleFactor: 0.7,
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdNormal,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              const TextSpan(
                                text: " Mar 2024 - 10:30 am",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Consultation Date",
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Online",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 17),
                        ),
                        const Text(
                          "Payment Mode",
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Home Visit",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 17),
                        ),
                        const Text(
                          "Visit Type",
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "647364536",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 17),
                        ),
                        const Text(
                          "Transaction ID",
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                shadowColor: const Color.fromARGB(10, 0, 0, 0),
                elevation: 5,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "Medical Notes",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 22),
                        ),
                        const SizedBox(height: 10),
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
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      width: 0.8)),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 65,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "DOCTOR",
                                      style: TextStyle(
                                          color: kPrimaryColor,
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
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 18),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 65,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "PATIENT",
                                      style: TextStyle(
                                          color: kPrimaryColor,
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
                                          color: kPrimaryColor,
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
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      width: 0.8)),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 65,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "DOCTOR",
                                      style: TextStyle(
                                          color: kPrimaryColor,
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
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 18),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 65,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "PATIENT",
                                      style: TextStyle(
                                          color: kPrimaryColor,
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
                                      "The sore throat started first, feels scratchy and painful, especially when swallowing",
                                      style: TextStyle(
                                          color: kPrimaryColor,
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
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      width: 0.8)),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 65,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "DOCTOR",
                                      style: TextStyle(
                                          color: kPrimaryColor,
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
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 18),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 65,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 225, 225, 225),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "PATIENT",
                                      style: TextStyle(
                                          color: kPrimaryColor,
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
                                          color: kPrimaryColor,
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
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Services",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 19),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildSicknessWidget("Fever"),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Cough"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildSicknessWidget("Vomiting"),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Wheezes"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Contact Details",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 19),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                shadowColor: const Color.fromARGB(10, 0, 0, 0),
                elevation: 5,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "E",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "johnddoe@gmail.com",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "M",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "+91738475655",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "L",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "234 Block, Mumbai Complex, India",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 0),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.toNamed(Routes.userChatPage);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kWhiteColor),
                      child: Image.asset(
                        "assets/icons/send.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(25),
                      padding: EdgeInsets.zero,
                      color: kPrimaryColor,
                      onPressed: () {
                        bottomSheetforChat();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "REMIND",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 14),
                          ),
                          const SizedBox(width: 15),
                          Image.asset(
                            "assets/icons/arrow_right.png",
                            scale: 1.3,
                          )
                        ],
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      launch('tel:1234567899');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kWhiteColor),
                      child: Image.asset(
                        "assets/icons/phone.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 0)
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      )),
    );
  }

  bottomSheetforChat() {
    showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop(); // Close the bottom sheet
            Get.toNamed('/nextPage'); // Navigate to the next page
          }
        });
        return Wrap(
          children: [
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CupertinoButton(
                        padding: const EdgeInsets.all(9),
                        onPressed: () {
                          Get.back();
                        },
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xFF02BB8F)),
                            child: const Icon(
                              Icons.check,
                              color: kWhiteColor,
                            )),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Requested Accepted",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 22,
                            fontFamily: kCircularStdNormal),
                      ),
                      const SizedBox(height: 10),
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
