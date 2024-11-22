import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../models/medications_model.dart';

class MedicationsListPage extends StatefulWidget {
  const MedicationsListPage({super.key});

  @override
  State<MedicationsListPage> createState() => _MedicationsListPageState();
}

class _MedicationsListPageState extends State<MedicationsListPage> {
  late List<bool> _isClicked;
  FocusNode focusNode = FocusNode();
  var searchController = TextEditingController();
  int selectedIndex = 0;
  String searchTerm = "";

  @override
  void initState() {
    super.initState();
    _isClicked = List<bool>.filled(medicationslist.length, false);

    searchController.addListener(() {
      setState(() {
        searchTerm = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchTerm = "";
    _isClicked = [];
    searchController.clear();
    super.dispose();
  }

  List<MedicationssModel> medicationslist = [
    MedicationssModel(
        image: "assets/images/Medications1.png",
        title: "Paracetamol",
        decription: "medicine used to treat mild to moderate pain\n",
        dates: "07 jan 2024 - 10 dec 2024",
        badge: "Active",
        addmedications: true),
    MedicationssModel(
        image: "assets/images/Medications2.png",
        title: "DAN-P",
        decription: "Dan-P Tablet is a pain-relieving medicine\n",
        dates: "10 feb 2024 - 07 july 2024",
        badge: "Inactive",
        addmedications: true),
    MedicationssModel(
        image: "assets/images/Medications3.png",
        title: "Action 500",
        decription: "Action 500 Advanced Having the common cold.",
        dates: "18 feb 2024 - 15 jun 2024",
        badge: "Inactive",
        addmedications: false),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<MedicationssModel> serachAllergiesList = medicationslist
        .where((allergy) =>
            allergy.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
            allergy.decription.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        leading: CupertinoButton(
          padding: const EdgeInsets.all(9),
          onPressed: () {
            Get.back();
          },
          child: Image.asset(
            "assets/icons/arrow_left.png",
            scale: 1.5,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
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
            SizedBox(height: 10),
            SizedBox(
              height: Get.height / 1.280,
              child: medicationslist.isEmpty
                  ? Center(
                      child: SizedBox(
                        width: size.width - 80,
                        child: const Text(
                          "No Allergies",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              fontFamily: kCircularStdMedium),
                        ),
                      ),
                    )
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: (size.width / 2.340) / 190,
                      ),
                      itemCount: serachAllergiesList.length,
                      itemBuilder: (context, index) {
                        var data = serachAllergiesList[index];
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
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: kWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.asset(
                                            data.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      data.addmedications == true
                                          ? GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _isClicked[index] =
                                                      !_isClicked[index];
                                                });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: _isClicked[index]
                                                        ? kBlackColor
                                                        : kWhiteColor),
                                                child: Image.asset(
                                                    _isClicked[index]
                                                        ? "assets/icons/plus.png"
                                                        : "assets/icons/des.png",
                                                    scale: 2,
                                                    color: _isClicked[index]
                                                        ? kWhiteColor
                                                        : kBlackColor),
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _isClicked[index] =
                                                      !_isClicked[index];
                                                });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: _isClicked[index]
                                                        ? kWhiteColor
                                                        : kBlackColor),
                                                child: Image.asset(
                                                  _isClicked[index]
                                                      ? "assets/icons/des.png"
                                                      : "assets/icons/plus.png",
                                                  scale: 1.9,
                                                  color: _isClicked[index]
                                                      ? kBlackColor
                                                      : kWhiteColor,
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                  SizedBox(height: data.image == "" ? 0 : 10),
                                  Text(
                                    data.title,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    data.dates,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 10),
                                  ),
                                  SizedBox(
                                      height: data.decription == "" ? 0 : 10),
                                  Text(
                                    data.decription,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: kCircularStdNormal,
                                        fontSize: 12),
                                  ),
                                ],
                              )),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
