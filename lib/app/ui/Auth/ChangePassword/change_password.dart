import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/custom_textfield.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';
import '../../widgets/custom_textfield_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isFormSubmitted = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        title: Text("Change Password"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Please enter your current password to change the\npasswrod.",
                    style: TextStyle(
                        color: kSecondaryPrimaryColor,
                        fontSize: 13,
                        fontFamily: kCircularStdNormal),
                  ),
                  const SizedBox(height: 30),
                  // CustomTextFormField(
                  //   hintText: 'Current Password',
                  //   maxLines: 1,
                  //   ctrl: currentPasswordController,
                  //   name: "currentpassword",
                  //   formSubmitted: isFormSubmitted,
                  //   validationMsg: 'Please enter Current Password',
                  // ),
                  SizedBox(
                    width: Get.width > 500 ? 600 : Get.width,
                    child: CustomTextFormFieldAuth(
                      hintText: 'Current Password',
                      maxLines: 1,
                      ctrl: currentPasswordController,
                      name: "cpassword",
                      prefixIcon: 'assets/icons/padlock.png',
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: Get.width > 500 ? 600 : Get.width,
                    child: CustomTextFormFieldAuth(
                      hintText: 'New Password',
                      maxLines: 1,
                      ctrl: currentPasswordController,
                      name: "npassword",
                      prefixIcon: 'assets/icons/padlock.png',
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: Get.width > 500 ? 600 : Get.width,
                    child: CustomTextFormFieldAuth(
                      hintText: 'Conform Password',
                      maxLines: 1,
                      ctrl: currentPasswordController,
                      name: "cpassword",
                      prefixIcon: 'assets/icons/padlock.png',
                      formSubmitted: isFormSubmitted,
                      validationMsg: 'Please enter password',
                    ),
                  ),
                  const SizedBox(height: 15),
                  // CupertinoButton(
                  //   padding: EdgeInsets.zero,
                  //   onPressed: () {
                  //     setState(() {
                  //       isFormSubmitted = true;
                  //     });
                  //     FocusScope.of(context).requestFocus(FocusNode());
                  //     Future.delayed(const Duration(milliseconds: 100),
                  //         () async {
                  //       if (_formKey.currentState!.validate()) {}
                  //     });
                  //   },
                  //   child: Container(
                  //     height: 45,
                  //     width: Get.width,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(25),
                  //         border: Border.all(color: kWhiteColor),
                  //         color: kButtonColor),
                  //     child: const Center(
                  //       child: Text(
                  //         "Change Password",
                  //         style: TextStyle(
                  //             color: kWhiteColor,
                  //             fontFamily: kCircularStdNormal,
                  //             fontSize: 18),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: Get.width,
                    child: CupertinoButton(
                      color: kHighlightColor,
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Change Password",
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputOfTextField(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: kBackGroundColor,
      contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      hintStyle: const TextStyle(color: kGreyColor),
      labelStyle: const TextStyle(color: kBlackColor),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
        borderSide: BorderSide(
            color: hintText == "Confirm Password"
                ? newPasswordController.text != confirmPasswordController.text
                    ? kRedColor
                    : kSecondaryPrimaryColor
                : kSecondaryPrimaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
            color: hintText == "Confirm Password"
                ? newPasswordController.text != confirmPasswordController.text
                    ? kRedColor
                    : kSecondaryPrimaryColor
                : kSecondaryPrimaryColor,
            width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
            color: hintText == "Confirm Password"
                ? newPasswordController.text != confirmPasswordController.text
                    ? kRedColor
                    : kSecondaryPrimaryColor
                : kSecondaryPrimaryColor),
      ),
    );
  }
}
