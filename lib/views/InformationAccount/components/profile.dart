import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/profile.model.dart';

class ProfileScreen extends StatelessWidget {
  final Profile? profile;

  const ProfileScreen({super.key, required this.profile});

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
          // info("Mã bệnh nhân", profile == null ? "Chưa có thông tin" : profile!.fullName),
          info("Họ và tên",
              profile == null ? "Chưa có thông tin" : profile!.fullName),
          info("Số điện thoại",
              profile == null ? "Chưa có thông tin" : profile!.phoneNumber),
          info("Ngày sinh",
              profile == null ? "Chưa có thông tin" : profile!.dateOfBirth),
          info("Giới tính",
              profile == null ? "Chưa có thông tin" : profile!.gender),
          info("Địa chỉ",
              profile == null ? "Chưa có thông tin" : profile!.address),
          info("Email", profile == null ? "Chưa có thông tin" : profile!.email),
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
