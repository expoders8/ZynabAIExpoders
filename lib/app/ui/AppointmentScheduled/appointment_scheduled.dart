import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../TabPage/tabpage.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class AppointmentScheduledPage extends StatefulWidget {
  const AppointmentScheduledPage({
    super.key,
  });

  @override
  State<AppointmentScheduledPage> createState() =>
      _AppointmentScheduledPageState();
}

class _AppointmentScheduledPageState extends State<AppointmentScheduledPage> {
  DateTime todayDate = DateTime.now();
  bool focuseToday = false;
  int selectedTimendex = 0;
  final Set<DateTime> customDates = {
    DateTime(DateTime.now().year, 5, 10),
    DateTime(DateTime.now().year, 5, 12),
    DateTime(DateTime.now().year, 5, 21),
  };

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
              "assets/icons/close.png",
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Image.asset(
                "assets/icons/vartical_dots.png",
                scale: 1.8,
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
              const SizedBox(height: 30),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    shadowColor: const Color.fromARGB(10, 0, 0, 0),
                    elevation: 5,
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
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
                              const SizedBox(width: 10),
                              const Text(
                                "Accepting\nNew patient",
                                style: TextStyle(
                                    color: kSecondaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          const SizedBox(
                            width: 160,
                            child: Text(
                              "Appointment\nScheduled",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 25),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            "5Th Mar 24",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdMedium,
                                fontSize: 16),
                          ),
                          const Text(
                            "10;30 AM",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 15),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            width: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: kGreenColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 23,
                                  width: 23,
                                  decoration: BoxDecoration(
                                      color: kGreenColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Icon(
                                    Icons.check,
                                    color: kWhiteColor,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                const Text("Scheduled"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    right: 0,
                    child: Image.asset(
                      "assets/icons/ladydoctor.png",
                      scale: 2,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/alarm.png",
                    scale: 1.5,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Set Alarm",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontFamily: kCircularStdNormal,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                shadowColor: const Color.fromARGB(10, 0, 0, 0),
                elevation: 5,
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14),
                      Text(
                        "Dr. Pooja Patel",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 25),
                      ),
                      SizedBox(height: 14),
                      Text(
                        "5Th Mar 2024 - 10:30 am",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 16),
                      ),
                      Text(
                        "Consultation Date",
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 15),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 16),
                      ),
                      Text(
                        "Payment Mode",
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 15),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "647364536",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 16),
                      ),
                      Text(
                        "Transaction ID",
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 15),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        bottomSheetforChat();
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
                          Get.offAll(() => const TabPage(selectedTabIndex: 0));
                        },
                        child: const Text(
                          "SAVE RECEIPT",
                          style: TextStyle(
                              color: kWhiteColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 14),
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
                  ],
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDayWidget(DateTime date, Color color) {
    return Container(
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Text(
        date.day.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  buildServiceCardWidget(String text) {
    return Container(
      decoration: BoxDecoration(
          color: kCardColor, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Text(text),
    );
  }

  bottomSheetforChat() {
    showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      builder: (context) {
        int? localSelectedTimeIndex = selectedTimendex;

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
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Text(
                        "Select Time",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 22,
                            fontFamily: kCircularStdNormal),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildTimeWidget("09:00", 0),
                          const SizedBox(width: 10),
                          buildTimeWidget("10:30", 1),
                          const SizedBox(width: 10),
                          buildTimeWidget("11:00", 2),
                          const SizedBox(width: 10),
                          buildTimeWidget("11:30", 3),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedTimendex = localSelectedTimeIndex;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Confirm'),
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

  Widget buildTimeWidget(
    String time,
    int index,
  ) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: selectedTimendex == index ? kPrimaryColor : kWhiteColor,
            borderRadius: BorderRadius.circular(60),
          ),
          height: 70,
          width: 70,
          child: CupertinoButton(
            borderRadius: BorderRadius.circular(60),
            onPressed: () {
              setState(() {
                selectedTimendex = index;
              });
            },
            child: Text(
              time,
              style: TextStyle(
                  color:
                      selectedTimendex == index ? kWhiteColor : kPrimaryColor,
                  fontSize: 16,
                  fontFamily: kCircularStdNormal),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "AM",
          style: TextStyle(
              color: kSecondaryColor,
              fontSize: 16,
              fontFamily: kCircularStdNormal),
        ),
      ],
    );
  }
}
