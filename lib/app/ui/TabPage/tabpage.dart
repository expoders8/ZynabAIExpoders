import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zynabaiexpoders/app/ui/chat.dart';
import 'package:zynabaiexpoders/app/ui/profil.dart';

import '../doctore.dart';
import '../helth.dart';
import '../home/home.dart';
import '../../controller/tab_controller.dart';
import '../../../config/constant/font_constant.dart';
import '../../../config/constant/color_constant.dart';

class TabPage extends StatefulWidget {
  final String? screenDef;
  final int? selectedTabIndex;
  const TabPage({super.key, this.screenDef, this.selectedTabIndex = 0});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final controller = Get.put(TabCountController());
  String authToken = "";
  int accessLevel = 1;
  @override
  void initState() {
    controller.changeTabIndex(widget.selectedTabIndex!.toInt());
    super.initState();
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
          // bottomNavigationBar:
          //     buildBottomNavigationMenu(context, tabCountController),
          body: Obx(
            () => Stack(
              children: [
                IndexedStack(
                  index: tabCountController.tabIndex.value,
                  children: const [
                    HomePage(),
                    chat(),
                    Doctor(),
                    Helth(),
                    Profile(),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      margin: EdgeInsets.only(top: Platform.isIOS ? 8 : 0),
                      height: Platform.isIOS ? 100 : 68,
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BottomNavigationBar(
                          onTap: ((value) {
                            tabCountController.changeTabIndex(value);
                            if (widget.screenDef == "Details") {
                              Get.offAll(
                                () => TabPage(
                                  screenDef: "Home",
                                  selectedTabIndex: value,
                                ),
                              );
                            }
                          }),
                          currentIndex: tabCountController.tabIndex.value,
                          backgroundColor: kHighlightColor,
                          unselectedItemColor: kIconColor,
                          selectedItemColor: kSelectedIconColor,
                          unselectedLabelStyle: unselectedLabelStyle,
                          selectedLabelStyle: selectedLabelStyle,
                          type: BottomNavigationBarType.fixed,
                          items: [
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 7.0, top: 2),
                                child: Image.asset(
                                  "assets/icons/home.png",
                                  color: tabCountController.tabIndex.value == 0
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
                                padding:
                                    const EdgeInsets.only(bottom: 9.0, top: 4),
                                child: Image.asset(
                                  "assets/icons/comment.png",
                                  color: tabCountController.tabIndex.value == 0
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
                                padding:
                                    const EdgeInsets.only(bottom: 7.0, top: 2),
                                child: Image.asset(
                                  "assets/icons/person_plus.png",
                                  color: tabCountController.tabIndex.value == 0
                                      ? kSelectedIconColor
                                      : kIconColor,
                                  scale: 1.7,
                                ),
                              ),
                              label: 'Doctors',
                              backgroundColor: kBackGroundColor,
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 7.0, top: 2),
                                child: Image.asset(
                                  "assets/icons/hart.png",
                                  color: tabCountController.tabIndex.value == 0
                                      ? kSelectedIconColor
                                      : kIconColor,
                                  scale: 1.7,
                                ),
                              ),
                              label: 'My Health',
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 7.0, top: 3),
                                  child: Image.asset(
                                    "assets/icons/User.png",
                                    color:
                                        tabCountController.tabIndex.value == 0
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
                )
              ],
            ),
          ),
        );
      },
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
                  label: 'Doctors',
                  backgroundColor: kBackGroundColor,
                ),
                BottomNavigationBarItem(
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
                  label: 'My Health',
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
