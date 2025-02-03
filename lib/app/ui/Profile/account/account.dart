import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/constant/color_constant.dart';
import '../../../../config/constant/font_constant.dart';
import '../../Auth/ChangePassword/change_password.dart';
import '../../Auth/Login/login_patient.dart';
import 'email_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                Get.to(() => const EmailPage());
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      size: 20,
                      color: kButtonColor,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email address",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                Get.to(() => const ChangePasswordPage());
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phonelink_setup,
                      size: 20,
                      color: kButtonColor,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Change number",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                deleteAccountConfirmationDialog();
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      size: 20,
                      color: kRedColor,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delete Account",
                          style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontFamily: kCircularStdMedium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 85)
          ],
        ),
      ),
    );
  }

  deleteAccountConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert !"),
        elevation: 5,
        titleTextStyle: const TextStyle(fontSize: 18, color: kRedColor),
        content: const Text("Are you sure want to Delete\naccount?"),
        contentPadding: const EdgeInsets.only(left: 25, top: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Get.offAll(() => const LoginPatientPage());
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
}
