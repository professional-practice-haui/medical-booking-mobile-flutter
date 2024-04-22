import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_booking_app/views/InformationAccount/components/privacyPolicy.dart';
import 'package:medical_booking_app/views/InformationAccount/components/profile.dart';

class InformationAccount extends StatefulWidget {
  const InformationAccount({super.key});

  @override
  State<InformationAccount> createState() => _InformationAccountState();
}

class _InformationAccountState extends State<InformationAccount> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                    "xxx",
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
                          MaterialPageRoute(builder: (context) => Profile()),
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
