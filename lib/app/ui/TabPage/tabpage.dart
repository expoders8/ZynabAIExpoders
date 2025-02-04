import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../MyHelth/myhealth.dart';
import '../home/home.dart';
import '../Profile/profile.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/constant.dart';
import '../MyAppointments/my_appointments.dart';
import '../ChatWithPatients/chat_with_patients.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';
import '../FIneDoctorsNearby/fine_doctors_nearby.dart';

class TabPage extends StatefulWidget {
  final String? screenDef;
  final int? selectedTabIndex;
  const TabPage({super.key, this.screenDef, this.selectedTabIndex = 0});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with WidgetsBindingObserver {
  final controller = Get.put(TabCountController());
  String authToken = "", selectedPerson = "";
  bool _isKeyboardVisible = false;

  int accessLevel = 1;

  @override
  void initState() {
    controller.changeTabIndex(widget.selectedTabIndex!.toInt());
    var person = getStorage.read("selctetperson") ?? "";
    setState(() {
      selectedPerson = person;
    });
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _isKeyboardVisible = bottomInset > 0;
    });
  }

  final TextStyle unselectedLabelStyle = const TextStyle(
      color: kIconColor,
      fontWeight: FontWeight.w500,
      fontSize: 11,
      fontFamily: kCircularStdNormal);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: kSelectedTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 11,
      fontFamily: kCircularStdNormal);

  @override
  Widget build(BuildContext context) {
    final TabCountController tabCountController =
        Get.put(TabCountController(), permanent: false);

    return GetBuilder<TabCountController>(
      builder: (context) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: [
                IndexedStack(
                  index: tabCountController.tabIndex.value,
                  children: [
                    const HomePage(),
                    const ChatWithPatientsPage(),
                    const FindDoctorNearbyPage(),
                    selectedPerson == "Doctor"
                        ? const MyAppointmentsPage()
                        : const MyHealthPage(),
                    const ProfilePage(),
                  ],
                ),
                !_isKeyboardVisible
                    ? Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            margin:
                                EdgeInsets.only(top: Platform.isIOS ? 8 : 0),
                            height: Platform.isIOS ? 100 : 68,
                            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: kHighlightColor),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 15),
                                    buildBottomTab(
                                        0, "Home", "assets/icons/home.png"),
                                    const SizedBox(width: 15),
                                    buildBottomTab(
                                        1, "Chat", "assets/icons/comment.png"),
                                    const SizedBox(width: 15),
                                    selectedPerson == "Doctor"
                                        ? buildBottomTab(2, "Patients",
                                            "assets/icons/person_plus.png")
                                        : buildBottomTab(2, "Doctors",
                                            "assets/icons/person_plus.png"),
                                    const SizedBox(width: 15),
                                    selectedPerson == "Doctor"
                                        ? buildBottomTab(
                                            3, "Appts", "assets/icons/hart.png")
                                        : buildBottomTab(3, "My Health",
                                            "assets/icons/hart.png"),
                                    const SizedBox(width: 15),
                                    buildBottomTab(
                                        4, "Profile", "assets/icons/User.png"),
                                    const SizedBox(width: 15),
                                  ],
                                )
                                // BottomNavigationBar(
                                //   onTap: ((value) {
                                //     tabCountController.changeTabIndex(value);
                                //     if (widget.screenDef == "Details") {
                                //       Get.offAll(
                                //         () => TabPage(
                                //           screenDef: "Home",
                                //           selectedTabIndex: value,
                                //         ),
                                //       );
                                //     }
                                //   }),
                                //   currentIndex: tabCountController.tabIndex.value,
                                //   backgroundColor: kHighlightColor,
                                //   unselectedItemColor: kIconColor,
                                //   selectedItemColor: kSelectedIconColor,
                                //   unselectedLabelStyle: unselectedLabelStyle,
                                //   selectedLabelStyle: selectedLabelStyle,
                                //   type: BottomNavigationBarType.fixed,
                                //   items: [
                                //     BottomNavigationBarItem(
                                //       icon: Padding(
                                //         padding:
                                //             const EdgeInsets.only(bottom: 7.0, top: 2),
                                //         child: Image.asset(
                                //           "assets/icons/home.png",
                                //           color: tabCountController.tabIndex.value == 0
                                //               ? kSelectedIconColor
                                //               : kIconColor,
                                //           scale: 1.5,
                                //         ),
                                //       ),
                                //       label: 'Home',
                                //       backgroundColor: kBackGroundColor,
                                //     ),
                                //     BottomNavigationBarItem(
                                //       icon: Padding(
                                //         padding:
                                //             const EdgeInsets.only(bottom: 9.0, top: 4),
                                //         child: Image.asset(
                                //           "assets/icons/comment.png",
                                //           color: tabCountController.tabIndex.value == 0
                                //               ? kSelectedIconColor
                                //               : kIconColor,
                                //           scale: 1.5,
                                //         ),
                                //       ),
                                //       label: 'Chat',
                                //       backgroundColor: kBackGroundColor,
                                //     ),
                                //     BottomNavigationBarItem(
                                //       icon: Padding(
                                //         padding:
                                //             const EdgeInsets.only(bottom: 7.0, top: 2),
                                //         child: Image.asset(
                                //           "assets/icons/person_plus.png",
                                //           color: tabCountController.tabIndex.value == 0
                                //               ? kSelectedIconColor
                                //               : kIconColor,
                                //           scale: 1.7,
                                //         ),
                                //       ),
                                //       label: 'Doctors',
                                //       backgroundColor: kBackGroundColor,
                                //     ),
                                //     BottomNavigationBarItem(
                                //       icon: Padding(
                                //         padding:
                                //             const EdgeInsets.only(bottom: 7.0, top: 2),
                                //         child: Image.asset(
                                //           "assets/icons/hart.png",
                                //           color: tabCountController.tabIndex.value == 0
                                //               ? kSelectedIconColor
                                //               : kIconColor,
                                //           scale: 1.7,
                                //         ),
                                //       ),
                                //       label: 'My Health',
                                //     ),
                                //     BottomNavigationBarItem(
                                //       icon: Padding(
                                //           padding: const EdgeInsets.only(
                                //               bottom: 7.0, top: 3),
                                //           child: Image.asset(
                                //             "assets/icons/User.png",
                                //             color:
                                //                 tabCountController.tabIndex.value == 0
                                //                     ? kSelectedIconColor
                                //                     : kIconColor,
                                //             scale: 1.7,
                                //           )),
                                //       label: 'Profile',
                                //       backgroundColor: kBackGroundColor,
                                //     ),
                                //   ],
                                // ),
                                ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }

  buildBottomTab(int index, String title, String image) {
    final TabCountController tabCountController =
        Get.put(TabCountController(), permanent: false);
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        tabCountController.changeTabIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 34,
            child: Image.asset(
              image,
              color: kPrimaryColor,
              scale: 1.5,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                letterSpacing: 0.3,
                color: tabCountController.tabIndex.value == index
                    ? kSelectedIconColor
                    : kIconColor,
                fontSize: 11.4,
                fontFamily: kCircularStdMedium),
          )
        ],
      ),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          margin: EdgeInsets.only(top: Platform.isIOS ? 8 : 0),
          height: Platform.isIOS ? 100 : 68,
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              elevation: 1,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: ((value) {
                landingPageController.changeTabIndex(value);
                if (widget.screenDef == "Details") {
                  Get.offAll(
                    () => TabPage(
                      screenDef: "Home",
                      selectedTabIndex: value,
                    ),
                  );
                }
              }),
              currentIndex: landingPageController.tabIndex.value,
              backgroundColor: kHighlightColor,
              unselectedItemColor: kIconColor,
              selectedItemColor: kSelectedIconColor,
              unselectedLabelStyle: unselectedLabelStyle,
              selectedLabelStyle: selectedLabelStyle,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 7.0, top: 2),
                    child: Image.asset(
                      "assets/icons/home.png",
                      color: landingPageController.tabIndex.value == 0
                          ? kSelectedIconColor
                          : kIconColor,
                      scale: 1.5,
                    ),
                  ),
                  label: 'Home',
                  backgroundColor: kBackGroundColor,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 9.0, top: 4),
                    child: Image.asset(
                      "assets/icons/comment.png",
                      color: landingPageController.tabIndex.value == 0
                          ? kSelectedIconColor
                          : kIconColor,
                      scale: 1.5,
                    ),
                  ),
                  label: 'Chat',
                  backgroundColor: kBackGroundColor,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 7.0, top: 2),
                    child: Image.asset(
                      "assets/icons/person_plus.png",
                      color: landingPageController.tabIndex.value == 0
                          ? kSelectedIconColor
                          : kIconColor,
                      scale: 1.7,
                    ),
                  ),
                  label: selectedPerson == "Doctor" ? 'Doctors' : 'Patient',
                  backgroundColor: kBackGroundColor,
                ),
                selectedPerson == "Doctor"
                    ? BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 7.0, top: 2),
                          child: Image.asset(
                            "assets/icons/hart.png",
                            color: landingPageController.tabIndex.value == 0
                                ? kSelectedIconColor
                                : kIconColor,
                            scale: 1.7,
                          ),
                        ),
                        label: 'My Appointments',
                      )
                    : BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 7.0, top: 2),
                          child: Image.asset(
                            "assets/icons/hart.png",
                            color: landingPageController.tabIndex.value == 0
                                ? kSelectedIconColor
                                : kIconColor,
                            scale: 1.7,
                          ),
                        ),
                        label: 'My dddddd',
                      ),
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 7.0, top: 3),
                      child: Image.asset(
                        "assets/icons/User.png",
                        color: landingPageController.tabIndex.value == 0
                            ? kSelectedIconColor
                            : kIconColor,
                        scale: 1.7,
                      )),
                  label: 'Profile',
                  backgroundColor: kBackGroundColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
