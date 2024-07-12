import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/constant/constant.dart';
import '../../routes/app_pages.dart';
import '../../controller/tab_controller.dart';
import '../DoctorDetails/doctor_details.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../Keep asking/keepasking.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectCatgoryIndex = 0, selectAsstenIndex = 0;
  final tabController = Get.put(TabCountController());
  String selectedPerson = "";
  @override
  void initState() {
    var person = getStorage.read("selctetperson") ?? "";
    setState(() {
      selectedPerson = person;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.toNamed(Routes.loginPatientPage);
                    },
                    child: Image.asset(
                      "assets/icons/h4.png",
                      fit: BoxFit.cover,
                      height: 35,
                      width: 35,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0, bottom: 0),
                    child: Text(
                      "4.8",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kCircularStdMedium,
                          fontSize: 45),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(
                      "212 Reviews",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kCircularStdNormal,
                          fontSize: 15),
                    ),
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
                            "I’m Zynab\nYour AI Health\nAssistant",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdMedium,
                                fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "How are you feeling ?",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 15),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Get.toNamed(Routes.chatWithDoctorPage);
                                },
                                child: Container(
                                  height: 49,
                                  width: 49,
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Image.asset(
                                    "assets/icons/send.png",
                                    scale: 1.7,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Get.to(() => const KeepAsking());
                                },
                                child: Container(
                                  height: 49,
                                  width: 49,
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Image.asset(
                                    "assets/icons/mic.png",
                                    scale: 1.7,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Get.toNamed(Routes.chatWithDoctorPage);
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: kBlackColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Row(
                                      children: [
                                        Text(
                                          "CHAT NOW",
                                          style: TextStyle(
                                              color: kWhiteColor,
                                              fontFamily: kCircularStdNormal,
                                              fontSize: 15),
                                        ),
                                        Icon(
                                          Icons.arrow_right_alt_outlined,
                                          color: kWhiteColor,
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 49,
                        // width: 49,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              selectedPerson == "Doctor"
                                  ? "assets/icons/g1.png"
                                  : "assets/icons/h1.png",
                              scale: 6,
                            ),
                            Image.asset(
                              selectedPerson == "Doctor"
                                  ? "assets/icons/h6.png"
                                  : "assets/icons/h2.png",
                              scale: 3.5,
                            ),
                            Image.asset(
                              selectedPerson == "Doctor"
                                  ? "assets/icons/g3.png"
                                  : "assets/icons/h3.png",
                              scale: 6,
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                tabController.changeTabIndex(2);
                              },
                              child: Container(
                                  height: 33,
                                  width: 33,
                                  // padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: kBlackColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: kWhiteColor,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Your ${selectedPerson == "Doctor" ? "Patients" : "Doctors"}",
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "By Category",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: kCircularStdNormal,
                        fontSize: 16),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildCategoryWidget(
                            "Ear\nInfections", 0, "assets/icons/eye.png"),
                        buildCategoryWidget(
                            "Dental\nMedical", 1, "assets/icons/noice.png"),
                        buildCategoryWidget(
                            "Dental\nMedical", 2, "assets/icons/noice.png")
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Nearby",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: kCircularStdNormal,
                        fontSize: 16),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    child: selectedPerson == "Doctor"
                        ? Row(
                            children: [
                              buildNearby("Rajesh\nPatel",
                                  "assets/icons/g3.png", "4.5", ""),
                              buildNearby("Aryaa\nPatel", "assets/icons/g4.png",
                                  "4.8", ""),
                              buildNearby("Romiua\nPatel",
                                  "assets/icons/g5.png", "4.8", "")
                            ],
                          )
                        : Row(
                            children: [
                              buildNearby(
                                  "Dr. Pooja\nPatel",
                                  "assets/icons/h1.png",
                                  "4.5",
                                  "Dentist / 2+ yrs"),
                              buildNearby(
                                  "Dr. Aryaa\nPatel",
                                  "assets/icons/h2.png",
                                  "4.8",
                                  "Surgeons / 8+ yrs"),
                              buildNearby(
                                  "Dr. Aryaa\nPatel",
                                  "assets/icons/h3.png",
                                  "4.8",
                                  "Surgeons / 8+ yrs")
                            ],
                          ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Assessments",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: kCircularStdNormal,
                        fontSize: 16),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildAssentWidget("Symptom\nChecker", 0,
                            "assets/icons/noun-allergy-symptom.png"),
                        buildAssentWidget("Risk Factor\nAssessment", 1,
                            "assets/icons/siron.png"),
                        buildAssentWidget("Risk Factor\nAssessment", 2,
                            "assets/icons/siron.png")
                      ],
                    ),
                  ),
                  const SizedBox(height: 85)
                ],
              ),
              Positioned(
                  right: 0,
                  top: 15,
                  child: Image.asset(
                    "assets/icons/lady.png",
                    scale: 4.5,
                  ))
            ],
          ),
        ),
      )),
    );
  }

  buildCategoryWidget(String text, int index, image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectCatgoryIndex = index;
        });
      },
      child: Card(
        shadowColor: const Color.fromARGB(10, 0, 0, 0),
        elevation: 5,
        child: Container(
            width: 130,
            decoration: BoxDecoration(
              color:
                  selectCatgoryIndex == index ? kHighlightColor : kWhiteColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: selectCatgoryIndex == index
                                  ? kHighlightColor
                                  : kPrimaryColor,
                              width: 1)),
                      child: Image.asset(
                        image,
                        scale: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(text),
                const SizedBox(height: 3),
              ],
            )),
      ),
    );
  }

  buildAssentWidget(String text, int index, image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectAsstenIndex = index;
        });
      },
      child: Card(
        shadowColor: const Color.fromARGB(10, 0, 0, 0),
        elevation: 5,
        child: Container(
            width: 130,
            decoration: BoxDecoration(
              color: selectAsstenIndex == index ? kHighlightColor : kWhiteColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: selectAsstenIndex == index
                                  ? kHighlightColor
                                  : kPrimaryColor,
                              width: 1)),
                      child: Image.asset(
                        image,
                        scale: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(text),
                const SizedBox(height: 3),
              ],
            )),
      ),
    );
  }

  buildNearby(String text, image, review, year) {
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
            // width: size.width,
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
                  child: Image.asset(
                    image,
                    scale: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdMedium,
                      fontSize: 16),
                ),
                SizedBox(height: year == "" ? 0 : 10),
                Text(
                  year,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 12),
                ),
                SizedBox(height: year == "" ? 0 : 10),
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
      ),
    );
  }
}
