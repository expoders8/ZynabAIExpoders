import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../DoctorDetails/doctor_details.dart';
import '../../models/transection_list_model.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class GeneralPhysicianPage extends StatefulWidget {
  final String? title;
  const GeneralPhysicianPage({super.key, this.title});

  @override
  State<GeneralPhysicianPage> createState() => _GeneralPhysicianPageState();
}

class _GeneralPhysicianPageState extends State<GeneralPhysicianPage> {
  FocusNode focusNode = FocusNode();
  var searchController = TextEditingController();
  int selectedIndex = 0;
  List<Transaction> mobileNo = [
    Transaction(
      image: "assets/icons/doctor1.png",
      name: "Dr. Pooja Patel",
      dateTime: "11 Oct 2024",
      money: "+\$409",
      number: "Physician / 2+ yrs",
    ),
    Transaction(
      image: "assets/icons/doctor2.png",
      name: "Dr. Aryaa Patel",
      dateTime: "11 Oct 2024",
      money: "-\$409",
      number: "Physician / 2+ yrs",
    ),
    Transaction(
      image: "assets/icons/doctor3.png",
      name: "Ch Vincent",
      dateTime: "11 Oct 2024",
      money: "-\$60",
      number: "Surgeons / 8+ yrs",
    ),
    Transaction(
      image: "assets/icons/doctor4.png",
      name: "Dr. Ch Vincent",
      dateTime: "11 Oct 2024",
      money: "+\$202",
      number: "Dentist / 2+ yrs",
    ),
    Transaction(
      image: "assets/icons/doctor5.png",
      name: "Dr. Isabella",
      dateTime: "11 Oct 2024",
      money: "+\$409",
      number: "Surgeons / 8+ yrs",
    ),
    Transaction(
      image: "assets/icons/h3.png",
      name: "Dr. Nicholas",
      dateTime: "11 Oct 2024",
      money: "-\$409",
      number: "Physician / 2+ yrs",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        leading: CupertinoButton(
          padding: const EdgeInsets.all(9),
          onPressed: () {
            Get.back();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: kWhiteColor),
            child: Image.asset(
              "assets/icons/arrow_left.png",
              scale: 1.5,
            ),
          ),
        ),
        title: const Text(
          "",
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontFamily: kCircularStdMedium),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                widget.title!,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontFamily: kCircularStdMedium,
                    fontSize: 25),
              ),
              const SizedBox(height: 5),
              TypeAheadField<Transaction>(
                debounceDuration: const Duration(microseconds: 10),
                hideSuggestionsOnKeyboardHide: true,
                suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(9.0),
                  ),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  controller: searchController,
                  keyboardType: TextInputType.name,
                  textInputAction: Platform.isAndroid
                      ? TextInputAction.none
                      : TextInputAction.unspecified,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 1,
                      ),
                    ),
                    hintText: 'search',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                      fontSize: 16,
                    ),
                    hintMaxLines: 1,
                    contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 14),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                    fontSize: 14,
                  ),
                  onSubmitted: (value) {},
                  autocorrect: true,
                  cursorColor: kPrimaryColor,
                ),
                suggestionsCallback: (String pattern) async {
                  var filteredTransactions = mobileNo
                      .where((txn) => txn.name
                          .toLowerCase()
                          .contains(pattern.toLowerCase()))
                      .toList();

                  return filteredTransactions;
                },
                itemBuilder: (context, Transaction suggestion) {
                  return ListTile(
                    leading: Image.asset(
                      suggestion.image,
                      height: 40,
                      width: 40,
                    ),
                    title: Text(
                      suggestion.name,
                      style: const TextStyle(color: kPrimaryColor),
                    ),
                    subtitle: Text(
                      suggestion.number,
                      style: const TextStyle(color: kGreyColor),
                    ),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (suggestion) {
                  searchController.text = suggestion.number;
                  Get.to(
                    () => DoctoreDetailsPage(
                      name: suggestion.name,
                      year: suggestion.number,
                    ),
                  );
                  searchController.clear();
                },
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildNearby("Dr. Pooja\nPatel", "assets/icons/h1.png",
                              "4.5", "Physician / 2+ yrs"),
                          const SizedBox(width: 5),
                          buildNearby("Dr. Aryaa\nPatel", "assets/icons/h3.png",
                              "4.8", "Surgeons / 8+ yrs"),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildNearby(String text, image, review, year) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Get.to(
          () => DoctoreDetailsPage(
            name: text,
            year: year,
          ),
        );
      },
      child: Card(
        shadowColor: const Color.fromARGB(10, 0, 0, 0),
        elevation: 5,
        child: Container(
            width: Get.width / 2.3,
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
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset(
                    image,
                    scale: 1.5,
                  ),
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
      ),
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
