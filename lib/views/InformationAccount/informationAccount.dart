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
  Future<void> _fetchProfile() async {
    String? token = context.read<UserProvider>().token;
    print("token $token");
    // await Future.delayed(const Duration(seconds: 2));
    context.read<ProfileProvider>().getProfile(token == null ? "" : token);
    // Sau khi lấy token và gọi getProfile, bạn có thể thực hiện các câu lệnh tiếp theo ở đây
  }

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
      return SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.952),
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.account_circle,
                        size: 60,
                      ),
                    ),
                    Text(
                      profileProvider.profile == null
                          ? "User"
                          : profileProvider.profile!.fullName,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()),
                          );
                        },
                        child: const Row(
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
                const privacyPolicy(),
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
                const privacyPolicy(),
                const BorderRadius.all(Radius.circular(0)),
              ),
              list(
                const Icon(
                  Icons.share,
                  color: Colors.pink,
                ),
                "Chia sẻ ứng dụng",
                const privacyPolicy(),
                const BorderRadius.all(Radius.circular(0)),
              ),
              list(
                  const Icon(
                    Icons.call,
                    color: Colors.lightBlue,
                  ),
                  "Liên hệ & hỗ trợ",
                  const privacyPolicy(),
                  const BorderRadius.all(Radius.circular(0))),
              list(
                const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                "Đăng xuất",
                const privacyPolicy(),
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
      margin: const EdgeInsets.only(left: 15, right: 15),
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
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
