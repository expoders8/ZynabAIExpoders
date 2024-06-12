import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../DoctorDetails/doctor_details.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class FindDoctorNearbyPage extends StatefulWidget {
  const FindDoctorNearbyPage({super.key});

  @override
  State<FindDoctorNearbyPage> createState() => _FindDoctorNearbyPageState();
}

class _FindDoctorNearbyPageState extends State<FindDoctorNearbyPage> {
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
                "Find Doctors\nNearby",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 23),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  buildSicknessWidget("Doctors", 0),
                  const SizedBox(width: 10),
                  buildSicknessWidget("My Doctors", 1),
                  const SizedBox(width: 10),
                  buildSicknessWidget("Appointments", 2)
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
              selectedIndex == 0
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Nearby",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 16),
                                ),
                                Container(
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
                                )
                              ],
                            ),
                            const SizedBox(height: 7),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  buildNearby(
                                      "Dr. Pooja\nPatel",
                                      "assets/icons/h1.png",
                                      "4.5",
                                      "Dentist / 2+ yrs"),
                                  buildNearby(
                                      "Dr. Aryaa\nPatel",
                                      "assets/icons/h3.png",
                                      "4.8",
                                      "Surgeons / 8+ yrs"),
                                  buildNearby(
                                      "Dr. Aryaa\nPatel",
                                      "assets/icons/h5.png",
                                      "4.8",
                                      "Surgeons / 8+ yrs")
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Dentist",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 16),
                                ),
                                Container(
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
                                )
                              ],
                            ),
                            const SizedBox(height: 7),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  buildNearby(
                                      "Dr. Amelia\nKimani",
                                      "assets/icons/doctor3.png",
                                      "4.5",
                                      "Dentist / 2+ yrs"),
                                  buildNearby(
                                      "Dr. Vincent\nChepkwony",
                                      "assets/icons/doctor4.png",
                                      "4.8",
                                      "Surgeons / 8+ yrs"),
                                  buildNearby(
                                      "Dr. Aryaa\nPatel",
                                      "assets/icons/h5.png",
                                      "4.8",
                                      "Surgeons / 8+ yrs")
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "General Physician",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 16),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
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
                                      "Dr. John\nDoe",
                                      "assets/icons/doctor5.png",
                                      "4.5",
                                      "General / 2+ yrs"),
                                  buildNearby(
                                      "Dr. Anusha\nPriya",
                                      "assets/icons/doctor1.png",
                                      "4.8",
                                      "General P / 8+ yrs"),
                                  buildNearby(
                                      "Dr. Aryaa\nPatel",
                                      "assets/icons/h5.png",
                                      "4.8",
                                      "General P / 8+ yrs")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : selectedIndex == 1
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    buildNearby(
                                        "Dr. Pooja\nPatel",
                                        "assets/icons/h1.png",
                                        "4.5",
                                        "Physician / 2+ yrs"),
                                    const SizedBox(width: 5),
                                    buildNearby(
                                        "Dr. Aryaa\nPatel",
                                        "assets/icons/h3.png",
                                        "4.8",
                                        "Surgeons / 8+ yrs"),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    buildNearby(
                                        "Dr. Amelia\nKimani",
                                        "assets/icons/h5.png",
                                        "4.5",
                                        "Physician / 2+ yrs"),
                                    const SizedBox(width: 5),
                                    buildNearby(
                                        "Dr. Vincent\nChepkwony",
                                        "assets/icons/doctor4.png",
                                        "4.8",
                                        "Surgeons / 8+ yrs"),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    buildNearby(
                                        "Dr. Anusha\nPriya",
                                        "assets/icons/doctor1.png",
                                        "4.5",
                                        "Physician / 2+ yrs"),
                                    const SizedBox(width: 5),
                                    buildNearby(
                                        "Dr. John\nDoe",
                                        "assets/icons/doctor5.png",
                                        "4.8",
                                        "Surgeons / 8+ yrs"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    buildNearby(
                                        "5th Mar 2024",
                                        "assets/icons/h1.png",
                                        "4.5",
                                        "Physician / 2+ yrs"),
                                    const SizedBox(width: 5),
                                    buildNearby(
                                        "10th Mar 2024",
                                        "assets/icons/h3.png",
                                        "4.8",
                                        "Surgeons / 8+ yrs"),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    buildNearby(
                                        "5th Mar 2024",
                                        "assets/icons/h5.png",
                                        "4.5",
                                        "Physician / 2+ yrs"),
                                    const SizedBox(width: 5),
                                    buildNearby(
                                        "10th Mar 2024",
                                        "assets/icons/doctor4.png",
                                        "4.8",
                                        "Surgeons / 8+ yrs"),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    buildNearby(
                                        "5th Mar 2024",
                                        "assets/icons/doctor1.png",
                                        "4.5",
                                        "Physician / 2+ yrs"),
                                    const SizedBox(width: 5),
                                    buildNearby(
                                        "10th Mar 2024",
                                        "assets/icons/doctor5.png",
                                        "4.8",
                                        "Surgeons / 8+ yrs"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }

  buildNearby(String text, image, review, year) {
    Size size = MediaQuery.of(context).size;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        selectedIndex == 2
            ? Get.toNamed(Routes.appointmentDetailsPage)
            : Get.to(
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
                      color: selectedIndex == 2
                          ? const Color(0xFFE6E6E6)
                          : kWhiteColor,
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
                  selectedIndex == 2 ? "10:30 AM" : year,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 12),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kHighlightColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: kPrimaryColor,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "Upcoming",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 13),
                      ),
                    ],
                  ),
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
                      child: selectedIndex == 2
                          ? Image.asset(image)
                          : const Icon(
                              Icons.arrow_right_alt_rounded,
                              color: kWhiteColor,
                            ),
                    ),
                    const SizedBox(width: 10),
                    selectedIndex == 2
                        ? Container()
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
