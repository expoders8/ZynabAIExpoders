import 'dart:convert';

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
import 'package:http/http.dart' as http;
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
      isTouched = false,
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

  // final List<String> _categories = [
  //   "",
  //   "",
  //   "",
  // ];

  // List<dynamic> selectcategories = [];
  // final List<Serice> _categories = [
  //   Serice(title: 'Cardiology'),
  //   Serice(title: 'Dermatology'),
  //   Serice(title: 'Neurology'),
  //   Serice(title: 'Orthopedics'),
  //   Serice(title: 'Oncology'),
  //   Serice(title: 'Pediatrics'),
  //   Serice(title: 'Psychiatry'),
  //   Serice(title: 'Gastroenterology'),
  //   Serice(title: 'Pulmonology'),
  //   Serice(title: 'Endocrinology'),
  // ];
  List<String> selectedTitles = [];
  List<dynamic> selectcategories = [];
  String selectedSpecialization = '';
  final Map<String, List<String>> subSpecializations = {
    'Cardiology': [
      'Interventional Cardiology',
      'Pediatric Cardiology',
      'Cardiac Electrophysiology',
      'Heart Failure and Transplantation'
    ],
    'Dermatology': [
      'Pediatric Dermatology',
      'Cosmetic Dermatology',
      'Dermatopathology',
      'Immunodermatology'
    ],
    'Neurology': [
      'Pediatric Neurology',
      'Neurophysiology',
      'Stroke and Vascular Neurology',
      'Neurocritical Care'
    ],
    'Orthopedics': [
      'Sports Medicine',
      'Joint Replacement',
      'Pediatric Orthopedics',
      'Spine Surgery'
    ],
    'Oncology': [
      'Radiation Oncology',
      'Medical Oncology',
      'Surgical Oncology',
      'Pediatric Oncology'
    ],
    'Pediatrics': [
      'Pediatric Cardiology',
      'Pediatric Neurology',
      'Neonatology',
      'Pediatric Pulmonology'
    ],
    'Psychiatry': [
      'Child and Adolescent Psychiatry',
      'Forensic Psychiatry',
      'Addiction Psychiatry',
      'Geriatric Psychiatry'
    ],
    'Gastroenterology': [
      'Hepatology',
      'Pediatric Gastroenterology',
      'Endoscopy',
      'Inflammatory Bowel Disease'
    ],
    'Pulmonology': [
      'Critical Care Medicine',
      'Sleep Medicine',
      'Pediatric Pulmonology',
      'Interstitial Lung Disease'
    ],
    'Endocrinology': [
      'Pediatric Endocrinology',
      'Diabetes Management',
      'Reproductive Endocrinology',
      'Thyroid Disorders'
    ],
  };

  final List<Serice> _categories = [
    Serice(title: 'Cardiology'),
    Serice(title: 'Dermatology'),
    Serice(title: 'Neurology'),
    Serice(title: 'Orthopedics'),
    Serice(title: 'Oncology'),
    Serice(title: 'Pediatrics'),
    Serice(title: 'Psychiatry'),
    Serice(title: 'Gastroenterology'),
    Serice(title: 'Pulmonology'),
    Serice(title: 'Endocrinology'),
  ];

  void toggleSelectioncategories(int id) {
    setState(() {
      selectedSpecialization = _categories[id].title;
    });
  }

  void toggleSelection(String subSpec) {
    setState(() {
      if (selectedTitles.contains(subSpec)) {
        selectedTitles.remove(subSpec);
      } else {
        selectedTitles.add(subSpec);
      }
    });
  }

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

  List<Serices> filteredServices = [];
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
  void toggleserviceselecte(int index) {
    final dept = filteredServices[index];
    if (selectedservice.contains(dept.title)) {
      selectedservice.remove(dept.title);
    } else {
      selectedservice.add(dept.title);
    }
    setState(() {}); // This will force a rebuild when selection changes
  }

  // Function to filter services based on text input
  void filterServices(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredServices = services; // Show all services if query is empty
      });
    } else {
      setState(() {
        filteredServices = services
            .where((service) =>
                service.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
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

  // void _addTimeSlot() {
  //   setState(() {
  //     timeSlots.add({"start": "", "end": ""});
  //   });
  // }

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
    filteredServices = services;
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
                                  currentIndex != 2
                                      ? CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            if (currentIndex != 2) {
                                              setState(() {
                                                currentIndex++;
                                                buttonEventHandler(
                                                    currentIndex);
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
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
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
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
                                  padding:
                                      const EdgeInsets.only(top: 10, bottom: 5),
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
                                  currentIndex != 3
                                      ? CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            if (currentIndex != 3) {
                                              setState(() {
                                                currentIndex++;
                                                buttonEventHandler(
                                                    currentIndex);
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
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
                                                      fontFamily:
                                                          kCircularStdNormal,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _categories.map((dept) {
                final isSelected = selectedSpecialization == dept.title;
                return GestureDetector(
                  onTap: () =>
                      toggleSelectioncategories(_categories.indexOf(dept)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: (Get.width - 50) / 2 - 10,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected ? kPrimaryColor : kDividerColor,
                        width: isSelected ? 2 : 1,
                      ),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isSelected ? kPrimaryColor : kDividerColor,
                          size: 18,
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            dept.title,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color:
                                  isSelected ? kPrimaryColor : Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            buildTextWidget("Enter Subspecialty"),
            if (subSpecializations[selectedSpecialization] != null)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    subSpecializations[selectedSpecialization]!.map((subSpec) {
                  final isSelected = selectedTitles.contains(subSpec);
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          toggleSelection(subSpec);
                        }, // You can add functionality here
                        child: Container(
                          width: Get.width - 55,
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected ? kPrimaryColor : kDividerColor,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              subSpec,
                              style: const TextStyle(
                                fontSize: 14,
                                color: kPrimaryColor,
                                fontFamily: kCircularStdBook,
                              ),
                              overflow: TextOverflow.ellipsis,
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
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  List<dynamic> placeList = [];
  void getSuggestion(String input) async {
    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&key=AIzaSyAQYUMPajZSmEupi3I7rsukQMSAZJmh-XA&sessiontoken=1234567890';
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        setState(() {
          placeList = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
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
          // SizedBox(
          //   width: Get.width - 50,
          //   child: CustomTextFormFieldAuth(
          //     hintText: 'Address',
          //     maxLines: 1,
          //     ctrl: addressController,
          //     name: "address",
          //     formSubmitted: isFormSubmitted,
          //     validationMsg: 'Please enter Address',
          //   ),
          // ),
          TextFormField(
            // validator: (value) {
            //   if (isTouched && isFormSubmitted) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter Address';
            //     }
            //   }
            //   return null;
            // },
            focusNode: focusNode,
            controller: addressController,
            textInputAction: TextInputAction.next,
            onChanged: (value) => {
              isTouched = true,
              getSuggestion(addressController.text),
              if (addressController.text == "") {setState(() {})}
            },
            decoration: InputDecoration(
              hintText: "Address",
              counterText: "",
              contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              hintStyle: const TextStyle(
                fontFamily: kCircularStdBook,
                fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                fontSize: 14,
              ),
              filled: true,
              fillColor: kWhiteColor,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(color: kWhiteColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: kWhiteColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              height: placeList.isEmpty ? 0 : 200,
              width: placeList.isEmpty ? 0 : Get.width,
              color: kWhiteColor,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: placeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        addressController.text =
                            placeList[index]["description"];
                        focusNode.unfocus();
                        placeList.clear();
                      });
                    },
                    child: ListTile(
                      title: Text(placeList[index]["description"]),
                    ),
                  );
                },
              ),
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
              ctrl: categoryController,
              name: "name",
              onChanged: (value) {
                filterServices(value);
              },
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
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                final dept = filteredServices[index];
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

  Map<String, Map<String, String>> timeSlotss = {};
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
                bool isDaySelected = selectedDays.contains(day);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterChip(
                      label: Text(
                        day,
                        style: const TextStyle(color: kPrimaryColor),
                      ),
                      selectedColor: kWhiteColor,
                      selected: isDaySelected,
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedDays.add(day);
                            timeSlotss[day] = {"start": "", "end": ""};
                          } else {
                            selectedDays.remove(day);
                            timeSlots.remove(day);
                          }
                        });
                      },
                    ),
                    if (isDaySelected) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Start Time ($day)",
                                labelStyle: const TextStyle(fontSize: 12),
                              ),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  initialEntryMode:
                                      TimePickerEntryMode.inputOnly,
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    timeSlotss[day]!['start'] =
                                        pickedTime.format(context);
                                  });
                                }
                              },
                              controller: TextEditingController(
                                text: timeSlotss[day]!['start'],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "End Time ($day)",
                                labelStyle: const TextStyle(fontSize: 12),
                              ),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  initialEntryMode:
                                      TimePickerEntryMode.inputOnly,
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    timeSlotss[day]!['end'] =
                                        pickedTime.format(context);
                                  });
                                }
                              },
                              controller: TextEditingController(
                                text: timeSlotss[day]!['end'],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            buildTextWidget("Unavailable Dates"),
            Wrap(
              spacing: 8.0,
              children: unavailableDates.map((date) {
                return Chip(
                  label: Text("${date.day}/${date.month}/${date.year}"),
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
