import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class MyAppointmentsPage extends StatefulWidget {
  const MyAppointmentsPage({super.key});

  @override
  State<MyAppointmentsPage> createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> {
  FocusNode focusNode = FocusNode();
  var searchController = TextEditingController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My\nAppointments",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 23),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  buildSicknessWidget("All", 0),
                  const SizedBox(width: 10),
                  buildSicknessWidget("New", 1),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Completed", 2)
                ],
              ),
              TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: kPrimaryColor),
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
              const SizedBox(height: 15),
              Expanded(
                child: Column(
                  children: [
                    selectedIndex == 0
                        ? Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              child: Column(
                                children: [
                                  const SizedBox(height: 7),
                                  Row(
                                    children: [
                                      buildNearby(
                                          "Vincent\nChepkwony",
                                          "assets/icons/h7.png",
                                          "5",
                                          "th",
                                          " Mar 2024-10:30 AM"),
                                      buildNearby(
                                          "Amelia\nKimani",
                                          "assets/icons/h6.png",
                                          "5",
                                          "th",
                                          " Mar 2024-10:30 AM"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      buildNearby(
                                          "Aryaa\nPatel",
                                          "assets/icons/h3.png",
                                          "5",
                                          "th",
                                          " Mar 2024-10:30 AM"),
                                      buildNearby(
                                          "Pooja\nPatel",
                                          "assets/icons/h5.png",
                                          "5",
                                          "th",
                                          " Mar 2024-10:30 AM"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      buildNearby(
                                          "Scarlett\nKimani",
                                          "assets/icons/g2.png",
                                          "5",
                                          "th",
                                          " Mar 2024-10:30 AM"),
                                      buildNearby(
                                          "Sophia\nJohn",
                                          "assets/icons/h2.png",
                                          "5",
                                          "th",
                                          " Mar 2024-10:30 AM"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 85, //tirth
                                  )
                                ],
                              ),
                            ),
                          )
                        : selectedIndex == 1
                            ? const Text("NEW")
                            // ? Expanded(
                            //     child: SingleChildScrollView(
                            //       child: Column(
                            //         children: [
                            //           Row(
                            //             children: [
                            //               buildNearby(
                            //                   "Dr. Pooja\nPatel",
                            //                   "assets/icons/h1.png",
                            //                   "4.5",
                            //                   "Physician / 2+ yrs"),
                            //               const SizedBox(width: 5),
                            //               buildNearby(
                            //                   "Dr. Aryaa\nPatel",
                            //                   "assets/icons/h3.png",
                            //                   "4.8",
                            //                   "Surgeons / 8+ yrs"),
                            //             ],
                            //           ),
                            //           const SizedBox(height: 10),
                            //           Row(
                            //             children: [
                            //               buildNearby(
                            //                   "Dr. Amelia\nKimani",
                            //                   "assets/icons/h5.png",
                            //                   "4.5",
                            //                   "Physician / 2+ yrs"),
                            //               const SizedBox(width: 5),
                            //               buildNearby(
                            //                   "Dr. Vincent\nChepkwony",
                            //                   "assets/icons/doctor4.png",
                            //                   "4.8",
                            //                   "Surgeons / 8+ yrs"),
                            //             ],
                            //           ),
                            //           const SizedBox(height: 10),
                            //           Row(
                            //             children: [
                            //               buildNearby(
                            //                   "Dr. Anusha\nPriya",
                            //                   "assets/icons/doctor1.png",
                            //                   "4.5",
                            //                   "Physician / 2+ yrs"),
                            //               const SizedBox(width: 5),
                            //               buildNearby(
                            //                   "Dr. John\nDoe",
                            //                   "assets/icons/doctor5.png",
                            //                   "4.8",
                            //                   "Surgeons / 8+ yrs"),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   )
                            : Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 7),
                                      Row(
                                        children: [
                                          buildNearby(
                                              "Vincent\nChepkwony",
                                              "assets/icons/h7.png",
                                              "5",
                                              "th",
                                              " Mar 2024-10:30 AM"),
                                          buildNearby(
                                              "Amelia\nKimani",
                                              "assets/icons/h6.png",
                                              "5",
                                              "th",
                                              " Mar 2024-10:30 AM"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          buildNearby(
                                              "Aryaa\nPatel",
                                              "assets/icons/h3.png",
                                              "5",
                                              "th",
                                              " Mar 2024-10:30 AM"),
                                          buildNearby(
                                              "Pooja\nPatel",
                                              "assets/icons/h5.png",
                                              "5",
                                              "th",
                                              " Mar 2024-10:30 AM"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          buildNearby(
                                              "Scarlett\nKimani",
                                              "assets/icons/g2.png",
                                              "5",
                                              "th",
                                              " Mar 2024-10:30 AM"),
                                          buildNearby(
                                              "Sophia\nJohn",
                                              "assets/icons/h2.png",
                                              "5",
                                              "th",
                                              " Mar 2024-10:30 AM"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 85, //tirth
                                      )
                                    ],
                                  ),
                                ),
                              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildNearby(String text, image, text1, text2, text3) {
    Size size = MediaQuery.of(context).size;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Get.toNamed(Routes.myAppointmentDetailPage);
      },
      child: Card(
        shadowColor: const Color.fromARGB(10, 0, 0, 0),
        elevation: 5,
        child: Container(
            width: size.width / 2.340,
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: selectedIndex == 2 ? kSecondaryColor : kWhiteColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: selectedIndex == 1
                      ? const Center(child: Text("5th"))
                      : Image.asset(image),
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdMedium,
                      fontSize: 17),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: text1,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 12),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(2, -4),
                          child: Text(
                            text2,
                            textScaleFactor: 0.7,
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: text3,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: Get.width / 4.1,
                  decoration: BoxDecoration(
                      color: kBackGroundColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset("assets/icons/check_yellow.png"),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          selectedIndex == 0
                              ? "Upcoming"
                              : selectedIndex == 2
                                  ? "Completed"
                                  : "New",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.myAppointmentDetailPage);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 39,
                        height: 39,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Icon(
                          Icons.arrow_right_alt_rounded,
                          color: kWhiteColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  buildNearby2(String text, image, review, year) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shadowColor: const Color.fromARGB(10, 0, 0, 0),
      elevation: 5,
      child: Container(
          width: size.width / 2.340,
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: selectedIndex == 2 ? kSecondaryColor : kWhiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: selectedIndex == 2
                    ? const Center(child: Text("5th"))
                    : Image.asset(image),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                year,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdNormal,
                    fontSize: 12),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 39,
                    height: 39,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Icon(
                      Icons.arrow_right_alt_rounded,
                      color: kWhiteColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        review,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 23),
                      ),
                      const Text(
                        "212 Reviews",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }

  buildSicknessWidget(String text, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            color: selectedIndex == index ? kHighlightColor : kWhiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: const TextStyle(
              color: kPrimaryColor,
              fontFamily: kCircularStdNormal,
              fontSize: 15),
        ),
      ),
    );
  }
}
