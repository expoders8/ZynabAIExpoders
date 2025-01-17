import 'dart:io';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../controller/tab_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../../models/userdata_model.dart';
import '../TabPage/tabpage.dart';
import '../widgets/custom_picker.dart';
import '../widgets/custom_textfield_auth.dart';

class UserProfileInformationPage extends StatefulWidget {
  final String? edit;
  final String? roll;
  const UserProfileInformationPage({super.key, this.edit, this.roll});

  @override
  State<UserProfileInformationPage> createState() =>
      _UserProfileInformationPageState();
}

class _UserProfileInformationPageState
    extends State<UserProfileInformationPage> {
  int? ft;
  int? weight;
  int? inch;
  String? pickcategories;
  bool isFormSubmitted = false,
      categoriesError = false,
      isButtonDisabled = false;
  String selctesType = "Male";
  FocusNode focusNode = FocusNode();
  final _queFormKey = GlobalKey<FormState>();
  final tabController = Get.put(TabCountController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController localfeesController = TextEditingController();
  final TextEditingController feesController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  final List<String> _categories = [
    "General Practitioner",
    "Cardiologist",
    "Dermatologist",
  ];

  final List<String> questionsPatient = [
    "Personal Information.",
    "Tell us about your past medical history. Select any conditions you've had before",
    "Does anyone in your family have a history of these conditions? Select one or more that apply"
  ];
  final List<String> questionsDoctor = [
    "Basic Information.",
    "Consultation Fees?",
    "What conditions do you treat?",
    "Availability Schedule"
  ];

  List<dynamic> selectedmedical = [];
  List<dynamic> selectedmedicalfamily = [];
  final List<MedicalHistory> medical = [
    MedicalHistory(title: 'Diabetes'),
    MedicalHistory(title: 'Hypertension (High Blood Pressure)'),
    MedicalHistory(title: 'Asthma'),
    MedicalHistory(title: 'Stroke'),
    MedicalHistory(title: 'Cancer'),
    MedicalHistory(title: 'Chronic Kidney Disease'),
    MedicalHistory(title: 'Liver Disease'),
    MedicalHistory(title: 'Allergies'),
    MedicalHistory(title: 'Chronic Pain'),
    MedicalHistory(title: 'Epilepsy/Seizures'),
    MedicalHistory(title: 'Arthritis'),
    MedicalHistory(title: 'Depression/Anxiety'),
    MedicalHistory(title: 'Thyroid Disorders'),
  ];
  void toggleSelectionNearby(int id) {
    setState(() {
      String nearbyTitle = medical[id].title;
      if (selectedmedical.contains(nearbyTitle)) {
        selectedmedical.remove(nearbyTitle);
      } else {
        selectedmedical.add(nearbyTitle);
      }
    });
  }

  void toggleSelectionmedicalfamily(int id) {
    setState(() {
      String nearbyTitle = medical[id].title;
      if (selectedmedicalfamily.contains(nearbyTitle)) {
        selectedmedicalfamily.remove(nearbyTitle);
      } else {
        selectedmedicalfamily.add(nearbyTitle);
      }
    });
  }

  List<dynamic> selectedservice = [];
  final List<Serices> services = [
    Serices(title: 'Diabetes Management'),
    Serices(title: 'Hypertension Treatment'),
    Serices(title: 'Asthma and Allergies'),
    Serices(title: 'Cardiovascular Diseases'),
    Serices(title: 'Pediatric Care'),
    Serices(title: 'Mental Health Counseling'),
    Serices(title: 'Skin Conditions'),
    Serices(title: 'Womens Health (e.g., Gynecology)'),
    Serices(title: 'General Checkups'),
    Serices(title: 'Vaccinations'),
  ];
  void toggleserviceselecte(int id) {
    setState(() {
      String nearbyTitle = services[id].title;
      if (selectedservice.contains(nearbyTitle)) {
        selectedservice.remove(nearbyTitle);
      } else {
        selectedservice.add(nearbyTitle);
      }
    });
  }

  List<String> selectedDays = [];
  List<Map<String, String>> timeSlots = [];
  List<DateTime> unavailableDates = [];

  final List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  void _addTimeSlot() {
    setState(() {
      timeSlots.add({"start": "", "end": ""});
    });
  }

  void _pickUnavailableDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        unavailableDates.add(pickedDate);
      });
    }
  }

  String selectedText = "";
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    buttonEventHandler(currentIndex);
    nameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonDisabled = nameController.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentIndex + 1) / questionsPatient.length;
    double progressdoctor = (currentIndex + 1) / questionsDoctor.length;
    return Scaffold(
      body: widget.roll == "Patient"
          ? Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(color: kBackGroundColor),
              child: Form(
                key: _queFormKey,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            width: Get.width - 50,
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, bottom: 5),
                                  child: Text(
                                    questionsPatient[currentIndex] ==
                                            "Personal Information."
                                        ? "Personal Information."
                                        : questionsPatient[currentIndex] ==
                                                "Tell us about your past medical history. Select any conditions you've had before"
                                            ? "Tell us about your past medical history. Select any conditions you've had before"
                                            : questionsPatient[currentIndex] ==
                                                    "Does anyone in your family have a history of these conditions? Select one or more that apply"
                                                ? "Does anyone in your family have a history of these conditions?\nSelect one or more that apply"
                                                : "Some issues please close app and re-open",
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 19,
                                        fontFamily: kCircularStdMedium),
                                  ),
                                ),
                                questionsPatient[currentIndex] ==
                                        "Personal Information."
                                    ? buildPersonalinfo()
                                    : questionsPatient[currentIndex] ==
                                            "Tell us about your past medical history. Select any conditions you've had before"
                                        ? buildSelectMedical()
                                        : questionsPatient[currentIndex] ==
                                                "Does anyone in your family have a history of these conditions? Select one or more that apply"
                                            ? buildSelectMedicalfamily()
                                            : Container(),
                              ],
                            ),
                          ),
                        ),
                        LinearProgressIndicator(
                          value: progress,
                          minHeight: 4,
                          backgroundColor:
                              const Color.fromARGB(255, 211, 210, 210),
                          color: kPrimaryColor,
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              currentIndex > 0
                                  ? CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        if (currentIndex > 0) {
                                          setState(() {
                                            currentIndex--;
                                          });
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: kPrimaryColor,
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: const Icon(
                                              Icons.arrow_back_sharp,
                                              color: kWhiteColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Row(
                                children: [
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      if (currentIndex != 2) {
                                        setState(() {
                                          currentIndex++;
                                          buttonEventHandler(currentIndex);
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Skip",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontFamily: kCircularStdNormal,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  SizedBox(
                                    width: 100,
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      color: kHighlightColor,
                                      borderRadius: BorderRadius.circular(25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            currentIndex != 2
                                                ? "Next"
                                                : "Submit",
                                            style: const TextStyle(
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
                                        if (isButtonDisabled == false) {
                                          if (currentIndex <
                                              questionsPatient.length - 1) {
                                            setState(() {
                                              currentIndex++;
                                              buttonEventHandler(currentIndex);
                                            });
                                          } else {
                                            // submitData();
                                            Get.offAll(() => const TabPage());
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(color: kBackGroundColor),
              child: Form(
                key: _queFormKey,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            width: Get.width - 50,
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 5),
                                  child: Text(
                                    questionsDoctor[currentIndex] ==
                                            "Basic Information."
                                        ? "Basic Information."
                                        : questionsDoctor[currentIndex] ==
                                                "Consultation Fees?"
                                            ? "Consultation Fees?"
                                            : questionsDoctor[currentIndex] ==
                                                    "What conditions do you treat?"
                                                ? "What conditions do you treat?"
                                                : questionsDoctor[
                                                            currentIndex] ==
                                                        "Availability Schedule"
                                                    ? "Availability Schedule"
                                                    : "Some issues please close app and re-open",
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 19,
                                        fontFamily: kCircularStdMedium),
                                  ),
                                ),
                                questionsDoctor[currentIndex] ==
                                        "Basic Information."
                                    ? buildBasicinfo()
                                    : questionsDoctor[currentIndex] ==
                                            "Consultation Fees?"
                                        ? buildConsultationFees()
                                        : questionsDoctor[currentIndex] ==
                                                "What conditions do you treat?"
                                            ? buildSelectservice()
                                            : questionsDoctor[currentIndex] ==
                                                    "Availability Schedule"
                                                ? buildAvailable()
                                                : Container(),
                              ],
                            ),
                          ),
                        ),
                        LinearProgressIndicator(
                          value: progressdoctor,
                          minHeight: 4,
                          backgroundColor:
                              const Color.fromARGB(255, 211, 210, 210),
                          color: kPrimaryColor,
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              currentIndex > 0
                                  ? CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        if (currentIndex > 0) {
                                          setState(() {
                                            currentIndex--;
                                          });
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: kPrimaryColor,
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: const Icon(
                                              Icons.arrow_back_sharp,
                                              color: kWhiteColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Row(
                                children: [
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      if (currentIndex != 3) {
                                        setState(() {
                                          currentIndex++;
                                          buttonEventHandler(currentIndex);
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Skip",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontFamily: kCircularStdNormal,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      color: kHighlightColor,
                                      borderRadius: BorderRadius.circular(25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            currentIndex != 3
                                                ? "Next"
                                                : "Submit",
                                            style: const TextStyle(
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
                                        if (isButtonDisabled == false) {
                                          if (currentIndex <
                                              questionsDoctor.length - 1) {
                                            setState(() {
                                              currentIndex++;
                                              buttonEventHandler(currentIndex);
                                            });
                                          } else {
                                            // submitData();
                                            Get.offAll(() => const TabPage());
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
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

  String selectdate = "YYYY/MM/DD", pickedDate = "";
  bool dateError = false;
  buildPersonalinfo() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextWidget("Select Birthdate"),
                  Container(
                    height: 50,
                    width: Get.width - 50,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
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
                            "Save",
                            style: TextStyle(color: kWhiteColor),
                          )),
                          buttonStyle: BoxDecoration(
                              color: kButtonColor,
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
                              color: kPrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                          Image.asset(
                            "assets/icons/polygon_down.png",
                            scale: 2,
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
          const SizedBox(height: 5),
          buildTextWidget("Select Gender"),
          const SizedBox(height: 3),
          Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    selctesType = "Male";
                  });
                },
                child: Container(
                  height: 45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              color: selctesType == "Male"
                                  ? kPrimaryColor
                                  : kWhiteColor,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Male",
                        style: TextStyle(
                            fontSize: 15,
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    selctesType = "Female";
                  });
                },
                child: Container(
                  height: 45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(25)),
                          child: Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color: selctesType == "Female"
                                    ? kPrimaryColor
                                    : kWhiteColor,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Female",
                          style: TextStyle(
                              fontSize: 15,
                              color: kPrimaryColor,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          buildTextWidget("Select Height"),
          const SizedBox(height: 3),
          SizedBox(
            height: Get.height / 5.7,
            child: Row(
              children: [
                Expanded(
                  child: CustomPicker(
                    lastNo: 9,
                    onSelect: (v) {
                      ft = v;
                    },
                    initialItem: ft == null ? 4 : ft!,
                  ),
                ),
                const Text(
                  "Ft",
                ),
                Expanded(
                  child: CustomPicker(
                    lastNo: 12,
                    onSelect: (v) {
                      inch = v;
                    },
                    initialItem: inch == null ? 5 : inch!,
                  ),
                ),
                const Text(
                  "Inch",
                ),
              ],
            ),
          ),
          buildTextWidget("Select Weight"),
          const SizedBox(height: 3),
          SizedBox(
            height: Get.height / 5.7,
            child: Row(
              children: [
                Expanded(
                  child: CustomPicker(
                    lastNo: 250,
                    onSelect: (v) {
                      weight = v;
                    },
                    initialItem: weight == null ? 45 : weight!,
                  ),
                ),
                const Text(
                  "Kg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildBasicinfo() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextWidget("Enter Title (e.g., Dr., Prof.)"),
              SizedBox(
                width: Get.width - 50,
                child: CustomTextFormFieldAuth(
                  hintText: 'Title Name',
                  maxLines: 1,
                  ctrl: titleController,
                  name: "name",
                  formSubmitted: isFormSubmitted,
                  validationMsg: 'Please enter Title',
                ),
              ),
              const SizedBox(height: 10),
              buildTextWidget("Main Specialization"),
              Container(
                height: 48,
                width: Get.width - 50,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: pickcategories == "null" || pickcategories == ""
                        ? ""
                        : pickcategories,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 9.0),
                      child: Image.asset(
                        "assets/icons/polygon_down.png",
                        scale: 1,
                        width: 13,
                      ),
                    ),
                    hint: const Text(
                      "Specialization",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: kCircularStdBook,
                        fontSize: 15,
                      ),
                    ),
                    items: _categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        categoryController.text = value ?? '';
                        pickcategories = value;
                        categoriesError = false;
                      });
                    },
                  ),
                ),
              ),
              categoriesError == true
                  ? const Padding(
                      padding: EdgeInsets.only(left: 13, top: 6),
                      child: Text(
                        "Select Specialization",
                        style: TextStyle(
                            color: Color.fromARGB(255, 200, 53, 42),
                            fontSize: 11,
                            fontFamily: kCircularStdBook),
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(height: 10),
          buildTextWidget("Enter Subspecialty"),
          SizedBox(
            width: Get.width - 50,
            child: CustomTextFormFieldAuth(
              hintText: 'Subspecialty',
              maxLines: 1,
              ctrl: titleController,
              name: "name",
              formSubmitted: isFormSubmitted,
              validationMsg: 'Please enter Subspecialty',
            ),
          ),
        ],
      ),
    );
  }

  buildConsultationFees() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          buildTextWidget("In-Person Consultation Fee:"),
          SizedBox(
            width: Get.width - 50,
            child: CustomTextFormFieldAuth(
              hintText: 'local currency',
              maxLines: 1,
              ctrl: localfeesController,
              name: "name",
              formSubmitted: isFormSubmitted,
              validationMsg: 'Please enter Fees',
            ),
          ),
          const SizedBox(height: 10),
          buildTextWidget("Virtual Consultation Fee"),
          SizedBox(
            width: Get.width - 50,
            child: CustomTextFormFieldAuth(
              hintText: 'Consultation Fee',
              maxLines: 1,
              ctrl: feesController,
              name: "name",
              formSubmitted: isFormSubmitted,
              validationMsg: 'Please enter Fee',
            ),
          ),
          const SizedBox(height: 10),
          buildTextWidget("Clinic Address/Location"),
          SizedBox(
            width: Get.width - 50,
            child: CustomTextFormFieldAuth(
              hintText: 'Address',
              maxLines: 1,
              ctrl: addressController,
              name: "address",
              formSubmitted: isFormSubmitted,
              validationMsg: 'Please enter Address',
            ),
          ),
        ],
      ),
    );
  }

  buildSelectMedical() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          buildTextWidget("Additional conditions"),
          SizedBox(
            width: Get.width - 50,
            child: CustomTextFormFieldAuth(
              hintText: 'Enter conditions',
              maxLines: 1,
              ctrl: feesController,
              name: "name",
              formSubmitted: isFormSubmitted,
              validationMsg: 'Please enter conditions',
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 4,
                childAspectRatio: 6,
              ),
              padding: const EdgeInsets.all(5),
              itemCount: medical.length,
              itemBuilder: (context, index) {
                final dept = medical[index];
                final isSelected =
                    selectedmedical.contains(medical[index].title);
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => toggleSelectionNearby(index),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color:
                                  isSelected ? kPrimaryColor : kDividerColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                dept.title,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdBook),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isSelected)
                      Positioned(
                        right: -5,
                        top: -3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  buildSelectMedicalfamily() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          buildTextWidget("Additional conditions"),
          SizedBox(
            width: Get.width - 50,
            child: CustomTextFormFieldAuth(
              hintText: 'Enter conditions',
              maxLines: 1,
              ctrl: feesController,
              name: "name",
              formSubmitted: isFormSubmitted,
              validationMsg: 'Please enter conditions',
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 4,
                childAspectRatio: 6,
              ),
              padding: const EdgeInsets.all(5),
              itemCount: medical.length,
              itemBuilder: (context, index) {
                final dept = medical[index];
                final isSelected =
                    selectedmedicalfamily.contains(medical[index].title);
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => toggleSelectionmedicalfamily(index),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color:
                                  isSelected ? kPrimaryColor : kDividerColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                dept.title,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdBook),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isSelected)
                      Positioned(
                        right: -5,
                        top: -3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  buildSelectservice() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          buildTextWidget("Additional services"),
          SizedBox(
            width: Get.width - 50,
            child: CustomTextFormFieldAuth(
              hintText: 'Enter services',
              maxLines: 1,
              ctrl: feesController,
              name: "name",
              formSubmitted: isFormSubmitted,
              validationMsg: 'Please enter services',
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 4,
                childAspectRatio: 6,
              ),
              padding: const EdgeInsets.all(5),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final dept = services[index];
                final isSelected = selectedservice.contains(dept.title);

                return CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => toggleserviceselecte(index),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: isSelected ? kPrimaryColor : kDividerColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 5),
                          Checkbox(
                            value: isSelected,
                            activeColor: kPrimaryColor,
                            onChanged: (value) {
                              toggleserviceselecte(index);
                            },
                          ),
                          const SizedBox(width: 5),
                          Text(
                            dept.title,
                            style: const TextStyle(
                                fontSize: 15,
                                color: kPrimaryColor,
                                fontFamily: kCircularStdBook),
                            overflow: TextOverflow.ellipsis,
                          ),
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

  buildAvailable() {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            buildTextWidget("Days Available"),
            Wrap(
              spacing: 8.0,
              children: daysOfWeek.map((day) {
                return FilterChip(
                  label: Text(
                    day,
                    style: const TextStyle(color: kPrimaryColor),
                  ),
                  selectedColor: kWhiteColor,
                  selected: selectedDays.contains(day),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? selectedDays.add(day)
                          : selectedDays.remove(day);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            buildTextWidget("Time Slots"),
            ...timeSlots.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> slot = entry.value;
              return Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Start Time"),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode: TimePickerEntryMode.inputOnly);
                        if (pickedTime != null) {
                          setState(() {
                            timeSlots[index]['start'] =
                                pickedTime.format(context);
                          });
                        }
                      },
                      controller: TextEditingController(
                        text: slot['start'],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "End Time"),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode: TimePickerEntryMode.inputOnly);
                        if (pickedTime != null) {
                          setState(() {
                            timeSlots[index]['end'] =
                                pickedTime.format(context);
                          });
                        }
                      },
                      controller: TextEditingController(
                        text: slot['end'],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        timeSlots.removeAt(index);
                      });
                    },
                  ),
                ],
              );
            }).toList(),
            TextButton.icon(
              onPressed: _addTimeSlot,
              icon: const Icon(Icons.add, color: kPrimaryColor),
              label: const Text(
                "Add Time Slot",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
            const SizedBox(height: 20),
            buildTextWidget("Unavailable Dates"),
            Wrap(
              spacing: 8.0,
              children: unavailableDates.map((date) {
                return Chip(
                  label: Text(
                    "${date.day}/${date.month}/${date.year}",
                  ),
                  onDeleted: () {
                    setState(() {
                      unavailableDates.remove(date);
                    });
                  },
                );
              }).toList(),
            ),
            TextButton.icon(
              onPressed: _pickUnavailableDate,
              icon: const Icon(Icons.add, color: kPrimaryColor),
              label: const Text(
                "Add Unavailable Date",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buttonEventHandler(index) {}

  Widget buildTextWidget(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontFamily: kCircularStdMedium,
        ),
      ),
    );
  }
}
