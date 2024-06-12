import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_pages.dart';
import '../widgets/custom_textfield.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class ConsultationFeesPage extends StatefulWidget {
  const ConsultationFeesPage({super.key});

  @override
  State<ConsultationFeesPage> createState() => _ConsultationFeesPageState();
}

class _ConsultationFeesPageState extends State<ConsultationFeesPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
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
              const SizedBox(height: 10),
              const Text(
                "Consultation\nFees",
                style: TextStyle(
                    color: kWhiteColor,
                    fontFamily: kCircularStdNormal,
                    fontSize: 18),
              ),
              const SizedBox(height: 10),
              buildTitleWidget("Card Number"),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: CustomTextFormField(
                  hintText: 'Enter ',
                  maxLines: 1,
                  ctrl: cardNumberController,
                  name: "cardnumber",
                  keyboardType: TextInputType.phone,
                  formSubmitted: isFormSubmitted,
                  validationMsg:
                      'Min 6 and max 34 characters, no special characters',
                ),
              ),
              const SizedBox(height: 10),
              buildTitleWidget("Card Holder Name"),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: CustomTextFormField(
                  hintText: 'Enter ',
                  maxLines: 1,
                  ctrl: cardHolderController,
                  name: "holdername",
                  keyboardType: TextInputType.phone,
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Mobile No is Required',
                ),
              ),
              const SizedBox(height: 10),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTitleWidget("Expiry Date"),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hintText: 'DD/MM/YYY',
                            maxLines: 1,
                            ctrl: expiryController,
                            name: "expiry",
                            keyboardType: TextInputType.emailAddress,
                            formSubmitted: isFormSubmitted,
                            validationMsg: 'Expiry Date is Required',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTitleWidget("CVV"),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hintText: 'Enter',
                            maxLines: 1,
                            ctrl: cvvController,
                            name: "cvv",
                            keyboardType: TextInputType.emailAddress,
                            formSubmitted: isFormSubmitted,
                            validationMsg: 'cvv is Required',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              SizedBox(
                width: Get.width,
                child: const Column(
                  children: [
                    Text(
                      "Kindly ensure all beneficiary information is\nvalid to avoid Transaction failure / rejection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontFamily: kCircularStdMedium,
                          fontSize: 13),
                    ),
                  ],
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
                        "PAY NOW",
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
                    Get.toNamed(Routes.appointmentScheduledPage);
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
