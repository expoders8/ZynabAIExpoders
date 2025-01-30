import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zynabaiexpoders/config/constant/color_constant.dart';

import '../../../config/constant/font_constant.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  bool _switchValue = false;

  final List<Map<String, dynamic>> subscriptionPlans = [
    {
      "name": "Free Plan (Starter)",
      "pricePerMonth": "Free",
      "month": "",
      "description":
          "Patients looking for basic AI-powered healthcare assistance.",
      "features": [
        "Access to AI chatbot for limited text chat.",
        "One-time real-time audio consultation.",
        "AI-powered preliminary diagnosis for common symptoms.",
        "Recommendations for nearby doctors and clinics."
      ],
    },
    {
      "name": "Premium Plan (Patients)",
      "pricePerMonth": "\$20/",
      "month": "Month",
      "description":
          "Patients who need more advanced healthcare tools and unlimited access.",
      "features": [
        "Unlimited AI text chat, audio, and video consultations with Zynab AI.",
        "AI-powered document analysis for prescriptions, lab reports, and imaging results.",
        "Personalized health insights and preliminary diagnoses.",
        "Recommendations for specialized doctors and clinics nearby.",
        "Priority support for faster AI responses."
      ],
    },
    {
      "name": "Pro Plan (Doctors)",
      "pricePerMonth": "\$40/",
      "month": "Month",
      "description":
          "Healthcare professionals looking to streamline patient interactions and workflows.",
      "features": [
        "Unlimited real-time text, audio, and video consultations with patients.",
        "AI-powered clinical documentation for notes during consultations.",
        "Advanced AI tools for researching patient cases or second opinions.",
        "AI-powered document examination (medical records, diagnostic images).",
        "Access to patient insights for tailored care recommendations.",
        "Seamless integration with electronic medical records (EMRs)."
      ],
    },
    {
      "name": "Enterprise Plan",
      "pricePerMonth": "Contact Us",
      "month": "",
      "description":
          "For clinics or hospitals requiring team licenses, analytics, and integrations.",
      "features": [
        "Custom pricing",
        "Advanced analytics",
        "Custom integrations"
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kHighlightColor,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Pricing",
          style: TextStyle(color: kPrimaryColor, fontSize: 20),
        ),
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Monthly", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 5),
                CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                const SizedBox(width: 5),
                const Text("Yearly", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subscriptionPlans.length,
              itemBuilder: (context, index) {
                var plan = subscriptionPlans[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                plan["name"],
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontFamily: kCircularStdMedium),
                              ),
                              Row(
                                children: [
                                  Text(
                                    plan["pricePerMonth"],
                                    style: const TextStyle(
                                        fontSize: 16, color: kGreenColor),
                                  ),
                                  Text(
                                    plan["month"],
                                    style: const TextStyle(
                                        fontSize: 11, color: kGreenColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            plan["description"],
                            style: const TextStyle(
                                fontFamily: kCircularStdBook,
                                fontSize: 13,
                                color: kSecondaryPrimaryColor),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: Get.width - 75,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: CupertinoButton(
                              borderRadius: BorderRadius.circular(25.0),
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: const Text(
                                "Start Today",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdBold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: List.generate(
                              plan["features"].length,
                              (i) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                        Icons.check_circle_outline_outlined,
                                        size: 18,
                                        color: kSecondaryPrimaryColor),
                                    const SizedBox(width: 5),
                                    Expanded(
                                        child: Text(
                                      plan["features"][i],
                                      style: TextStyle(fontSize: 12),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // upgradeButtonRender(data) {
  //   if (data.level == accessLevel) {
  //     return Container(
  //       width: Get.width - 75,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(25.0),
  //       ),
  //       child: CupertinoButton(
  //         borderRadius: BorderRadius.circular(25.0),
  //         padding: EdgeInsets.zero,
  //         onPressed: () {},
  //         child: const Text(
  //           "Activated",
  //           style: TextStyle(
  //               color: kGreenColor, fontFamily: kCircularStdBold, fontSize: 18),
  //         ),
  //       ),
  //     );
  //   } else if (accessLevel != data.level && accessLevel <= data.level) {
  //     return Container(
  //       width: Get.width - 75,
  //       decoration: BoxDecoration(
  //         border: Border.all(width: 1),
  //         borderRadius: BorderRadius.circular(25.0),
  //       ),
  //       child: CupertinoButton(
  //         borderRadius: BorderRadius.circular(25.0),
  //         padding: EdgeInsets.zero,
  //         onPressed: () {
  //           getPaymentLinkOnPress(data);
  //         },
  //         child: const Text(
  //           "Start Today",
  //           style: TextStyle(
  //               color: kPrimaryColor,
  //               fontFamily: kCircularStdBold,
  //               fontSize: 18),
  //         ),
  //       ),
  //     );
  //   } else if (data.level < accessLevel) {
  //     return Container(
  //       width: Get.width - 75,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(25.0),
  //       ),
  //       child: CupertinoButton(
  //         borderRadius: BorderRadius.circular(25.0),
  //         padding: EdgeInsets.zero,
  //         onPressed: () {},
  //         child: const Text(
  //           "Not Eligible",
  //           style: TextStyle(
  //               color: kSecondaryPrimaryColor,
  //               fontFamily: kCircularStdBold,
  //               fontSize: 18),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Container();
  //   }
  // }
}
