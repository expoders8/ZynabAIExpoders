import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

class ChatWithPetaintsPage extends StatefulWidget {
  const ChatWithPetaintsPage({super.key});

  @override
  State<ChatWithPetaintsPage> createState() => _FindDoctorNearbyPageState();
}

class _FindDoctorNearbyPageState extends State<ChatWithPetaintsPage> {
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
                "Chat With\nPatients",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 23),
              ),
              const SizedBox(height: 10),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 7),
                      buildNearby("Hannah", "assets/icons/h1.png", "4.5",
                          "Dentist / 2+ yrs"),
                      buildNearby("Aryaa Patel", "assets/icons/h3.png", "4.8",
                          "Surgeons / 8+ yrs"),
                      buildNearby("Isabella", "assets/icons/h5.png", "4.8",
                          "Surgeons / 8+ yrs"),
                      buildNearby("Michael", "assets/icons/h3.png", "4.8",
                          "Surgeons / 8+ yrs"),
                      buildNearby("Ch Vincent", "assets/icons/h3.png", "4.8",
                          "Surgeons / 8+ yrs")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildNearby(String text, image, review, year) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.userChatPage);
      },
      child: Card(
        shadowColor: const Color.fromARGB(10, 0, 0, 0),
        elevation: 5,
        child: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdMedium,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
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
