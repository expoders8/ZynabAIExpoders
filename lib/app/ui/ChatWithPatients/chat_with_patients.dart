import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class ChatWithPatientsPage extends StatefulWidget {
  const ChatWithPatientsPage({super.key});

  @override
  State<ChatWithPatientsPage> createState() => _ChatWithPatientsPageState();
}

class _ChatWithPatientsPageState extends State<ChatWithPatientsPage> {
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
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 7),
                      buildNearby(
                        "Hannah",
                        "assets/icons/h4.png",
                        "I hope you are doing well",
                      ),
                      buildNearby(
                        "Aryaa Patel",
                        "assets/icons/g5.png",
                        "I have shared the latest report of my BP",
                      ),
                      buildNearby(
                        "Isabella",
                        "assets/icons/g4.png",
                        "I hope you are doing well",
                      ),
                      buildNearby(
                        "Michael",
                        "assets/icons/g1.png",
                        "I have shared the latest report of my BP",
                      ),
                      buildNearby(
                        "Ch Vincent",
                        "assets/icons/g3.png",
                        "I hope you are doing well",
                      ),
                      buildNearby(
                        "Alexander",
                        "assets/icons/h7.png",
                        "I have shared the latest report of my BP",
                      )
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

  buildNearby(String text, image, review) {
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
            height: 65,
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: selectedIndex == 2 ? kSecondaryColor : kWhiteColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset(image),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kCircularStdMedium,
                          fontSize: 16),
                    ),
                    Text(
                      review,
                      style: const TextStyle(
                          color: kTextSecondaryColor,
                          fontFamily: kCircularStdMedium,
                          fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            )),
      ),
    );
  }
}
