import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zynabaiexpoders/app/ui/Profile/account/account.dart';
import 'package:zynabaiexpoders/app/ui/subscriptionplan/subscription_plan.dart';

import '../../../config/provider/progress.dart';
import '../../routes/app_pages.dart';
import '../Auth/Login/login_doctor.dart';
import '../../../config/constant/constant.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../Auth/user_profile_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectAsstenIndex = 0;
  String selectedPerson = "";
  @override
  void initState() {
    var person = getStorage.read("selctetperson") ?? "Doctor";
    setState(() {
      selectedPerson = person;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: kHighlightColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "Ai",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: kCircularStdMedium,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "About\nYourself",
                                  style: TextStyle(
                                      color: kSecondaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(
                              width: 160,
                              child: Text(
                                "Amelia\nKimani",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: kCircularStdMedium,
                                    fontSize: 25),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/blank_profile.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Positioned(
                                bottom: 5,
                                left: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => UserProfileInformationPage(
                                          roll: selectedPerson,
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                    // IconButton(
                                    //   padding: EdgeInsets.zero,
                                    //   onPressed: () {

                                    //   },
                                    //   icon:
                                    // ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          width: 90,
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(25),
                            padding: EdgeInsets.zero,
                            color: kPrimaryColor,
                            onPressed: logoutConfirmationDialog,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: kWhiteColor,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "LogOut",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontFamily: kCircularStdNormal,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const CustomProfileProgress(completionPercentage: 68.0),
              const SizedBox(height: 8),
              selectedPerson == "Doctor"
                  ? const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Main Specialization",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 19),
                      ),
                    )
                  : Container(),
              SizedBox(height: selectedPerson == "Doctor" ? 10 : 0),
              selectedPerson == "Doctor"
                  ? Row(
                      children: [
                        buildSicknessWidget("Family Medicine"),
                      ],
                    )
                  : Container(),
              SizedBox(height: selectedPerson == "Doctor" ? 10 : 0),
              selectedPerson == "Doctor"
                  ? const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Sub-Specializations",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 19),
                      ),
                    )
                  : Container(),
              SizedBox(height: selectedPerson == "Doctor" ? 10 : 0),
              selectedPerson == "Doctor"
                  ? Row(
                      children: [
                        buildSicknessWidget("Geriatric Medicine"),
                        const SizedBox(width: 2),
                        buildSicknessWidget("Adolescent Medicine"),
                      ],
                    )
                  : Container(),
              SizedBox(height: selectedPerson == "Doctor" ? 10 : 0),
              selectedPerson == "Doctor"
                  ? const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Services",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kCircularStdNormal,
                            fontSize: 19),
                      ),
                    )
                  : Container(),
              selectedPerson == "Doctor"
                  ? Card(
                      shadowColor: const Color.fromARGB(10, 0, 0, 0),
                      elevation: 5,
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: kCardColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: kPrimaryColor,
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "General health check-ups",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: kPrimaryColor,
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Vaccinations",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: kPrimaryColor,
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Management of chronic conditions\n(diabetes, hypertension)",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontFamily: kCircularStdMedium,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(height: selectedPerson == "Doctor" ? 15 : 10),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Contact Details",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 19),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                shadowColor: const Color.fromARGB(10, 0, 0, 0),
                elevation: 5,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "E",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "johnddoe@gmail.com",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "M",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "+91738475655",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "L",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "234 Block, Mumbai Complex, India",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Details",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 19),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                shadowColor: const Color.fromARGB(10, 0, 0, 0),
                elevation: 5,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "B",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "20 Nov 1978",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "G",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Male",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "H",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Height : 4.7 feet",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: kHighlightColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  "W",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: kCircularStdMedium,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Weight : 60 Kg",
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontFamily: kCircularStdMedium,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              selectedPerson == "Doctor"
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Medical",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: kCircularStdNormal,
                                fontSize: 19),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Card(
                          shadowColor: const Color.fromARGB(10, 0, 0, 0),
                          elevation: 5,
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: kCardColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: kHighlightColor,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: const Center(
                                          child: Text(
                                            "M",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontFamily: kCircularStdMedium,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        "Medical History : Diabetes",
                                        style: TextStyle(
                                            color: kSecondaryColor,
                                            fontFamily: kCircularStdMedium,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: kHighlightColor,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: const Center(
                                          child: Text(
                                            "F",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontFamily: kCircularStdMedium,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        "Family History : Cancer",
                                        style: TextStyle(
                                            color: kSecondaryColor,
                                            fontFamily: kCircularStdMedium,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 10),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  var url = "https://www.zaynab.ai/privacy";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.security,
                            size: 18,
                            color: kButtonColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Privacy and Security",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontFamily: kCircularStdMedium),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: kButtonColor,
                      ),
                    ],
                  ),
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  var url = "https://www.zaynab.ai/terms";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.security,
                            size: 18,
                            color: kButtonColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Terms and conditions",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontFamily: kCircularStdMedium),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: kButtonColor,
                      ),
                    ],
                  ),
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  Get.to(() => const SubscriptionPage());
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.workspace_premium_sharp,
                            size: 18,
                            color: kButtonColor,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Subscription Plan (Free)",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: kButtonColor,
                      ),
                    ],
                  ),
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  Get.to(() => const AccountPage());
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.key,
                            size: 18,
                            color: kButtonColor,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Account",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    fontFamily: kCircularStdMedium),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: kButtonColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 85)
            ],
          ),
        ),
      ),
    );
  }

  logoutConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 18, color: kRedColor),
        content: const Text("Are you sure want to logout?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Get.back();
              Get.offAll(const LoginDoctorPage());
            },
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'No',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  buildSicknessWidget(String text) {
    return text == "plus"
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.toNamed(Routes.multipalSicknessPage);
            },
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryColor),
                  child: Image.asset(
                    "assets/icons/plus.png",
                    scale: 1.5,
                    color: kWhiteColor,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  "23 sickness",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: kCircularStdNormal,
                      fontSize: 15),
                )
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
            child: Text(
              text,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontFamily: kCircularStdNormal,
                  fontSize: 15),
            ),
          );
  }
}
