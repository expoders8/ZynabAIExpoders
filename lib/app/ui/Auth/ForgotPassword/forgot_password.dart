import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/custom_textfield_auth.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  bool isFormSubmitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 45),
                Center(
                  child: Image.asset(
                    "assets/icons/lady.png",
                    scale: 5,
                  ),
                ),
                const Center(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: kCircularStdMedium,
                        fontSize: 25),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: Get.width > 500 ? 600 : Get.width,
                  child: CustomTextFormFieldAuth(
                    hintText: 'Email',
                    maxLines: 1,
                    ctrl: emailController,
                    name: "email",
                    prefixIcon: 'assets/icons/email.png',
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter email',
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: Get.width,
                  child: CupertinoButton(
                    color: kHighlightColor,
                    borderRadius: BorderRadius.circular(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "SAVE",
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
                      Get.back();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextSecondaryColor,
                          fontFamily: kCircularStdBook,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.loginDoctorPage);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 15,
                            color: kPrimaryColor,
                            fontFamily: kCircularStdBook,
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
      ),
    );
  }

  buildTitleWidget(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: kTextSecondaryColor,
          fontFamily: kCircularStdNormal,
          fontSize: 14),
    );
  }
}
