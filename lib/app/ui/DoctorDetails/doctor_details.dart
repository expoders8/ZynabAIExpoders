import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class DoctoreDetailsPage extends StatefulWidget {
  const DoctoreDetailsPage({super.key});

  @override
  State<DoctoreDetailsPage> createState() => _DoctoreDetailsPageState();
}

class _DoctoreDetailsPageState extends State<DoctoreDetailsPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime todayDate = DateTime.now();
  bool focuseToday = false;
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
            onPressed: () {
              Get.back();
            },
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
                  Positioned(
                    bottom: -80,
                    child: Card(
                      shadowColor: const Color.fromARGB(10, 0, 0, 0),
                      elevation: 5,
                      child: Container(
                        width: Get.width - 38,
                        decoration: BoxDecoration(
                          color: kHighlightColor,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
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
                                    const SizedBox(width: 10),
                                    Container(
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
                          const Text(
                            "Dr. Pooja\nPatel",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdMedium,
                                fontSize: 25),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "MBBS",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 15),
                          ),
                          const Text(
                            "Physician / 2+ yrs",
                            style: TextStyle(
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
                              onPressed: () {},
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
              const SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Services",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontFamily: kCircularStdNormal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        buildServiceCardWidget("Fever"),
                        const SizedBox(width: 10),
                        buildServiceCardWidget("Cough"),
                        const SizedBox(width: 10),
                        buildServiceCardWidget("Sore Throat")
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        buildServiceCardWidget("Vomiting"),
                        const SizedBox(width: 10),
                        buildServiceCardWidget("Wheezes"),
                        const SizedBox(width: 10),
                        buildServiceCardWidget("Chest Pain")
                      ],
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
                    const SizedBox(height: 10),
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      rowHeight: 51,
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _selectedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      calendarFormat: _calendarFormat,
                      onDaySelected: _onDaySelected,
                      daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: kTitleColor),
                          weekendStyle: TextStyle(color: kTextSecondaryColor)),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarBuilders: CalendarBuilders(
                        markerBuilder: (date, events, holidays) {
                          if (customDates.contains(date)) {
                            return Positioned(
                              right: 1,
                              bottom: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                width: 5,
                                height: 5,
                              ),
                            );
                          }
                          return null;
                        },
                      ),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: false,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        titleTextStyle:
                            TextStyle(color: kTitleColor, fontSize: 15),
                        headerPadding:
                            EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                      ),
                      calendarStyle: const CalendarStyle(
                        outsideDaysVisible: false,
                        defaultTextStyle: TextStyle(color: kTitleColor),
                        defaultDecoration: BoxDecoration(
                          color: Color.fromARGB(255, 202, 200, 200),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Color.fromARGB(255, 202, 200, 200),
                          shape: BoxShape.circle,
                        ),
                        holidayTextStyle: TextStyle(color: kPrimaryColor),
                        selectedTextStyle: TextStyle(color: kPrimaryColor),
                        weekendTextStyle: TextStyle(color: kPrimaryColor),
                        weekendDecoration: BoxDecoration(
                          color: Color.fromARGB(255, 202, 200, 200),
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: kWhiteColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      onFormatChanged: (formet) {
                        if (_calendarFormat != formet) {
                          setState(() {
                            _calendarFormat = formet;
                          });
                        }
                      },
                      onHeaderTapped: (focusedDay) {
                        setState(() {
                          _calendarFormat = CalendarFormat.month;
                        });
                      },
                      onPageChanged: ((focusedDay) {
                        String formattedpageDate =
                            DateFormat('MM').format(focusedDay);
                        String todayPage = DateFormat('MM').format(todayDate);
                        if (formattedpageDate == todayPage) {
                          focuseToday = true;
                        } else {
                          focuseToday = true;
                        }
                      }),
                    ),
                    const Text(
                      "About",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontFamily: kCircularStdNormal,
                      ),
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
                            const SizedBox(height: 20),
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
                            Get.back();
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
                                  "CONSULT - \$50",
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
                            Get.back();
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

  Widget _buildDayWidget(DateTime date, Color color) {
    return Container(
      margin: EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Text(
        date.day.toString(),
        style: TextStyle(
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
}