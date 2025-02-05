import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:zynabaiexpoders/app/ui/FIneDoctorsNearby/general_physician.dart';

import '../../../config/constant/constant.dart';
import '../../routes/app_pages.dart';
import '../DoctorDetails/doctor_details.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../widgets/custom_calander.dart';
import '../widgets/custom_textfield_auth.dart';

class FindDoctorNearbyPage extends StatefulWidget {
  final String? roll;
  const FindDoctorNearbyPage({super.key, this.roll});

  @override
  State<FindDoctorNearbyPage> createState() => _FindDoctorNearbyPageState();
}

class _FindDoctorNearbyPageState extends State<FindDoctorNearbyPage> {
  FocusNode focusNode = FocusNode();
  var searchController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  bool isFormSubmitted = false, dateError = false;
  int selectedIndex = 0;
  String selectedPerson = "", pickedDate = "", selectdate = "YYYY/MM/DD";
  String add = "";
  @override
  void initState() {
    if (widget.roll.toString() != "null") {
      var person = widget.roll ?? "";
      setState(() {
        selectedPerson = person;
      });
    } else {
      var person = getStorage.read("selctetperson") ?? "";
      setState(() {
        selectedPerson = person;
      });
    }
    // var person = getStorage.read("addpatients") ?? "";
    // setState(() {
    //   selectedIndex = person == "ADD" ? 3 : selectedIndex;
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                selectedPerson == "Doctor"
                    ? const Text(
                        "Find Patients \nNearby",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 23),
                      )
                    : Text(
                        selectedIndex == 0
                            ? "Find Doctors \nNearby"
                            : selectedIndex == 1
                                ? "My\nDoctors"
                                : "My\nAppointments",
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 23),
                      ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    // selectedPerson == "Doctor"
                    //     ? buildSicknessWidget("Add Patient", 3)
                    //     : Container(),
                    // const SizedBox(width: 10),
                    buildSicknessWidget(
                        selectedPerson == "Doctor" ? "Patients" : "Doctors", 0),
                    const SizedBox(width: 10),
                    buildSicknessWidget(
                        selectedPerson == "Doctor"
                            ? "My Patients"
                            : "My Doctors",
                        1),
                    const SizedBox(width: 10),
                    selectedPerson == "Doctor"
                        ? Container()
                        : buildSicknessWidget("Appointments", 2)
                  ],
                ),
                selectedIndex == 3 && selectedPerson == "Doctor"
                    ? Container()
                    : TextFormField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(color: kPrimaryColor),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFACACAC),
                              width: 1,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFACACAC),
                              width: 1,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kWhiteColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 15),
                selectedIndex == 0
                    ? selectedPerson == "Doctor"
                        ? Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      buildNearby("Rammi\nRathod",
                                          "assets/icons/g1.png", "4.5", ""),
                                      const SizedBox(width: 5),
                                      buildNearby("Aryaa\nPatel",
                                          "assets/icons/g2.png", "4.8", ""),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      buildNearby("Vincent\nChepkwony",
                                          "assets/icons/g3.png", "4.5", ""),
                                      const SizedBox(width: 5),
                                      buildNearby("Amelia\nKimani",
                                          "assets/icons/g4.png", "4.8", ""),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      buildNearby("John\nDoe",
                                          "assets/icons/g5.png", "4.5", ""),
                                      const SizedBox(width: 5),
                                      buildNearby("Anusha\nPriya",
                                          "assets/icons/g6.png", "4.8", ""),
                                    ],
                                  ),
                                  const SizedBox(height: 85)
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Nearby",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdNormal,
                                            fontSize: 16),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() =>
                                              const GeneralPhysicianPage(
                                                  title: "Nearby"));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: kPrimaryColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: const Text(
                                            "View All",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        buildNearby(
                                            "Dr. Pooja\nPatel",
                                            "assets/icons/h1.png",
                                            "4.5",
                                            "Dentist / 2+ yrs"),
                                        buildNearby(
                                            "Dr. Aryaa\nPatel",
                                            "assets/icons/h3.png",
                                            "4.8",
                                            "Surgeons / 8+ yrs"),
                                        buildNearby(
                                            "Dr. Aryaa\nPatel",
                                            "assets/icons/h5.png",
                                            "4.8",
                                            "Surgeons / 8+ yrs")
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Dentist",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdNormal,
                                            fontSize: 16),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() =>
                                              const GeneralPhysicianPage(
                                                  title: "Dentist"));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: kPrimaryColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: const Text(
                                            "View All",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    child: Row(
                                      children: [
                                        buildNearby(
                                            "Dr. Amelia\nKimani",
                                            "assets/icons/doctor3.png",
                                            "4.5",
                                            "Dentist / 2+ yrs"),
                                        buildNearby(
                                            "Dr. Vincent\nChepkwony",
                                            "assets/icons/doctor4.png",
                                            "4.8",
                                            "Surgeons / 8+ yrs"),
                                        buildNearby(
                                            "Dr. Aryaa\nPatel",
                                            "assets/icons/h5.png",
                                            "4.8",
                                            "Surgeons / 8+ yrs")
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "General Physician",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdNormal,
                                            fontSize: 16),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() =>
                                              const GeneralPhysicianPage(
                                                  title: "General Physician"));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: kPrimaryColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: const Text(
                                            "View All",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        buildNearby(
                                            "Dr. John\nDoe",
                                            "assets/icons/doctor5.png",
                                            "4.5",
                                            "General / 2+ yrs"),
                                        buildNearby(
                                            "Dr. Anusha\nPriya",
                                            "assets/icons/doctor1.png",
                                            "4.8",
                                            "General P / 8+ yrs"),
                                        buildNearby(
                                            "Dr. Aryaa\nPatel",
                                            "assets/icons/h5.png",
                                            "4.8",
                                            "General P / 8+ yrs")
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 85)
                                ],
                              ),
                            ),
                          )
                    : selectedIndex == 1
                        ? selectedPerson == "Doctor"
                            ? Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          buildNearby("John\nDoe",
                                              "assets/icons/g5.png", "4.5", ""),
                                          const SizedBox(width: 5),
                                          buildNearby("Rammi\nRathod",
                                              "assets/icons/g1.png", "4.5", ""),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          buildNearby("Vincent\nChepkwony",
                                              "assets/icons/g3.png", "4.5", ""),
                                          const SizedBox(width: 5),
                                          buildNearby("Aryaa\nPatel",
                                              "assets/icons/g2.png", "4.8", ""),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          buildNearby("Anusha\nPriya",
                                              "assets/icons/g6.png", "4.8", ""),
                                          const SizedBox(width: 5),
                                          buildNearby("Amelia\nKimani",
                                              "assets/icons/g4.png", "4.8", ""),
                                        ],
                                      ),
                                      const SizedBox(height: 85)
                                    ],
                                  ),
                                ),
                              )
                            : Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          buildNearby(
                                              "Dr. Pooja\nPatel",
                                              "assets/icons/h1.png",
                                              "4.5",
                                              "Physician / 2+ yrs"),
                                          const SizedBox(width: 5),
                                          buildNearby(
                                              "Dr. Aryaa\nPatel",
                                              "assets/icons/h3.png",
                                              "4.8",
                                              "Surgeons / 8+ yrs"),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          buildNearby(
                                              "Dr. Amelia\nKimani",
                                              "assets/icons/h5.png",
                                              "4.5",
                                              "Physician / 2+ yrs"),
                                          const SizedBox(width: 5),
                                          buildNearby(
                                              "Dr. Vincent\nChepkwony",
                                              "assets/icons/doctor4.png",
                                              "4.8",
                                              "Surgeons / 8+ yrs"),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          buildNearby(
                                              "Dr. Anusha\nPriya",
                                              "assets/icons/doctor1.png",
                                              "4.5",
                                              "Physician / 2+ yrs"),
                                          const SizedBox(width: 5),
                                          buildNearby(
                                              "Dr. John\nDoe",
                                              "assets/icons/doctor5.png",
                                              "4.8",
                                              "Surgeons / 8+ yrs"),
                                        ],
                                      ),
                                      const SizedBox(height: 85)
                                    ],
                                  ),
                                ),
                              )
                        // : selectedIndex == 3
                        //     ? selectedPerson == "Doctor"
                        //         ? GestureDetector(
                        //             onTap: () {
                        //               FocusScope.of(context)
                        //                   .requestFocus(FocusNode());
                        //             },
                        //             child: SingleChildScrollView(
                        //               child: Padding(
                        //                 padding: const EdgeInsets.symmetric(
                        //                     horizontal: 15.0),
                        //                 child: Column(
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: [
                        //                     const SizedBox(height: 15),
                        //                     SizedBox(
                        //                       width: Get.width > 500
                        //                           ? 600
                        //                           : Get.width,
                        //                       child: IntrinsicHeight(
                        //                         child: Row(
                        //                           crossAxisAlignment:
                        //                               CrossAxisAlignment.start,
                        //                           children: [
                        //                             Flexible(
                        //                               flex: 5,
                        //                               child:
                        //                                   CustomTextFormFieldAuth(
                        //                                 hintText: 'First Name',
                        //                                 maxLines: 1,
                        //                                 ctrl:
                        //                                     firstNameController,
                        //                                 name: "name",
                        //                                 prefixIcon:
                        //                                     'assets/icons/edit_profile_icon.png',
                        //                                 formSubmitted:
                        //                                     isFormSubmitted,
                        //                                 validationMsg:
                        //                                     'Please enter first name',
                        //                               ),
                        //                             ),
                        //                             const SizedBox(width: 10),
                        //                             Expanded(
                        //                               flex: 5,
                        //                               child:
                        //                                   CustomTextFormFieldAuth(
                        //                                 hintText: 'Last Name',
                        //                                 maxLines: 1,
                        //                                 ctrl:
                        //                                     lastNameController,
                        //                                 name: "name",
                        //                                 prefixIcon:
                        //                                     'assets/icons/edit_profile_icon.png',
                        //                                 formSubmitted:
                        //                                     isFormSubmitted,
                        //                                 validationMsg:
                        //                                     'Please enter last name',
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     const SizedBox(height: 15),
                        //                     SizedBox(
                        //                       width: Get.width > 500
                        //                           ? 600
                        //                           : Get.width,
                        //                       child: CustomTextFormFieldAuth(
                        //                         hintText: 'Email',
                        //                         maxLines: 1,
                        //                         ctrl: emailController,
                        //                         name: "email",
                        //                         prefixIcon:
                        //                             'assets/icons/email.png',
                        //                         formSubmitted: isFormSubmitted,
                        //                         validationMsg:
                        //                             'Please enter email',
                        //                       ),
                        //                     ),
                        //                     const SizedBox(height: 15),
                        //                     SizedBox(
                        //                       width: Get.width > 500
                        //                           ? 600
                        //                           : Get.width,
                        //                       child: CustomTextFormFieldAuth(
                        //                         hintText: 'Phone Number',
                        //                         maxLines: 1,
                        //                         ctrl: mobileNoController,
                        //                         name: "phonenumber",
                        //                         keyboardType:
                        //                             TextInputType.phone,
                        //                         prefixIcon:
                        //                             'assets/icons/phoneicon.png',
                        //                         formSubmitted: isFormSubmitted,
                        //                         validationMsg:
                        //                             'Please enter Phone Number',
                        //                       ),
                        //                     ),
                        //                       const SizedBox(height: 15),
                        //                      IntrinsicHeight(
                        //                       child: Row(
                        //                         mainAxisAlignment:
                        //                             MainAxisAlignment.center,
                        //                         children: [
                        //                           Column(
                        //                             crossAxisAlignment:
                        //                                 CrossAxisAlignment
                        //                                     .start,
                        //                             children: [
                        //                               Container(
                        //                                 height: 50,
                        //                                 width: Get.width - 60,
                        //                                 padding:
                        //                                     const EdgeInsets
                        //                                         .fromLTRB(
                        //                                         15, 0, 15, 0),
                        //                                 decoration:
                        //                                     BoxDecoration(
                        //                                   color: kWhiteColor,
                        //                                   borderRadius:
                        //                                       BorderRadius
                        //                                           .circular(8),
                        //                                 ),
                        //                                 child: InkWell(
                        //                                   onTap: () {
                        //                                     FocusScope.of(
                        //                                             context)
                        //                                         .requestFocus(
                        //                                             FocusNode());
                        //                                     BottomPicker.date(
                        //                                       pickerTitle:
                        //                                           const Text(
                        //                                               ""),
                        //                                       onSubmit:
                        //                                           (index) {
                        //                                         String
                        //                                             formattedDate =
                        //                                             DateFormat(
                        //                                                     'dd-MM-yyyy')
                        //                                                 .format(
                        //                                                     index);
                        //                                         String
                        //                                             formattedstartDate =
                        //                                             DateFormat(
                        //                                                     "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                        //                                                 .format(
                        //                                                     index);
                        //                                         if (mounted) {
                        //                                           setState(() {
                        //                                             selectdate =
                        //                                                 formattedDate;
                        //                                             pickedDate =
                        //                                                 formattedstartDate;
                        //                                             dateError =
                        //                                                 false;
                        //                                           });
                        //                                         }
                        //                                       },
                        //                                       dateOrder:
                        //                                           DatePickerDateOrder
                        //                                               .ymd,
                        //                                       minDateTime:
                        //                                           DateTime(1850,
                        //                                               1, 1),
                        //                                       maxDateTime:
                        //                                           DateTime.now(),
                        //                                       pickerTextStyle:
                        //                                           const TextStyle(
                        //                                         color:
                        //                                             kPrimaryColor,
                        //                                         fontWeight:
                        //                                             FontWeight
                        //                                                 .bold,
                        //                                         fontSize: 14,
                        //                                       ),
                        //                                       onClose: () {
                        //                                         Navigator.of(
                        //                                                 context)
                        //                                             .pop();
                        //                                       },
                        //                                       bottomPickerTheme:
                        //                                           BottomPickerTheme
                        //                                               .plumPlate,
                        //                                       buttonAlignment:
                        //                                           MainAxisAlignment
                        //                                               .center,
                        //                                       buttonContent:
                        //                                           const Center(
                        //                                               child:
                        //                                                   Text(
                        //                                         "Done",
                        //                                         style: TextStyle(
                        //                                             color:
                        //                                                 kPrimaryColor),
                        //                                       )),
                        //                                       buttonStyle: BoxDecoration(
                        //                                           color:
                        //                                               kHighlightColor,
                        //                                           borderRadius:
                        //                                               BorderRadius
                        //                                                   .circular(
                        //                                                       15)),
                        //                                       closeIconColor:
                        //                                           kPrimaryColor,
                        //                                       closeIconSize: 25,
                        //                                     ).show(context);
                        //                                   },
                        //                                   child: Row(
                        //                                     mainAxisAlignment:
                        //                                         MainAxisAlignment
                        //                                             .spaceBetween,
                        //                                     children: [
                        //                                       Text(
                        //                                         selectdate,
                        //                                         style:
                        //                                             const TextStyle(
                        //                                           fontFamily:
                        //                                               kCircularStdBook,
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .w400,
                        //                                           color:
                        //                                               kPrimaryColor,
                        //                                           fontSize: 14,
                        //                                         ),
                        //                                       ),
                        //                                       Image.asset(
                        //                                         "assets/icons/polygon_down.png",
                        //                                         scale: 2,
                        //                                       ),
                        //                                     ],
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                               if (isFormSubmitted &&
                        //                                   dateError)
                        //                                 const Padding(
                        //                                   padding:
                        //                                       EdgeInsets.only(
                        //                                           top: 6.0,
                        //                                           left: 12),
                        //                                   child: Text(
                        //                                     "Please select Start Date",
                        //                                     style: TextStyle(
                        //                                       color:
                        //                                           kErrorColor,
                        //                                       fontFamily:
                        //                                           kCircularStdNormal,
                        //                                       fontSize: 12,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                             ],
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                     const SizedBox(height: 25),
                        //                     SizedBox(
                        //                       width: Get.width,
                        //                       child: CupertinoButton(
                        //                         color: kHighlightColor,
                        //                         borderRadius:
                        //                             BorderRadius.circular(25),
                        //                         child: Row(
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment.center,
                        //                           children: [
                        //                             const Text(
                        //                               "Save Patient",
                        //                               style: TextStyle(
                        //                                   color: kPrimaryColor,
                        //                                   fontFamily:
                        //                                       kCircularStdMedium,
                        //                                   fontSize: 14),
                        //                             ),
                        //                             const SizedBox(width: 10),
                        //                             Image.asset(
                        //                               "assets/icons/arrow_right.png",
                        //                               color: kPrimaryColor,
                        //                               scale: 1.3,
                        //                             )
                        //                           ],
                        //                         ),
                        //                         onPressed: () {},
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           )
                        //         : Container()
                        : Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      buildNearby(
                                          "5th Mar 2024",
                                          "assets/icons/h1.png",
                                          "4.5",
                                          "Physician / 2+ yrs"),
                                      const SizedBox(width: 5),
                                      buildNearby(
                                          "10th Mar 2024",
                                          "assets/icons/h3.png",
                                          "4.8",
                                          "Surgeons / 8+ yrs"),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      buildNearby(
                                          "5th Mar 2024",
                                          "assets/icons/h5.png",
                                          "4.5",
                                          "Physician / 2+ yrs"),
                                      const SizedBox(width: 5),
                                      buildNearby(
                                          "10th Mar 2024",
                                          "assets/icons/doctor4.png",
                                          "4.8",
                                          "Surgeons / 8+ yrs"),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      buildNearby(
                                          "5th Mar 2024",
                                          "assets/icons/doctor1.png",
                                          "4.5",
                                          "Physician / 2+ yrs"),
                                      const SizedBox(width: 5),
                                      buildNearby(
                                          "10th Mar 2024",
                                          "assets/icons/doctor5.png",
                                          "4.8",
                                          "Surgeons / 8+ yrs"),
                                    ],
                                  ),
                                  const SizedBox(height: 85)
                                ],
                              ),
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNearby(String text, image, review, year) {
    Size size = MediaQuery.of(context).size;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        selectedIndex == 2
            ? Get.toNamed(Routes.appointmentDetailsPage)
            : Get.to(
                () => DoctoreDetailsPage(
                  name: text,
                  year: year,
                  image: image,
                  roll: widget.roll,
                ),
              );
      },
      child: Card(
        shadowColor: const Color.fromARGB(10, 0, 0, 0),
        elevation: 5,
        child: Container(
            width: size.width / 2.340,
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: selectedIndex == 2
                              ? const Color(0xFFE6E6E6)
                              : kWhiteColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: selectedIndex == 2
                          ? const Center(child: Text("5th"))
                          : Image.asset(image),
                    ),
                    selectedIndex == 0
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (selectedPerson != "Doctor") {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        width: 1, color: kPrimaryColor)),
                                child: const Icon(
                                  Icons.add,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdMedium,
                      fontSize: 16),
                ),
                SizedBox(height: year == "" ? 0 : 10),
                Text(
                  selectedIndex == 2 ? "10:30 AM" : year,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 12),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kHighlightColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: kPrimaryColor,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "Upcoming",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        selectedIndex == 2
                            ? Get.toNamed(Routes.appointmentDetailsPage)
                            : Get.to(
                                () => DoctoreDetailsPage(
                                  name: text,
                                  year: year,
                                  image: image,
                                  roll: widget.roll,
                                ),
                              );
                      },
                      child: Container(
                        width: 39,
                        height: 39,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: selectedIndex == 2
                            ? Image.asset(image)
                            : const Icon(
                                Icons.arrow_right_alt_rounded,
                                color: kWhiteColor,
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    selectedIndex == 2
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                review,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 23),
                              ),
                              const Text(
                                "212 Reviews",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  buildNearby2(String text, image, review, year) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shadowColor: const Color.fromARGB(10, 0, 0, 0),
      elevation: 5,
      child: Container(
          width: size.width / 2.340,
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: selectedIndex == 2 ? kSecondaryColor : kWhiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: selectedIndex == 2
                    ? const Center(child: Text("5th"))
                    : Image.asset(image),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                year,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdNormal,
                    fontSize: 12),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 39,
                    height: 39,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Icon(
                      Icons.arrow_right_alt_rounded,
                      color: kWhiteColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        review,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 23),
                      ),
                      const Text(
                        "212 Reviews",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }

  buildSicknessWidget(String text, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            color: selectedIndex == index ? kHighlightColor : kWhiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: const TextStyle(
              color: kPrimaryColor,
              fontFamily: kCircularStdNormal,
              fontSize: 15),
        ),
      ),
    );
  }
}
