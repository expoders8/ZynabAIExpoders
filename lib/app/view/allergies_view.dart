import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/constant/color_constant.dart';
import '../../config/constant/font_constant.dart';
import '../models/allergies_model.dart';

class AllergiesView extends StatefulWidget {
  const AllergiesView({super.key});

  @override
  State<AllergiesView> createState() => _AllergiesViewState();
}

class _AllergiesViewState extends State<AllergiesView> {
  List<AllergiesModel> allergieslist = [
    AllergiesModel(
      image: "assets/icons/h1.png",
      title: "Dr. Pooja\nPatel",
      decription: "Dentist / 2+ yrs",
      reviews: "+\$409",
      ratting: "4.5",
    ),
    AllergiesModel(
      image: "assets/icons/h1.png",
      title: "Dr. Pooja\nPatel",
      decription: "Dentist / 2+ yrs",
      reviews: "+\$409",
      ratting: "4.5",
    ),
    AllergiesModel(
      image: "assets/icons/h1.png",
      title: "Dr. Pooja\nPatel",
      decription: "Dentist / 2+ yrs",
      reviews: "+\$409",
      ratting: "4.5",
    ),
    AllergiesModel(
      image: "assets/icons/h1.png",
      title: "Dr. Pooja\nPatel",
      decription: "Dentist / 2+ yrs",
      reviews: "+\$409",
      ratting: "4.5",
    ),
    AllergiesModel(
      image: "assets/icons/h1.png",
      title: "Dr. Pooja\nPatel",
      decription: "Dentist / 2+ yrs",
      reviews: "+\$409",
      ratting: "4.5",
    ),
    AllergiesModel(
      image: "assets/icons/h1.png",
      title: "Dr. Pooja\nPatel",
      decription: "Dentist / 2+ yrs",
      reviews: "+\$409",
      ratting: "4.5",
    ),
    AllergiesModel(
      image: "assets/icons/h1.png",
      title: "Dr. Pooja\nPatel",
      decription: "Dentist / 2+ yrs",
      reviews: "+\$409",
      ratting: "4.5",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230,
        child: allergieslist.isEmpty
            ? Center(
                child: SizedBox(
                  width: Get.width - 80,
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
                scrollDirection: Axis.horizontal,
                itemCount: allergieslist.length,
                itemBuilder: (context, index) {
                  var discoverData = allergieslist[index];

                  var data = discoverData;
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Card(
                      shadowColor: const Color.fromARGB(10, 0, 0, 0),
                      elevation: 5,
                      child: Container(
                          width: Get.width / 2.340,
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    data.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: data.image == "" ? 0 : 10),
                              Text(
                                data.title,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 16),
                              ),
                              SizedBox(height: data.decription == "" ? 0 : 10),
                              Text(
                                data.decription,
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdNormal,
                                    fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              data.reviews == ""
                                  ? Container()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 39,
                                          height: 39,
                                          decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: const Icon(
                                            Icons.arrow_right_alt_rounded,
                                            color: kWhiteColor,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              data.reviews,
                                              style: const TextStyle(
                                                  color: kPrimaryColor,
                                                  fontFamily:
                                                      kCircularStdMedium,
                                                  fontSize: 23),
                                            ),
                                            const Text(
                                              "212 Reviews",
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontFamily:
                                                      kCircularStdNormal,
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
                },
              ));
  }
}
