import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
import 'allergies_list.dart';

class MyAllAllergiesPage extends StatefulWidget {
  const MyAllAllergiesPage({super.key});

  @override
  State<MyAllAllergiesPage> createState() => _MyAllAllergiesPageState();
}

class _MyAllAllergiesPageState extends State<MyAllAllergiesPage> {
  FocusNode focusNode = FocusNode();
  var searchController = TextEditingController();
  int selectedIndex = 0;
  String searchTerm = "";

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchTerm = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchTerm = "";
    searchController.clear();
    super.dispose();
  }

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
          "Allergies",
          style: TextStyle(
              color: kPrimaryColor,
              fontFamily: kCircularStdMedium,
              fontSize: 23),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
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
            const SizedBox(height: 10),
            Expanded(
              child: AllergiesListView(
                view: 1,
                searchTerm: searchTerm,
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      )),
    );
  }
}
