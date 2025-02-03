import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/constant/color_constant.dart';
import '../../../../config/constant/font_constant.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _controller =
      TextEditingController(text: "test@email.com");
  bool _isEditable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        title: const Text("Email address"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kBlack54Color),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Icon(
                      Icons.email_rounded,
                      size: 42,
                      color: kHighlightColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: kCircularStdMedium),
                  "Email helps you access your account and lets ZynabAI reach you in case of security or support issues. It isn't visible to others."),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 15,
                          fontFamily: kCircularStdMedium),
                      "Email"),
                  const SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //         textAlign: TextAlign.start,
                  //         style: TextStyle(
                  //             color: kPrimaryColor,
                  //             fontSize: 17,
                  //             fontFamily: kCircularStdMedium),
                  //         "test@email.com"),
                  //     Icon(
                  //       Icons.edit,
                  //       size: 25,
                  //       color: kBlackColor,
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                              color: kPrimaryColor, fontSize: 16),
                          controller: _controller,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          readOnly: !_isEditable,
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            filled: true,
                            fillColor: kWhiteColor,
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 0, 10, 0),
                            hintStyle:
                                const TextStyle(color: kTextSecondaryColor),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: kWhiteColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: kErrorColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: kWhiteColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: kWhiteColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          maxLines: 1,
                          onChanged: (value) {},
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isEditable ? Icons.check : Icons.edit,
                          size: 25,
                          color: kBlackColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isEditable = !_isEditable;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
