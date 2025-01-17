import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../routes/app_pages.dart';
import '../../TabPage/tabpage.dart';
import '../../widgets/custom_textfield_auth.dart';
import '../../../../config/constant/constant.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';
import '../user_profile_info.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  bool isFormSubmitted = false;
  int selectedIndex = 2;
  String selectedPerson = "";
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
                    "Sign Up",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: kCircularStdMedium,
                        fontSize: 25),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "I am  ",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: Get.width > 500 ? 23 : 15,
                          fontFamily: kCircularStdNormal),
                    ),
                    buildCustomRadio("Doctor", 0),
                    const SizedBox(width: 10),
                    buildCustomRadio("Patient", 1),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width > 500 ? 600 : Get.width,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 5,
                          child: CustomTextFormFieldAuth(
                            hintText: 'First Name',
                            maxLines: 1,
                            ctrl: firstNameController,
                            name: "name",
                            prefixIcon: 'assets/icons/edit_profile_icon.png',
                            formSubmitted: isFormSubmitted,
                            validationMsg: 'Please enter first name',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: CustomTextFormFieldAuth(
                            hintText: 'Last Name',
                            maxLines: 1,
                            ctrl: lastNameController,
                            name: "name",
                            prefixIcon: 'assets/icons/edit_profile_icon.png',
                            formSubmitted: isFormSubmitted,
                            validationMsg: 'Please enter last name',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width > 500 ? 600 : Get.width,
                  child: CustomTextFormFieldAuth(
                    hintText: 'Phone Number',
                    maxLines: 1,
                    ctrl: mobileNoController,
                    name: "phonenumber",
                    keyboardType: TextInputType.phone,
                    prefixIcon: 'assets/icons/phoneicon.png',
                    formSubmitted: isFormSubmitted,
                    validationMsg: 'Please enter Phone Number',
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
                          "SIGN UP",
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
                      getStorage.write("selctetperson", selectedPerson);
                      // Get.offAll(() => const TabPage());
                      Get.to(() => UserProfileInformationPage(
                            roll: selectedPerson,
                          ));
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
                const SizedBox(height: 10),
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

  buildCustomRadio(String text, int index) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          selectedIndex = index;
          selectedPerson = text;
        });
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(25)),
            child: Container(
              decoration: BoxDecoration(
                color:
                    selectedIndex == index ? kPrimaryColor : kBackGroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 13,
                fontFamily: kCircularStdNormal),
          )
        ],
      ),
    );
  }
}
