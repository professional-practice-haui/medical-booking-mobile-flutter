import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Hồ sơ y tế",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(25, 117, 220, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.lightBlue,
                ),
                Text(
                  "Thông tin cơ bản",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ],
            ),
          ),
          info("Mã bệnh nhân", "xxx"),
          info("Họ và tên", "xxx"),
          info("Số điện thoại", "xxx"),
          info("Ngày sinh", "xxx"),
          info("Giới tính", "xxx"),
          info("Địa chỉ", "xxx"),
          info("Email", "xxx"),
        ],
      ),
    );
  }

  Container info(String text1, String text2) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            text2,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
