import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:accordion/accordion.dart';
import 'package:zynabaiexpoders/app/routes/app_pages.dart';
import 'package:zynabaiexpoders/app/view/medications_view.dart';

import '../../view/allergies_view.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class MyHealthPage extends StatefulWidget {
  const MyHealthPage({super.key});

  @override
  State<MyHealthPage> createState() => _MyHealthPageState();
}

class _MyHealthPageState extends State<MyHealthPage> {
  FocusNode focusNode = FocusNode();
  var searchController = TextEditingController();
  bool isMedicalHistory = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        title: const Text(
          "My Health",
          style: TextStyle(
              color: kPrimaryColor,
              fontFamily: kCircularStdMedium,
              fontSize: 23),
        ),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(
              Icons.search,
              color: kPrimaryColor,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(
              Icons.filter_alt_rounded,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextFormField(
                  //   controller: searchController,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Search',
                  //     labelStyle: TextStyle(color: kPrimaryColor),
                  //     border: UnderlineInputBorder(
                  //       borderSide: BorderSide(
                  //         color: Color(0xFFACACAC),
                  //         width: 1,
                  //       ),
                  //     ),
                  //     enabledBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(
                  //         color: Color(0xFFACACAC),
                  //         width: 1,
                  //       ),
                  //     ),
                  //     focusedBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(
                  //         color: kWhiteColor,
                  //         width: 1,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Current Health",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 31,
                          width: 31,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(color: kPrimaryColor, width: 0.5)),
                          child: const Icon(
                            Icons.edit,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kCardColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Weight",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "70 Kg",
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 25),
                              Image.asset(
                                "assets/icons/line_vertical.png",
                                scale: 2,
                                color: kDividerColor,
                              ),
                              const SizedBox(width: 25),
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "BP",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "120/80 mmHg",
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Last Visit",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "12-Jul-2024",
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 25),
                              Image.asset(
                                "assets/icons/line_vertical.png",
                                scale: 2,
                                color: kDividerColor,
                              ),
                              const SizedBox(width: 25),
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Medications",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Height",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "170 cm",
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 25),
                              Image.asset(
                                "assets/icons/line_vertical.png",
                                scale: 2,
                                color: kDividerColor,
                              ),
                              const SizedBox(width: 25),
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Heart Rate",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "72 bpm",
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Temperature",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "36.8°C",
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 25),
                              Image.asset(
                                "assets/icons/line_vertical.png",
                                scale: 2,
                                color: kDividerColor,
                              ),
                              const SizedBox(width: 25),
                              const SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Oxygen Saturation",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kCircularStdNormal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Encounters",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: kSecondaryPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Accordion(
                    headerBorderColorOpened: kPrimaryColor,
                    headerBackgroundColor: kHighlightColor,
                    headerBackgroundColorOpened: kHighlightColor,
                    contentBackgroundColor: Colors.white,
                    contentBorderColor: kWhiteColor,
                    contentBorderWidth: 1,
                    contentHorizontalPadding: 8,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    disableScrolling: true,
                    headerPadding: const EdgeInsets.symmetric(vertical: 10),
                    children: [
                      AccordionSection(
                          isOpen: true,
                          contentVerticalPadding: 20,
                          header: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Encounter: 12-Jul-2024',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14)),
                                Text('Chief Complaint: Sore',
                                    style: TextStyle(
                                        color: kSecondaryPrimaryColor,
                                        fontFamily: kCircularStdNormal,
                                        fontSize: 11)),
                              ],
                            ),
                          ),
                          content: accordionDesign()
                          // content: const Text(
                          //     "Expandable Cards: Each encounter can be a card that expands on click to show detailed notes, diagnosis, treatment, and follow-up actions",
                          //     style: TextStyle(
                          //         color: kPrimaryColor,
                          //         fontSize: 11,
                          //         fontFamily: kCircularStdNormal)),
                          ),
                      AccordionSection(
                        isOpen: false,
                        contentVerticalPadding: 20,
                        header: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Encounter: 01-Jun-2024',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 14),
                              ),
                              Text(
                                'Chief Complaint: Headache',
                                style: TextStyle(
                                    color: kSecondaryPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        content: accordionDesign(),
                      ),
                      AccordionSection(
                        isOpen: false,
                        contentVerticalPadding: 20,
                        header: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Encounter: 01-Jun-2024',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 14),
                              ),
                              Text(
                                'Chief Complaint: Headache',
                                style: TextStyle(
                                    color: kSecondaryPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        content: accordionDesign(),
                      ),
                    ],
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Medical History",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: kSecondaryPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Accordion(
                    headerBorderColorOpened: kPrimaryColor,
                    headerBackgroundColor: kHighlightColor,
                    headerBackgroundColorOpened: kHighlightColor,
                    contentBackgroundColor: Colors.white,
                    contentBorderColor: kWhiteColor,
                    contentBorderWidth: 1,
                    contentHorizontalPadding: 8,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    disableScrolling: true,
                    headerPadding: const EdgeInsets.symmetric(vertical: 10),
                    children: [
                      AccordionSection(
                        isOpen: true,
                        contentVerticalPadding: 20,
                        header: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Personal History',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                        content: medicalHistory("Personal History"),
                      ),
                      AccordionSection(
                          isOpen: true,
                          contentVerticalPadding: 20,
                          header: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Family History',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                          content: medicalHistory("Family History")),
                    ],
                  ),

                  Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       "Encounters",
                      //       style: TextStyle(
                      //           color: kPrimaryColor,
                      //           fontFamily: kCircularStdNormal,
                      //           fontSize: 16),
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Container(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 6, vertical: 4),
                      //         decoration: BoxDecoration(
                      //             border: Border.all(
                      //                 color: kPrimaryColor, width: 1),
                      //             borderRadius: BorderRadius.circular(25)),
                      //         child: const Text(
                      //           "View All",
                      //           style: TextStyle(
                      //               color: kPrimaryColor, fontSize: 12),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // const SizedBox(height: 7),
                      // SingleChildScrollView(
                      //   physics: const BouncingScrollPhysics(
                      //       parent: AlwaysScrollableScrollPhysics()),
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       buildNearby(
                      //           "Dr. Pooja\nPatel",
                      //           "assets/icons/h1.png",
                      //           "4.5",
                      //           "Dentist / 2+ yrs"),
                      //       buildNearby(
                      //           "Dr. Aryaa\nPatel",
                      //           "assets/icons/h3.png",
                      //           "4.8",
                      //           "Surgeons / 8+ yrs"),
                      //       buildNearby(
                      //           "Dr. Aryaa\nPatel",
                      //           "assets/icons/h5.png",
                      //           "4.8",
                      //           "Surgeons / 8+ yrs")
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Medications",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.medicationsListPage);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kPrimaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        height: 190,
                        child: MedicationsView(),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Immunizations",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kPrimaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildNearby(
                                "Polio",
                                "assets/images/polio.png",
                                "",
                                "virus that mainly affects nerves in the spinal cord or brain stem\n",
                                ""),
                            buildNearby(
                                "Skin\nAllergy",
                                "assets/images/SkinAllergy.png",
                                "",
                                "allergist can diagnose and treat your condition, so you can live life to the fullest",
                                ""),
                            buildNearby(
                                "HIV",
                                "assets/images/HIV.png",
                                "",
                                "making a person more vulnerable to other infections and diseases.\n",
                                "")
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Lab Results",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kPrimaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildNearby("Blood urea\nnitrogen", "", "",
                                "40–70 μg/dL", ""),
                            buildNearby("Ammonia\n", "", "", "25–43 mg/dL", ""),
                            buildNearby(
                                "Ceruloplasmin\n", "", "", "0.8-1.3 mg/dL", "")
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Allergies",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.allergiesListPage);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      const SizedBox(
                        height: 240,
                        child: AllergiesView(),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Conditions",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildNearby("Addison’s disease", "", "",
                                "Low blood pressure, even fainting", ""),
                            buildNearby("Norovirus", "", "",
                                "Diarrhea, vomiting, nausea, stomach pain", ""),
                            buildNearby("Kidney cancer", "", "",
                                "plenty of fruit and vegetables", "")
                          ],
                        ),
                      ),
                      const SizedBox(height: 85)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildNearby(String text, image, review, year, String? label) {
    Size size = MediaQuery.of(context).size;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // Get.to(
        //         () => DoctoreDetailsPage(
        //           name: text,
        //           year: year,
        //           image: image,
        //         ),
        //       );
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
                image == ""
                    ? Container()
                    : label == "Medications" || label == "Medications1"
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                label == "Medications1" ? "Inactive" : "Active",
                                style: TextStyle(
                                    color: label == "Medications1"
                                        ? kRedAccentColor
                                        : kGreenColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 12),
                              )
                            ],
                          )
                        : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                SizedBox(height: image == "" ? 0 : 10),
                Text(
                  text,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdMedium,
                      fontSize: 16),
                ),
                label == "Medications" || label == "Medications1"
                    ? Text(
                        label != "Medications1"
                            ? "07 jan 2024 - 10 dec 2024"
                            : "10 feb 2024 - 07 july 2024",
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 10),
                      )
                    : Container(),
                // label == "Medications" || label == "Medications1"?
                // const Text(
                //   "End Date: 07 july 2024",
                //   style: TextStyle(
                //       color: kPrimaryColor,
                //       fontFamily: kCircularStdMedium,
                //       fontSize: 10),
                // ):Container(),
                SizedBox(height: year == "" ? 0 : 10),
                Text(
                  year,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 12),
                ),
                const SizedBox(height: 10),
                review == ""
                    ? Container()
                    : Row(
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
      ),
    );
  }

  buildMedical(String text) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: const TextStyle(
                color: kPrimaryColor,
                fontFamily: kCircularStdNormal,
                fontSize: 15),
          ),
        ),
        Positioned(
          right: 0,
          top: -2,
          child: Container(
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(25)),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 15,
            ),
          ),
        )
      ],
    );
  }

  accordionDesign() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(height: 10),
        // Container(
        //   height: 50,
        //   width: 50,
        //   decoration: BoxDecoration(
        //       color: kWhiteColor,
        //       borderRadius: BorderRadius.circular(35)),
        //   child: Image.asset("assets/icons/h4.png"),
        // ),
        // const SizedBox(
        //   height: 25,
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(left: 20),
        //   child: Text(
        //     "Your Notes:",
        //     style: TextStyle(
        //         color: kPrimaryColor,
        //         fontFamily: kCircularStdMedium,
        //         fontSize: 22),
        //   ),
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: kHighlightColor,
                  borderRadius: BorderRadius.circular(25)),
              child: const Center(
                  child: Text(
                "01",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 14),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 150,
                  width: 2,
                  decoration: BoxDecoration(
                      border: Border.all(color: kHighlightColor, width: 0.8)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 65,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "DOCTOR",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 3.0),
                      child: Text(
                        "Chief Complaint",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 65,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "PATIENT",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const SizedBox(
                      width: 260,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.0),
                        child: Text(
                          "I’ve had a sore throat and runny nose for the past three days.",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: kHighlightColor,
                  borderRadius: BorderRadius.circular(25)),
              child: const Center(
                  child: Text(
                "02",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 14),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 130,
                  width: 2,
                  decoration: BoxDecoration(
                      border: Border.all(color: kHighlightColor, width: 0.8)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 65,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "DOCTOR",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 3.0),
                      child: Text(
                        "History of Present Illness",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 65,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "PATIENT",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const SizedBox(
                      width: 270,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.0),
                        child: Text(
                          "The sore throat started first, feels scratchy and painful, especially when swallowing",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: kHighlightColor,
                  borderRadius: BorderRadius.circular(25)),
              child: const Center(
                  child: Text(
                "03",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 14),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 130,
                  width: 2,
                  decoration: BoxDecoration(
                      border: Border.all(color: kHighlightColor, width: 0.8)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 65,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "DOCTOR",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 3.0),
                      child: Text(
                        "Past Medical History",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdMedium,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 65,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "PATIENT",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const SizedBox(
                      width: 260,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.0),
                        child: Text(
                          "Generally healthy, no major illnesses or surgeries",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: kCircularStdNormal,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 12.0),
        //   child: Row(
        //     children: [
        //       Container(
        //         height: 45,
        //         width: 45,
        //         padding: const EdgeInsets.all(18),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(25),
        //             border: Border.all(width: 1, color: kWhiteColor)),
        //         child: Container(
        //           width: 5,
        //           height: 5,
        //           decoration: BoxDecoration(
        //               color: kHighlightColor,
        //               borderRadius: BorderRadius.circular(25)),
        //         ),
        //       ),
        //       const SizedBox(width: 10),
        //       const Text(
        //         "Tap to start adding more notes",
        //         style: TextStyle(
        //             color: kWhiteColor,
        //             fontFamily: kCircularStdNormal,
        //             fontSize: 13),
        //       ),
        //     ],
        //   ),
        // ),
        //  const SizedBox(
        //    height: 10,
        //  ),
        //  Center(
        //    child: SizedBox(
        //      width: Get.width - 100,
        //      child: CupertinoButton(
        //        color: kHighlightColor,
        //        borderRadius: BorderRadius.circular(25),
        //        child: Row(
        //          mainAxisAlignment: MainAxisAlignment.center,
        //          children: [
        //            const Text(
        //              "ADD TO PROFILE",
        //              style: TextStyle(
        //                  color: kPrimaryColor,
        //                  fontFamily: kCircularStdMedium,
        //                  fontSize: 13),
        //            ),
        //            const SizedBox(width: 10),
        //            Image.asset(
        //              "assets/icons/arrow_right.png",
        //              color: kPrimaryColor,
        //              scale: 1.3,
        //            )
        //          ],
        //        ),
        //        onPressed: () {
        //          // Get.toNamed(Routes.appointmentScheduledPage);
        //        },
        //      ),
        //    ),
        //  ),
        // const SizedBox(height: 90)
      ],
    );
  }

  medicalHistory(String historyType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: historyType == "Personal History"
              ? [
                  buildMedical("Diabetes"),
                  const SizedBox(width: 10),
                  buildMedical("Hypertension"),
                ]
              : [
                  buildMedical("Diabetes"),
                  const SizedBox(width: 10),
                  buildMedical("Cancer"),
                ],
        ),
      ],
    );
  }

  // medicalHistory(String historyType) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const SizedBox(height: 10),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 5.0),
  //         child: Text(
  //           historyType,
  //           style: const TextStyle(
  //               color: kPrimaryColor,
  //               fontFamily: kCircularStdNormal,
  //               fontSize: 19),
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       Row(
  //         children: historyType == "Personal History"
  //             ? [
  //                 buildMedical("Diabetes"),
  //                 const SizedBox(width: 10),
  //                 buildMedical("Hypertension"),
  //               ]
  //             : [
  //                 buildMedical("Diabetes"),
  //                 const SizedBox(width: 10),
  //                 buildMedical("Cancer"),
  //               ],
  //       ),
  //     ],
  //   );
  // }
}
