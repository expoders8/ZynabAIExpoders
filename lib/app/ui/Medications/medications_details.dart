import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynabaiexpoders/app/view/medications_view.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../view/allergies_view.dart';
import 'medications_list.dart';

class MedicationsDetailsPage extends StatefulWidget {
  const MedicationsDetailsPage({super.key});

  @override
  State<MedicationsDetailsPage> createState() => _MedicationsDetailsPageState();
}

class _MedicationsDetailsPageState extends State<MedicationsDetailsPage> {
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
          "Medications",
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
              child: MedicationsListView(
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
