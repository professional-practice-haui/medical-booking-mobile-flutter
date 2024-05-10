import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_booking_app/providers/profile.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/views/InformationAccount/components/privacyPolicy.dart';
import 'package:medical_booking_app/views/InformationAccount/components/profile.dart';
import 'package:provider/provider.dart';

class InformationAccount extends StatefulWidget {
  const InformationAccount({super.key});

  @override
  State<InformationAccount> createState() => _InformationAccountState();
}

class _InformationAccountState extends State<InformationAccount> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  // }
  void test() {
    String token =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYW5ndDc3MDhAZ21haWwuY29tIiwiZXhwIjoxNzE1NDM2NDI0fQ.DVVX6s8GUd70FUYtKxV4djl0f-b1KSTjHlh_tHyESx8';

    Future.delayed(Duration.zero, () async {
      final response = await http.post(
        Uri.parse(
            'https://medical-booking-be-spring.onrender.com/api/v1/users/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          <String, dynamic>{
            'email': "profile.email",
            'fullName': "profile.fullName",
            'address': "profile.address",
            'phoneNumber': "profile.phoneNumber",
            'gender': "profile.gender",
            'dateOfBirth': "profile.dateOfBirth",
            'password': "profile.password",
            'avatarUrl': "profile.avatarUrl",
            'isLocked': "profile.isLocked",
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String? token = context.read<UserProvider>().token;

    print(token);
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
      context.read<ProfileProvider>().getProfile(token == null ? "" : token);
      final profile = context.watch<ProfileProvider>().profile;
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.952),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.account_circle,
                        size: 60,
                      ),
                    ),
                    Text(
                      profile == null ? "User" : profile.fullName,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfileScreen(profile: profile)),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.folder_shared,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Hồ sơ y tế "),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              list(
                const Icon(
                  Icons.announcement,
                  color: Colors.purple,
                ),
                "Điều khoản và Quy định",
                privacyPolicy(),
                const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              list(
                const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                "Cài đặt",
                InformationAccount(),
                const BorderRadius.all(Radius.circular(0)),
              ),
              list(
                const Icon(
                  Icons.share,
                  color: Colors.pink,
                ),
                "Chia sẻ ứng dụng",
                InformationAccount(),
                const BorderRadius.all(Radius.circular(0)),
              ),
              list(
                  const Icon(
                    Icons.call,
                    color: Colors.lightBlue,
                  ),
                  "Liên hệ & hỗ trợ",
                  InformationAccount(),
                  const BorderRadius.all(Radius.circular(0))),
              list(
                const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                "Đăng xuất",
                InformationAccount(),
                const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Container list(Icon icon, String text, Widget widget, BorderRadius border) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: border,
        color: Colors.white,
      ),
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      icon,
                      const SizedBox(
                        width: 10,
                      ),
                      Text(text),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
