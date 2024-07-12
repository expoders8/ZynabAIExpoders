import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../config/constant/constant.dart';
import '../../TabPage/tabpage.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_textfield_auth.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

class LoginDoctorPage extends StatefulWidget {
  const LoginDoctorPage({super.key});

  @override
  State<LoginDoctorPage> createState() => _LoginDoctorPageState();
}

class _LoginDoctorPageState extends State<LoginDoctorPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                    "Login as Doctor",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: kCircularStdMedium,
                        fontSize: 25),
                  ),
                ),
                const SizedBox(height: 35),
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
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width > 500 ? 600 : Get.width,
                  child: CustomTextFormFieldAuth(
                    hintText: 'Password',
                    maxLines: 1,
                    ctrl: passwordController,
                    name: "password",
                    prefixIcon: 'assets/icons/padlock.png',
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter password',
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
                          "LOGIN",
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
                      getStorage.write("selctetperson", "Doctor");
                      Get.offAll(() => const TabPage());
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Get.toNamed(Routes.loginPatientPage);
                      },
                      child: const Text(
                        "Login as Patient!",
                        style: TextStyle(
                            fontSize: 14,
                            color: kTextSecondaryColor,
                            fontFamily: kCircularStdBook,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Get.toNamed(Routes.forgotPasswordPage);
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextSecondaryColor,
                          fontFamily: kCircularStdBook,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t  have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextSecondaryColor,
                          fontFamily: kCircularStdBook,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.signUpPage);
                        },
                        child: const Text(
                          "Signup",
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
                Padding(
                  padding: const EdgeInsets.only(top: 55),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "By registering, you agree to the ",
                        style: TextStyle(
                            fontSize: 9,
                            color: kTextSecondaryColor,
                            fontFamily: kCircularStdBook),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // var url = "https://opengiving.app/privacy";
                          // if (await canLaunchUrl(Uri.parse(url))) {
                          //   await launchUrl(Uri.parse(url));
                          // } else {
                          //   throw "Could not launch $url";
                          // }
                        },
                        child: const Text(
                          "privacy policy",
                          style: TextStyle(
                              fontSize: 10,
                              color: kPrimaryColor,
                              fontFamily: kCircularStdBook,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const Text(
                        " and ",
                        style: TextStyle(
                            fontSize: 9,
                            color: kTextSecondaryColor,
                            fontFamily: kCircularStdBook),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // var url = "https://opengiving.app/terms";
                          // if (await canLaunchUrl(Uri.parse(url))) {
                          //   await launchUrl(Uri.parse(url));
                          // } else {
                          //   throw "Could not launch $url";
                          // }
                        },
                        child: const Text(
                          "terms",
                          style: TextStyle(
                              fontSize: 10,
                              color: kPrimaryColor,
                              fontFamily: kCircularStdBook,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const Text(
                        " of service.",
                        style: TextStyle(
                            fontSize: 9,
                            color: kTextSecondaryColor,
                            fontFamily: kCircularStdBook),
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
