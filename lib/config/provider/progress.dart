import 'package:flutter/material.dart';

import '../constant/color_constant.dart';
import '../constant/font_constant.dart';

class CustomProfileProgress extends StatelessWidget {
  final double completionPercentage; // Example: 68.0 for 68%

  const CustomProfileProgress({super.key, required this.completionPercentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Profile Status : ",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontFamily: kCircularStdMedium,
              ),
            ),
            Text(
              "68%",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 22,
                fontFamily: kCircularStdMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.all(0.0),
          height: 12.0,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width *
                    (completionPercentage / 100),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
