import 'package:flutter/material.dart';

import '../models/allergies_model.dart';
import '../../config/constant/font_constant.dart';
import '../../config/constant/color_constant.dart';

class AllergiesView extends StatefulWidget {
  const AllergiesView({
    super.key,
  });

  @override
  State<AllergiesView> createState() => _AllergiesViewState();
}

class _AllergiesViewState extends State<AllergiesView> {
  List<AllergiesModel> allergieslist = [
    AllergiesModel(
      image: "assets/images/pollenallergy.png",
      title: "Pollen\nAllergy",
      decription: "Reaction to tree, grass, weed pollen.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: false,
    ),
    AllergiesModel(
      image: "assets/images/petallergy.png",
      title: "Pet\nAllergy",
      decription: "Reaction to proteins in animal skin and saliva.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: true,
    ),
    AllergiesModel(
      image: "assets/images/dustmiteallergy.png",
      title: "Dust Mite\nAllergy",
      decription: "Reaction to tiny house dust bugs.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: true,
    ),
    AllergiesModel(
      image: "assets/images/foodallergy.png",
      title: "Food\nAllergies",
      decription: "Reaction to peanuts, tree nuts, milk, fish.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: true,
    ),
    AllergiesModel(
      image: "assets/images/inspectstingallergy.png",
      title: "Insect Sting\nAllergy",
      decription: "Reaction to bee, wasp, fire ant stings.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: true,
    ),
    AllergiesModel(
      image: "assets/images/moldallergy.png",
      title: "Mold\nAllergy",
      decription: "Reaction to mold spores in damp areas.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: true,
    ),
    AllergiesModel(
      image: "assets/images/latexallergy.png",
      title: "Latex\nAllergy",
      decription: "Reaction to natural rubber latex proteins.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: true,
    ),
    AllergiesModel(
      image: "assets/images/medicationallergy.png",
      title: "Medication\nAllergy",
      decription: "Reaction to penicillin, aspirin, and others.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: false,
    ),
    AllergiesModel(
      image: "assets/images/fragranceallergy.png",
      title: "Fragrance\nAllergy",
      decription: "Reaction to chemicals in scented products.",
      reviews: "212 Reviews",
      ratting: "4.5",
      addallergies: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<AllergiesModel> filteredAllergiesList =
        allergieslist.where((allergy) => allergy.addallergies).toList();

    return SizedBox(
      height: 230,
      child: filteredAllergiesList.isEmpty
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
                var data = filteredAllergiesList[index];
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
                                        data.ratting,
                                        style: const TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdMedium,
                                            fontSize: 23),
                                      ),
                                      Text(
                                        data.reviews,
                                        style: const TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: kCircularStdNormal,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
