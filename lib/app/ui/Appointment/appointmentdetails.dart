import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../widgets/custom_calander.dart';

class AppointmentDetailsPage extends StatefulWidget {
  final String? name;
  final String? year;
  const AppointmentDetailsPage(
      {super.key,
      this.name = "Dr.Pooja\n Patel",
      this.year = "Physician / 2+ yrs"});

  @override
  State<AppointmentDetailsPage> createState() => _DoctoreDetailsPageState();
}

class _DoctoreDetailsPageState extends State<AppointmentDetailsPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime todayDate = DateTime.now();
  bool focuseToday = false;
  int selectedTimendex = 0;
  final Set<DateTime> customDates = {
    DateTime(DateTime.now().year, 5, 10),
    DateTime(DateTime.now().year, 5, 12),
    DateTime(DateTime.now().year, 5, 21),
  };

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
      });
    }

    String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDay);
    String today = DateFormat('dd/MM/yyyy').format(todayDate);
    if (formattedDate == today) {
      setState(() {
        focuseToday = false;
      });
    } else {
      setState(() {
        focuseToday = true;
      });
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
                            Container(
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
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 160,
                              child: Text(
                                widget.name.toString(),
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 25),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "MBBS",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 15),
                            ),
                            Text(
                              widget.year.toString(),
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 170,
                              child: CupertinoButton(
                                borderRadius: BorderRadius.circular(25),
                                padding: EdgeInsets.zero,
                                color: kPrimaryColor,
                                onPressed: () {
                                  Get.toNamed(Routes.patientDetailsPage);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "CONSULT - \$50",
                                      style: TextStyle(
                                          color: kWhiteColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 15),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
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
                                    GestureDetector(
                                      onTap: () {
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
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "4.8",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "212 Reviews",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 15),
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
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/alarm.png",
                          fit: BoxFit.contain,
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "Set Alarm",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Card(
                      shadowColor: const Color.fromARGB(10, 0, 0, 0),
                      elevation: 5,
                      child: Container(
                        width: Get.width,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
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
                    SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Main Specialization",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 19),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        buildServiceCardWidget("Family Medicine"),
                      ],
                    ),
                    SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Sub-Specializations",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 19),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        buildServiceCardWidget("Geriatric Medicine"),
                        const SizedBox(width: 2),
                        buildServiceCardWidget("Adolescent Medicine"),
                      ],
                    ),
                    SizedBox(height: 10),
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
                    Card(
                      shadowColor: const Color.fromARGB(10, 0, 0, 0),
                      elevation: 5,
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: kCardColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: kPrimaryColor,
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "General health check-ups",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: kPrimaryColor,
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Vaccinations",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: kPrimaryColor,
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Management of chronic conditions\n(diabetes, hypertension)",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Availability",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontFamily: kCircularStdNormal,
                      ),
                    ),
                    SizedBox(
                        height: 395, width: Get.width, child: CustomCalendar()),
                    // TableCalendar(
                    //   firstDay: DateTime.utc(2010, 10, 16),
                    //   rowHeight: 51,
                    //   lastDay: DateTime.utc(2030, 3, 14),
                    //   focusedDay: _selectedDay,
                    //   selectedDayPredicate: (day) =>
                    //       isSameDay(_selectedDay, day),
                    //   calendarFormat: _calendarFormat,
                    //   onDaySelected: _onDaySelected,
                    //   daysOfWeekStyle: const DaysOfWeekStyle(
                    //       weekdayStyle: TextStyle(color: kTitleColor),
                    //       weekendStyle: TextStyle(color: kTextSecondaryColor)),
                    //   startingDayOfWeek: StartingDayOfWeek.monday,
                    //   calendarBuilders: CalendarBuilders(
                    //     markerBuilder: (date, events, holidays) {
                    //       if (customDates.contains(date)) {
                    //         return Positioned(
                    //           right: 1,
                    //           bottom: 1,
                    //           child: Container(
                    //             decoration: const BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               color: Colors.blue,
                    //             ),
                    //             width: 5,
                    //             height: 5,
                    //           ),
                    //         );
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    //   headerStyle: const HeaderStyle(
                    //     formatButtonVisible: false,
                    //     titleCentered: false,
                    //     leftChevronVisible: false,
                    //     rightChevronVisible: false,
                    //     titleTextStyle:
                    //         TextStyle(color: kTitleColor, fontSize: 15),
                    //     headerPadding:
                    //         EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                    //   ),
                    //   calendarStyle: const CalendarStyle(
                    //     outsideDaysVisible: false,
                    //     defaultTextStyle: TextStyle(color: kTitleColor),
                    //     defaultDecoration: BoxDecoration(
                    //       color: Color.fromARGB(255, 202, 200, 200),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     selectedDecoration: BoxDecoration(
                    //       color: Color.fromARGB(255, 202, 200, 200),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     holidayTextStyle: TextStyle(color: kPrimaryColor),
                    //     selectedTextStyle: TextStyle(color: kPrimaryColor),
                    //     weekendTextStyle: TextStyle(color: kPrimaryColor),
                    //     weekendDecoration: BoxDecoration(
                    //       color: Color.fromARGB(255, 202, 200, 200),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     todayDecoration: BoxDecoration(
                    //       color: kWhiteColor,
                    //       shape: BoxShape.circle,
                    //     ),
                    //   ),
                    //   onFormatChanged: (formet) {
                    //     if (_calendarFormat != formet) {
                    //       setState(() {
                    //         _calendarFormat = formet;
                    //       });
                    //     }
                    //   },
                    //   onHeaderTapped: (focusedDay) {
                    //     setState(() {
                    //       _calendarFormat = CalendarFormat.month;
                    //     });
                    //   },
                    //   onPageChanged: ((focusedDay) {
                    //     String formattedpageDate =
                    //         DateFormat('MM').format(focusedDay);
                    //     String todayPage = DateFormat('MM').format(todayDate);
                    //     if (formattedpageDate == todayPage) {
                    //       focuseToday = true;
                    //     } else {
                    //       focuseToday = true;
                    //     }
                    //   }),
                    // ),

                    const SizedBox(height: 20),
                    const Text(
                      "About",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontFamily: kCircularStdNormal,
                      ),
                    ),

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
                            const SizedBox(height: 10),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 228, 228, 228),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image.asset(
                                "assets/icons/hospitale.png",
                                scale: 1.6,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Dr. Pooja Patel",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "I am committed to providing exceptional healthcare services to my patients. With a focus on personalized care and evidence-based medicine, I strive to empower individuals to achieve optimal health.",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            const Divider(color: kPrimaryColor),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: kHighlightColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "E",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "johnddoe@gmail.com",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: kHighlightColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "M",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "+91738475655",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: kHighlightColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "L",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "234 Block, Mumbai Complex, India",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
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
                            onPressed: () {},
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
                          onPressed: () {
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
            ],
          ),
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
}
