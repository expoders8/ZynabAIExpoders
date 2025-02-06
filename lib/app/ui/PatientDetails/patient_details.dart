import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isFormSubmitted = false, dateError = false;
  String selectedPerson = "", pickedDate = "", selectdate = "YYYY/MM/DD";
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
              // Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     Card(
              //       shadowColor: const Color.fromARGB(10, 0, 0, 0),
              //       elevation: 5,
              //       child: Container(
              //         width: Get.width,
              //         decoration: BoxDecoration(
              //           color: kCardColor,
              //           borderRadius: BorderRadius.circular(14.0),
              //         ),
              //         padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const SizedBox(height: 14),
              //             Row(
              //               children: [
              //                 Container(
              //                   height: 45,
              //                   width: 45,
              //                   decoration: BoxDecoration(
              //                       color: kHighlightColor,
              //                       borderRadius: BorderRadius.circular(25)),
              //                   child: const Center(
              //                     child: Text(
              //                       "ai",
              //                       style: TextStyle(
              //                           color: kPrimaryColor,
              //                           fontFamily: kCircularStdMedium,
              //                           fontSize: 18),
              //                     ),
              //                   ),
              //                 ),
              //                 const SizedBox(width: 10),
              //                 const Text(
              //                   "Accepting\nNew patient",
              //                   style: TextStyle(
              //                       color: kSecondaryColor,
              //                       fontFamily: kCircularStdMedium,
              //                       fontSize: 12),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(height: 14),
              //             const SizedBox(
              //               width: 160,
              //               child: Text(
              //                 "Consulting\nRequest",
              //                 style: TextStyle(
              //                     color: kPrimaryColor,
              //                     fontFamily: kCircularStdMedium,
              //                     fontSize: 25),
              //               ),
              //             ),
              //             const SizedBox(height: 14),
              //             const Text(
              //               "5Th Mar 24",
              //               style: TextStyle(
              //                   color: kPrimaryColor,
              //                   fontFamily: kCircularStdMedium,
              //                   fontSize: 16),
              //             ),
              //             const Text(
              //               "10;30 AM",
              //               style: TextStyle(
              //                   color: kPrimaryColor,
              //                   fontFamily: kCircularStdNormal,
              //                   fontSize: 15),
              //             ),
              //             const SizedBox(height: 30),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       top: -30,
              //       right: 0,
              //       child: Image.asset(
              //         "assets/icons/ladydoctor.png",
              //         scale: 2,
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(height: 10),
              const Text(
                "Add New Patient",
                style: TextStyle(
                  color: kWhiteColor,
                  fontFamily: kCircularStdNormal,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitleWidget("First Name"),
                            const SizedBox(height: 5),
                            CustomTextFormField(
                              hintText: 'Enter First Name',
                              maxLines: 1,
                              ctrl: firstNameController,
                              name: "name",
                              keyboardType: TextInputType.phone,
                              formSubmitted: isFormSubmitted,
                              validationMsg: 'First Name is Required',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitleWidget("Last Name"),
                            const SizedBox(height: 5),
                            CustomTextFormField(
                              hintText: 'Enter Last Name',
                              maxLines: 1,
                              ctrl: lastNameController,
                              name: "name",
                              keyboardType: TextInputType.phone,
                              formSubmitted: isFormSubmitted,
                              validationMsg: 'Last Name is Required',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              buildTitleWidget("Email"),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: CustomTextFormField(
                  hintText: 'Enter Email',
                  maxLines: 1,
                  ctrl: emailController,
                  name: "email",
                  keyboardType: TextInputType.emailAddress,
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Email is Required',
                ),
              ),
              const SizedBox(height: 10),
              buildTitleWidget("Date Of Birth"),
              const SizedBox(height: 5),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: Get.width - 30,
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: BoxDecoration(
                            color: kTextfildColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              BottomPicker.date(
                                pickerTitle: const Text(""),
                                onSubmit: (index) {
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy').format(index);
                                  String formattedstartDate =
                                      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                                          .format(index);
                                  if (mounted) {
                                    setState(() {
                                      selectdate = formattedDate;
                                      pickedDate = formattedstartDate;
                                      dateError = false;
                                    });
                                  }
                                },
                                dateOrder: DatePickerDateOrder.ymd,
                                minDateTime: DateTime(1850, 1, 1),
                                maxDateTime: DateTime.now(),
                                pickerTextStyle: const TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                onClose: () {
                                  Navigator.of(context).pop();
                                },
                                bottomPickerTheme: BottomPickerTheme.plumPlate,
                                buttonAlignment: MainAxisAlignment.center,
                                buttonContent: const Center(
                                    child: Text(
                                  "Done",
                                  style: TextStyle(color: kPrimaryColor),
                                )),
                                buttonStyle: BoxDecoration(
                                    color: kHighlightColor,
                                    borderRadius: BorderRadius.circular(15)),
                                closeIconColor: kPrimaryColor,
                                closeIconSize: 25,
                              ).show(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectdate,
                                  style: const TextStyle(
                                    fontFamily: kCircularStdBook,
                                    fontWeight: FontWeight.w400,
                                    color: kWhiteColor,
                                    fontSize: 14,
                                  ),
                                ),
                                Image.asset(
                                  "assets/icons/polygon_down.png",
                                  scale: 2,
                                  color: kWhiteColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (isFormSubmitted && dateError)
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0, left: 12),
                            child: Text(
                              "Please select Start Date",
                              style: TextStyle(
                                color: kErrorColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              buildTitleWidget("Address (Optional)"),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width > 500 ? 600 : Get.width,
                child: CustomTextFormField(
                  hintText: 'Enter Address',
                  maxLines: 1,
                  ctrl: mobileNoController,
                  name: "address",
                  keyboardType: TextInputType.phone,
                  formSubmitted: isFormSubmitted,
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
