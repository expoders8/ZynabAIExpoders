import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/constant/color_constant.dart';
import '../../config/constant/font_constant.dart';
import '../models/allergies_model.dart';
import '../models/medications_model.dart';

class MedicationsView extends StatefulWidget {
  const MedicationsView({
    super.key,
  });

  @override
  State<MedicationsView> createState() => _MedicationsViewState();
}

class _MedicationsViewState extends State<MedicationsView> {
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
    List<MedicationssModel> filteredAllergiesList =
        medicationslist.where((allergy) => allergy.addmedications).toList();
    return SizedBox(
      height: 230,
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
          : ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              itemCount: filteredAllergiesList.length,
              itemBuilder: (context, index) {
                var discoverData = filteredAllergiesList[index];

                var data = discoverData;
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
                                    data.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                data.badge,
                                style: TextStyle(
                                    color: data.badge == "Inactive"
                                        ? kRedColor
                                        : kGreenColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 12),
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
                          SizedBox(height: data.decription == "" ? 0 : 10),
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
              },
            ),
    );
  }
}
