import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../routes/app_pages.dart';
import '../DoctorDetails/doctor_details.dart';

class AppointmentDayPage extends StatefulWidget {
  const AppointmentDayPage({
    super.key,
  });

  @override
  State<AppointmentDayPage> createState() => _AppointmentDayPageState();
}

class _AppointmentDayPageState extends State<AppointmentDayPage> {
  bool focuseToday = false;
  bool isselected = true;
  int selectedTimendex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Positioned(
                      bottom: -70,
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
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    height: 49,
                                    // width: 49,
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/h1.png",
                                          scale: 6,
                                        ),
                                        Image.asset(
                                          "assets/icons/h2.png",
                                          scale: 3.5,
                                        ),
                                        Image.asset(
                                          "assets/icons/h3.png",
                                          scale: 6,
                                        ),
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          child: Container(
                                            height: 33,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              color: kBlackColor,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "23+",
                                                style: TextStyle(
                                                    color: kWhiteColor,
                                                    fontFamily:
                                                        kCircularStdMedium,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Todays Requests",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdNormal,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
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
                            Row(
                              children: [
                                Switch(
                                  value: isselected,
                                  inactiveThumbColor: const Color(0xFFF5FE6A),
                                  onChanged: (bool value) {
                                    setState(() {
                                      isselected = value;
                                    });
                                  },
                                ),
                                const Text(
                                  "Accepting\nNew patient",
                                  style: TextStyle(
                                      color: kSecondaryPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 160,
                              child: Text(
                                "Good Morning",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              width: 160,
                              child: Text(
                                "Pooja Patel",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 17),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "24",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 25),
                            ),
                            const Text(
                              "Today",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 19),
                            ),
                            const Text(
                              "Appointments",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: kCircularStdNormal,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 40),
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
                const SizedBox(height: 80),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "New Requests",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 16),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Text(
                              "View All",
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildNearby(
                                "Vincent\nChepkwony",
                                "assets/icons/g5.png",
                                "4.5",
                                "Dentist / 2+ yrs",
                                1),
                            buildNearby("Amelia\nKimani", "assets/icons/g4.png",
                                "4.8", "Surgeons / 8+ yrs", 1),
                            buildNearby(
                                "Dr. Aryaa\nPatel",
                                "assets/icons/h5.png",
                                "4.8",
                                "Surgeons / 8+ yrs",
                                1)
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Upcoming",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 17),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "(Appointments)",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Text(
                              "View All",
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildNearby("John\nSmith", "assets/icons/g1.png",
                                "4.5", "Dentist / 2+ yrs", 2),
                            buildNearby(
                                "Michael\nJohnson",
                                "assets/icons/g3.png",
                                "4.8",
                                "Surgeons / 8+ yrs",
                                2),
                            buildNearby(
                                "Dr. Aryaa\nPatel",
                                "assets/icons/h5.png",
                                "4.8",
                                "Surgeons / 8+ yrs",
                                2)
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Completed",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 16),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "(Appointments)",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.generalPhysicianPage);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kPrimaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildNearby(
                                "David\nWilliams",
                                "assets/icons/g6.png",
                                "4.5",
                                "General / 2+ yrs",
                                3),
                            buildNearby("Emily\nJohnson", "assets/icons/g4.png",
                                "4.8", "General P / 8+ yrs", 3),
                            buildNearby(
                                "Dr. Aryaa\nPatel",
                                "assets/icons/h5.png",
                                "4.8",
                                "General P / 8+ yrs",
                                3)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNearby(String text, image, review, year, checkNum) {
    Size size = MediaQuery.of(context).size;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Get.to(
          () => DoctoreDetailsPage(
            name: text,
            year: year,
          ),
        );
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
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset(image),
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
                    checkNum == 1
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Center(
                              child: Text(
                                "Home Visit",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 12),
                              ),
                            ),
                          )
                        : Column(
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
      ),
    );
  }
}
