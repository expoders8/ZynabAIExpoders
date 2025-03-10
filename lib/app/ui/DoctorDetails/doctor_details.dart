import 'package:accordion/accordion.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zynabaiexpoders/app/ui/ChatWIthAI/chatwithaidoctor.dart';

import '../../../config/constant/constant.dart';
import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../FIneDoctorsNearby/fine_doctors_nearby.dart';
import '../widgets/custom_calander.dart';

class DoctoreDetailsPage extends StatefulWidget {
  final String? name;
  final String? year;
  final String? image;
  final String? roll;
  const DoctoreDetailsPage(
      {super.key,
      this.name = "Dr.Pooja\n Patel",
      this.year = "Physician / 2+ yrs",
      this.image = "assets/icons/ladydoctor.png",
      this.roll});

  @override
  State<DoctoreDetailsPage> createState() => _DoctoreDetailsPageState();
}

class _DoctoreDetailsPageState extends State<DoctoreDetailsPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  DateTime todayDate = DateTime.now();
  bool focuseToday = false;
  int selectedTimendex = 0;
  final Set<DateTime> customDates = {
    DateTime(DateTime.now().year, 5, 10),
    DateTime(DateTime.now().year, 5, 12),
    DateTime(DateTime.now().year, 5, 21),
  };
  String formattedDate = "";
  String selectedDayString = "";

  String selectedPerson = "";
  @override
  void initState() {
    if (widget.roll.toString() != "null") {
      var person = widget.roll ?? "";
      setState(() {
        selectedPerson = person;
      });
    } else {
      var person = getStorage.read("selctetperson") ?? "";
      setState(() {
        selectedPerson = person;
      });
    }
    super.initState();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
      });
    }

    String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDay!);
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
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Center(
                                child: Text(
                                  "ai",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 18,
                                  ),
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
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: selectedPerson == "Doctor" ? 0 : 10),
                            selectedPerson == "Doctor"
                                ? Container()
                                : const Text(
                                    "MBBS",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 15,
                                    ),
                                  ),
                            Text(
                              widget.year.toString(),
                              style: const TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  width: selectedPerson == "Doctor" ? 120 : 170,
                                  child: CupertinoButton(
                                    borderRadius: BorderRadius.circular(25),
                                    padding: EdgeInsets.zero,
                                    color: kPrimaryColor,
                                    onPressed: () {
                                      if (selectedPerson == "Doctor") {
                                        Get.to(
                                            () => const ChatWithDoctorPage());
                                      } else {
                                        Get.toNamed(Routes.patientDetailsPage);
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          selectedPerson == "Doctor"
                                              ? "Chat Now"
                                              : "CONSULT - \$50",
                                          style: const TextStyle(
                                            color: kWhiteColor,
                                            fontFamily: kCircularStdNormal,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                            width: selectedPerson == "Doctor"
                                                ? 10
                                                : 15),
                                        selectedPerson == "Doctor"
                                            ? const Icon(
                                                Icons.chat,
                                                size: 19,
                                              )
                                            : Image.asset(
                                                "assets/icons/arrow_right.png",
                                                scale: 1.3,
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                selectedPerson == "Doctor"
                                    ? GestureDetector(
                                        onTap: () async {
                                          // Get.toNamed(
                                          //     Routes.findDoctorNearbyPage);
                                          Get.to(() =>
                                              const FindDoctorNearbyPage(
                                                  roll: "Patient"));
                                        },
                                        child: Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                color: kPrimaryColor,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 8, 8, 8),
                                              child: Icon(
                                                Icons
                                                    .switch_access_shortcut_add_sharp,
                                                color: kWhiteColor,
                                              ),
                                            )),
                                      )
                                    : Container()
                              ],
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
                                      onTap: () async {
                                        print("Phone button tapped");
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
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Image.asset(
                                          "assets/icons/phone.png",
                                          scale: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "4.8",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 25,
                                      ),
                                    ),
                                    selectedPerson == "Doctor"
                                        ? Container()
                                        : const Text(
                                            "212 Reviews",
                                            style: TextStyle(
                                              color: kPrimaryColor,
                                              fontFamily: kCircularStdNormal,
                                              fontSize: 15,
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
                  selectedPerson == "Doctor"
                      ? Positioned(
                          top: 40,
                          right: 45,
                          child: Image.asset(
                            widget.image.toString(),
                            scale: 1.7,
                          ),
                        )
                      : Positioned(
                          top: -30,
                          right: 0,
                          child: Image.asset(
                            "assets/icons/ladydoctor.png",
                            scale: 2,
                          ),
                        ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    selectedPerson == "Doctor"
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Text(
                              //   "Services",
                              //   style: TextStyle(
                              //     color: kPrimaryColor,
                              //     fontSize: 18,
                              //     fontFamily: kCircularStdNormal,
                              //   ),
                              // ),
                              // const SizedBox(height: 10),
                              // Row(
                              //   children: [
                              //     buildServiceCardWidget("Fever"),
                              //     const SizedBox(width: 10),
                              //     buildServiceCardWidget("Cough"),
                              //     const SizedBox(width: 10),
                              //     buildServiceCardWidget("Sore Throat")
                              //   ],
                              // ),
                              // const SizedBox(height: 10),
                              // Row(
                              //   children: [
                              //     buildServiceCardWidget("Vomiting"),
                              //     const SizedBox(width: 10),
                              //     buildServiceCardWidget("Wheezes"),
                              //     const SizedBox(width: 10),
                              //     buildServiceCardWidget("Chest Pain")
                              //   ],
                              // ),
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
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  buildMedical("Family Medicine"),
                                ],
                              ),
                              const SizedBox(height: 10),
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
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      buildMedical("Geriatric Medicine"),
                                      const SizedBox(width: 5),
                                      buildMedical("Adolescent Medicine"),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
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
                              Row(
                                children: [
                                  buildMedical("General health check-ups"),
                                  const SizedBox(width: 5),
                                  buildMedical("Vaccinations"),
                                ],
                              ),
                              const SizedBox(height: 10),
                              buildMedical("Management of chronic conditions"),
                              // Card(
                              //   shadowColor: const Color.fromARGB(10, 0, 0, 0),
                              //   elevation: 5,
                              //   child: Container(
                              //     width: Get.width,
                              //     decoration: BoxDecoration(
                              //       color: kCardColor,
                              //       borderRadius: BorderRadius.circular(8.0),
                              //     ),
                              //     padding: const EdgeInsets.all(8.0),
                              //     child:  Padding(
                              //       padding:
                              //           const EdgeInsets.symmetric(horizontal: 10.0),
                              //       child: Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [

                              //           const SizedBox(height: 10),
                              //           const Row(
                              //             children: [
                              //               Icon(
                              //                 Icons.circle,
                              //                 color: kPrimaryColor,
                              //                 size: 12,
                              //               ),
                              //               SizedBox(width: 8),
                              //               Text(
                              //                 "General health check-ups",
                              //                 style: TextStyle(
                              //                     color: kSecondaryColor,
                              //                     fontFamily:
                              //                         kCircularStdMedium,
                              //                     fontSize: 14),
                              //               ),
                              //             ],
                              //           ),
                              //           const SizedBox(height: 5),
                              //           const Row(
                              //             children: [
                              //               Icon(
                              //                 Icons.circle,
                              //                 color: kPrimaryColor,
                              //                 size: 12,
                              //               ),
                              //               SizedBox(width: 8),
                              //               Text(
                              //                 "Vaccinations",
                              //                 style: TextStyle(
                              //                     color: kSecondaryColor,
                              //                     fontFamily:
                              //                         kCircularStdMedium,
                              //                     fontSize: 14),
                              //               ),
                              //             ],
                              //           ),
                              //           const SizedBox(height: 5),
                              //           const Row(
                              //             children: [
                              //               Icon(
                              //                 Icons.circle,
                              //                 color: kPrimaryColor,
                              //                 size: 12,
                              //               ),
                              //               SizedBox(width: 8),
                              //               Text(
                              //                 "Management of chronic conditions\n(diabetes, hypertension)",
                              //                 style: TextStyle(
                              //                     color: kSecondaryColor,
                              //                     fontFamily:
                              //                         kCircularStdMedium,
                              //                     fontSize: 14),
                              //               ),
                              //             ],
                              //           ),
                              //           const SizedBox(height: 10),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
                              SizedBox(
                                height: 395,
                                width: Get.width,
                                child: CustomCalendar(
                                  onDateSelected: (DateTime selectedDate) {
                                    setState(() {
                                      _selectedDay = selectedDate;
                                      DateTime date = DateTime.parse(
                                          _selectedDay.toString());
                                      formattedDate = DateFormat("dd MMM yyyy")
                                          .format(date);
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: _selectedDay != null ? 10 : 0),
                              if (_selectedDay != null)
                                Text("Selected Date: $formattedDate"),
                              SizedBox(height: _selectedDay != null ? 10 : 0),
                              if (_selectedDay != null)
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      buildContainer("7:00 AM"),
                                      const SizedBox(width: 10),
                                      buildContainer("7:30 AM"),
                                      const SizedBox(width: 10),
                                      buildContainer("8:00 AM"),
                                      const SizedBox(width: 10),
                                      buildContainer("8:30 AM"),
                                      const SizedBox(width: 10),
                                      buildContainer("9:00 AM"),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 15),

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
                              //       weekendStyle:
                              //           TextStyle(color: kTextSecondaryColor)),
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
                              //     titleTextStyle: TextStyle(
                              //         color: kTitleColor, fontSize: 15),
                              //     headerPadding: EdgeInsets.symmetric(
                              //         horizontal: 1, vertical: 10),
                              //   ),
                              //   calendarStyle: const CalendarStyle(
                              //     outsideDaysVisible: false,
                              //     defaultTextStyle:
                              //         TextStyle(color: kTitleColor),
                              //     defaultDecoration: BoxDecoration(
                              //       color: Color.fromARGB(255, 202, 200, 200),
                              //       shape: BoxShape.circle,
                              //     ),
                              //     selectedDecoration: BoxDecoration(
                              //       color: Color.fromARGB(255, 202, 200, 200),
                              //       shape: BoxShape.circle,
                              //     ),
                              //     holidayTextStyle:
                              //         TextStyle(color: kPrimaryColor),
                              //     selectedTextStyle:
                              //         TextStyle(color: kPrimaryColor),
                              //     weekendTextStyle:
                              //         TextStyle(color: kPrimaryColor),
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
                              //     String todayPage =
                              //         DateFormat('MM').format(todayDate);
                              //     if (formattedpageDate == todayPage) {
                              //       focuseToday = true;
                              //     } else {
                              //       focuseToday = true;
                              //     }
                              //   }),
                              // ),
                            ],
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
                            SizedBox(
                                height: selectedPerson == "Doctor" ? 0 : 10),
                            selectedPerson == "Doctor"
                                ? Container()
                                : Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 228, 228, 228),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Image.asset(
                                      "assets/icons/hospitale.png",
                                      scale: 1.6,
                                    ),
                                  ),
                            const SizedBox(height: 10),
                            selectedPerson == "Doctor"
                                ? Container()
                                : const Text(
                                    "Dr. Pooja Patel",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 20),
                                  ),
                            SizedBox(
                                height: selectedPerson == "Doctor" ? 0 : 10),
                            selectedPerson == "Doctor"
                                ? Container()
                                : const Text(
                                    "I am committed to providing exceptional healthcare services to my patients. With a focus on personalized care and evidence-based medicine, I strive to empower individuals to achieve optimal health.",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdNormal,
                                        fontSize: 15),
                                  ),
                            SizedBox(
                                height: selectedPerson == "Doctor" ? 10 : 20),
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
                    selectedPerson != "Doctor"
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Personal Details",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 19),
                                ),
                              ),
                              const SizedBox(height: 8),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                  color: kHighlightColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "DOB",
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontFamily:
                                                            kCircularStdMedium,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "20 Nov 1978",
                                              style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontFamily:
                                                      kCircularStdMedium,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                  color: kHighlightColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "Gender",
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontFamily:
                                                            kCircularStdMedium,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "Male",
                                              style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontFamily:
                                                      kCircularStdMedium,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                  color: kHighlightColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "Height",
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontFamily:
                                                            kCircularStdMedium,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "4.7 feet",
                                              style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontFamily:
                                                      kCircularStdMedium,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                  color: kHighlightColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "Weight",
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontFamily:
                                                            kCircularStdMedium,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "60 Kg",
                                              style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontFamily:
                                                      kCircularStdMedium,
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
                            ],
                          ),
                    selectedPerson != "Doctor"
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Current Health",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdNormal,
                                        fontSize: 19),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: kCardColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Weight",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "70 Kg",
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 25),
                                          Image.asset(
                                            "assets/icons/line_vertical.png",
                                            scale: 2,
                                            color: kDividerColor,
                                          ),
                                          const SizedBox(width: 25),
                                          const SizedBox(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "BP",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "120/80 mmHg",
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Last Visit",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "12-Jul-2024",
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 25),
                                          Image.asset(
                                            "assets/icons/line_vertical.png",
                                            scale: 2,
                                            color: kDividerColor,
                                          ),
                                          const SizedBox(width: 25),
                                          const SizedBox(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Medications",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "2",
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Height",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "170 cm",
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 25),
                                          Image.asset(
                                            "assets/icons/line_vertical.png",
                                            scale: 2,
                                            color: kDividerColor,
                                          ),
                                          const SizedBox(width: 25),
                                          const SizedBox(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Heart Rate",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "72 bpm",
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Temperature",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "36.8°C",
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 25),
                                          Image.asset(
                                            "assets/icons/line_vertical.png",
                                            scale: 2,
                                            color: kDividerColor,
                                          ),
                                          const SizedBox(width: 25),
                                          const SizedBox(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Oxygen Saturation",
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontFamily:
                                                          kCircularStdMedium,
                                                      fontSize: 14),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  "2",
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                               const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Medical History",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdNormal,
                                        fontSize: 19),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(right: 8.0),
                                  //   child: Text(
                                  //     "View All",
                                  //     style: TextStyle(
                                  //         color: kSecondaryPrimaryColor,
                                  //         fontFamily: kCircularStdNormal,
                                  //         fontSize: 14),
                                  //   ),
                                  // ),
                                ],
                              ),
                              Accordion(
                                headerBorderColorOpened: kPrimaryColor,
                                headerBackgroundColor: kHighlightColor,
                                headerBackgroundColorOpened: kHighlightColor,
                                contentBackgroundColor: Colors.white,
                                contentBorderColor: kWhiteColor,
                                contentBorderWidth: 1,
                                contentHorizontalPadding: 8,
                                scaleWhenAnimating: true,
                                openAndCloseAnimation: true,
                                disableScrolling: true,
                                headerPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                children: [
                                  AccordionSection(
                                    isOpen: true,
                                    contentVerticalPadding: 20,
                                    header: const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Personal History',
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdMedium,
                                            fontSize: 14),
                                      ),
                                    ),
                                    content: medicalHistory(
                                        "Personal History"), // Calls function without title duplication
                                  ),
                                  AccordionSection(
                                    isOpen: true,
                                    contentVerticalPadding: 20,
                                    header: const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Family History',
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdMedium,
                                            fontSize: 14),
                                      ),
                                    ),
                                    content: medicalHistory(
                                        "Family History"), // Calls function without title duplication
                                  ),
                                ],
                              ),
                            ],
                          ),
                    const SizedBox(height: 10),
                    selectedPerson == "Doctor"
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 0),
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
            ],
          ),
        ),
      ),
    );
  }

  detailcard(String titleText, subText) {
    return Card(
      elevation: 3,
      child: Container(
        width: Get.width / 2.3,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              subText,
              style: const TextStyle(
                color: kPrimaryColor,
                fontFamily: kCircularStdNormal,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              titleText,
              style: const TextStyle(
                color: kPrimaryColor,
                fontFamily: kCircularStdNormal,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildMedical(String text) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: const TextStyle(
                color: kPrimaryColor,
                fontFamily: kCircularStdNormal,
                fontSize: 15),
          ),
        ),
        Positioned(
          right: 0,
          top: -2,
          child: Container(
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(25)),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 15,
            ),
          ),
        )
      ],
    );
  }

  String? selectedTime;

  buildContainer(String text) {
    bool isSelected = selectedTime == text; // Check if this slot is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = text; // Update selected time
        });
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: isSelected
              ? kPrimaryColor
              : kHighlightColor, // Change color if selected
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color:
                  isSelected ? Colors.white : Colors.black, // Change text color
              fontWeight: FontWeight.bold,
            ),
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

  buildServiceCardWidget1(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: const TextStyle(
            color: kPrimaryColor, fontFamily: kCircularStdNormal, fontSize: 15),
      ),
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
                height: 220,
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
                  fontSize: 14,
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

  medicalHistory(String historyType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: historyType == "Personal History"
              ? [
                  buildMedical("Diabetes"),
                  const SizedBox(width: 10),
                  buildMedical("Hypertension"),
                ]
              : [
                  buildMedical("Diabetes"),
                  const SizedBox(width: 10),
                  buildMedical("Cancer"),
                ],
        ),
      ],
    );
  }
}
