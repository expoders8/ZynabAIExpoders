import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class MyHealthPage extends StatefulWidget {
  const MyHealthPage({super.key});

  @override
  State<MyHealthPage> createState() => _MyHealthPageState();
}

class _MyHealthPageState extends State<MyHealthPage> {
  FocusNode focusNode = FocusNode();
  var searchController = TextEditingController();
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
                                border: Border.all(
                                    color: kPrimaryColor, width: 0.5)),
                            child: const Icon(
                              Icons.edit,
                              color: kPrimaryColor,
                              size: 18,
                            ),
                          ))
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Health History",
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
                        content: const Text(
                            "Expandable Cards: Each encounter can be a card that expands on click to show detailed notes, diagnosis, treatment, and follow-up actions",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 11,
                                fontFamily: kCircularStdNormal)),
                      ),
                      AccordionSection(
                        isOpen: false,
                        contentVerticalPadding: 20,
                        header: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Encounter: 01-Jun-2024',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 14)),
                              Text('Chief Complaint: Headache',
                                  style: TextStyle(
                                      color: kSecondaryPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 11)),
                            ],
                          ),
                        ),
                        content: const Text(
                            "Expandable Cards: Each encounter can be a card that expands on click to show detailed notes, diagnosis, treatment, and follow-up actions",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 11,
                                fontFamily: kCircularStdNormal)),
                      ),
                      AccordionSection(
                        isOpen: false,
                        contentVerticalPadding: 20,
                        header: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Encounter: 01-Jun-2024',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 14)),
                              Text('Chief Complaint: Headache',
                                  style: TextStyle(
                                      color: kSecondaryPrimaryColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 11)),
                            ],
                          ),
                        ),
                        content: const Text(
                            "Expandable Cards: Each encounter can be a card that expands on click to show detailed notes, diagnosis, treatment, and follow-up actions",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 11,
                                fontFamily: kCircularStdNormal)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Encounters",
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
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: Row(
                          children: [
                            buildNearby(
                                "Paracetamol",
                                "assets/images/Medications1.png",
                                "",
                                "medicine used to treat mild to moderate pain\n"),
                            buildNearby(
                                "DAN-P",
                                "assets/images/Medications2.png",
                                "",
                                "Dan-P Tablet is a pain-relieving medicine\n"),
                            buildNearby(
                                "Action 500",
                                "assets/images/Medications3.png",
                                "",
                                "Action 500 Advanced Having the common cold.")
                          ],
                        ),
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
                            buildNearby("Polio", "assets/images/polio.png", "",
                                "virus that mainly affects nerves in the spinal cord or brain stem\n"),
                            buildNearby(
                                "Skin Allergy",
                                "assets/images/SkinAllergy.png",
                                "",
                                "allergist can diagnose and treat your condition, so you can live life to the fullest"),
                            buildNearby("HIV", "assets/images/HIV.png", "",
                                "making a person more vulnerable to other infections and diseases.\n")
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
                            buildNearby(
                                "Blood urea nitrogen", "", "", "40–70 μg/dL"),
                            buildNearby("Ammonia\n", "", "", "25–43 mg/dL"),
                            buildNearby(
                                "Ceruloplasmin\n", "", "", "0.8-1.3 mg/dL")
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
                                "Eye Allergies",
                                "assets/images/eyseAllergies.png",
                                "4.5",
                                "the body’s immune system reacts to an allergen that is normally harmless"),
                            buildNearby(
                                "Asthma allergies",
                                "assets/images/Asthma allergies.png",
                                "4.8",
                                "like dust mites, pollen, animal dander or mold spores\n"),
                            buildNearby(
                                "Skin Allergy",
                                "assets/images/SkinAllergy.png",
                                "4.8",
                                "allergic reactions to a medication or a food. measles or chickenpox\n")
                          ],
                        ),
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
                            buildNearby("Addison’s disease", "", "",
                                "Low blood pressure, even fainting"),
                            buildNearby("Norovirus", "", "",
                                "Diarrhea, vomiting, nausea, stomach pain"),
                            buildNearby("Kidney cancer", "", "",
                                "plenty of fruit and vegetables")
                          ],
                        ),
                      ),
                      const SizedBox(height: 35)
                    ],
                  ),
                  const SizedBox(
                    height: 85,
                  )
                ],
              ),
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
}
