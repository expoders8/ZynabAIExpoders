import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../widgets/custom_textfield.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class PatientDetailsPage extends StatefulWidget {
  const PatientDetailsPage({super.key});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isFormSubmitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        leading: CupertinoButton(
          padding: const EdgeInsets.all(9),
          onPressed: () {
            Get.back();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kWhiteColor, width: 1)),
            child: Image.asset(
              "assets/icons/arrow_left.png",
              color: kWhiteColor,
              scale: 1.5,
            ),
          ),
        ),
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
                              "Consulting\nRequest",
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
              const Text(
                "Patient Details",
                style: TextStyle(
                    color: kWhiteColor,
                    fontFamily: kCircularStdNormal,
                    fontSize: 18),
              ),
              const SizedBox(height: 10),
              buildTitleWidget("Name"),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: CustomTextFormField(
                  hintText: 'Enter Your Name',
                  maxLines: 1,
                  ctrl: userNameController,
                  name: "name",
                  keyboardType: TextInputType.phone,
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Name is Required',
                ),
              ),
              const SizedBox(height: 10),
              buildTitleWidget("Mobile No"),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: CustomTextFormField(
                  hintText: 'Enter Your Mobile No',
                  maxLines: 1,
                  ctrl: mobileNoController,
                  name: "mobileno",
                  keyboardType: TextInputType.phone,
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Mobile No is Required',
                ),
              ),
              const SizedBox(height: 10),
              buildTitleWidget("Email"),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: CustomTextFormField(
                  hintText: 'Enter Your Email',
                  maxLines: 1,
                  ctrl: emailController,
                  name: "email",
                  keyboardType: TextInputType.emailAddress,
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Email is Required',
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: Get.width,
                child: CupertinoButton(
                  color: kHighlightColor,
                  borderRadius: BorderRadius.circular(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "SEND REQUEST",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 14),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        "assets/icons/arrow_right.png",
                        color: kPrimaryColor,
                        scale: 1.3,
                      )
                    ],
                  ),
                  onPressed: () {
                    bottomSheetforChat();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildTitleWidget(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: kWhiteColor, fontFamily: kCircularStdNormal, fontSize: 14),
    );
  }

  bottomSheetforChat() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      builder: (context) {
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
                height: 171,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Fees",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 28,
                            fontFamily: kCircularStdNormal),
                      ),
                      const SizedBox(height: 15),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        onPressed: () {
                          Get.back();
                          Get.toNamed(Routes.consultationFeesPage);
                        },
                        child: const Text(
                          "Pay Now",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontFamily: kCircularStdNormal),
                        ),
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "Pay Later",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontFamily: kCircularStdNormal),
                        ),
                      ),
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
}
