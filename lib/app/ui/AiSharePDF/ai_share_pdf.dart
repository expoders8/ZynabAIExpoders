import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class AISharePDFPage extends StatefulWidget {
  const AISharePDFPage({super.key});

  @override
  State<AISharePDFPage> createState() => _AISharePDFPageState();
}

class _AISharePDFPageState extends State<AISharePDFPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: kHighlightColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.all(11),
                        onPressed: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Image.asset(
                            "assets/icons/arrow_left.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Set Alarm",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontFamily: kCircularStdNormal,
                                decoration: TextDecoration.underline),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/icons/alarm.png",
                            scale: 2,
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.all(9),
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image.asset(
                                "assets/icons/download.png",
                                scale: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 13),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black26,
                      ),
                      child: const Text(
                        "AI Powered",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontFamily: kCircularStdNormal),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      width: Get.width,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Column(
                            children: [
                              SizedBox(height: 18),
                              Text(
                                "Let’s reduce\na fever at home.",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 22,
                                    fontFamily: kCircularStdMedium),
                              ),
                              SizedBox(height: 18),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            bottom: -41,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/icons/ladyCard.png",
                                fit: BoxFit.cover,
                                height: 145,
                                width: 72,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height - 222,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 36),
                      const Text(
                        "Medicines (Suggestions)",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontFamily: kCircularStdNormal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildCardWidget("Acetaminophen", "01",
                          "This is a popular medication for reducing fever and relieving pain. It’s available in various forms, including tablets, liquid, and chewable tablets."),
                      const SizedBox(height: 8),
                      buildCardWidget("Aspirin", "02",
                          "Aspirin is typically taken every 4 to 6 hours as needed. It’s best to take aspirin with food or after eating to reduce the risk of stomach irritation."),
                      const Text(
                        "Instructions (Suggestions)",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontFamily: kCircularStdNormal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildInstructionsCardWidget("Stay Hydrated", "01",
                          "Drink plenty of fluids such as water, herbal tea, or clear broth. This helps prevent dehydration, which can worsen fever."),
                      const SizedBox(height: 8),
                      buildInstructionsCardWidget("Rest", "02",
                          "Make sure to get plenty of rest to help your body recover. Avoid strenuous activities that could increase your body temperature."),
                      const SizedBox(height: 8),
                      buildInstructionsCardWidget("Cool Compresses", "03",
                          "Applying cool, damp washcloths to your forehead, wrists, and back of the neck can help lower body temperature and provide relief from fever."),
                      const SizedBox(height: 8),
                      buildInstructionsCardWidget("Take a Lukewarm Bath", "04",
                          "A lukewarm bath can help bring down a fever. Avoid using cold water, as it could cause shivering, which may actually increase body temperature."),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                "assets/icons/share.png",
                                scale: 1.5,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                                width: 150,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: kPrimaryColor),
                                child: const Center(
                                  child: Text(
                                    "Download",
                                    style: TextStyle(color: kWhiteColor),
                                  ),
                                )),
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
                                "assets/icons/whatsapp.png",
                                scale: 1.5,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCardWidget(String text, number, String discription) {
    return Card(
      shadowColor: const Color.fromARGB(10, 0, 0, 0),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: Get.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF8F7F5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFFEBEBEB),
                  ),
                  child: Image.asset(
                    "assets/icons/drops.png",
                    scale: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 209, 208, 208),
                      fontSize: 30,
                      fontFamily: kCircularStdNormal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 19,
                fontFamily: kCircularStdMedium,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              discription,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                fontFamily: kCircularStdNormal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Medicine Schedule",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                fontFamily: kCircularStdNormal,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              "8:00 AM",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdNormal,
              ),
            ),
            const Text(
              "12:00 PM",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdNormal,
              ),
            ),
            const Text(
              "4:00 PM",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdNormal,
              ),
            ),
            const Text(
              "8:00 PM",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontFamily: kCircularStdNormal,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      "4.8",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 22,
                        fontFamily: kCircularStdNormal,
                      ),
                    ),
                    Text(
                      "212 Reviews",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                        fontFamily: kCircularStdNormal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/alarm.png",
                      scale: 1.5,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Set Alarm",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontFamily: kCircularStdNormal,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    const Text(
                      "+23",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontFamily: kCircularStdNormal,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Image.asset(
                      "assets/icons/h5.png",
                      scale: 5.6,
                    ),
                    Image.asset(
                      "assets/icons/h6.png",
                      scale: 3,
                    ),
                    Image.asset(
                      "assets/icons/h7.png",
                      scale: 3,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  buildInstructionsCardWidget(String text, number, String discription) {
    return Card(
      shadowColor: const Color.fromARGB(10, 0, 0, 0),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: Get.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF8F7F5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kHighlightColor,
              ),
              child: Center(
                child: Text(
                  number,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontFamily: kCircularStdNormal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 19,
                fontFamily: kCircularStdMedium,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              discription,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                fontFamily: kCircularStdNormal,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
