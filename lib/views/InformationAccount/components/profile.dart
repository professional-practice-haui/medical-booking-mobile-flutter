import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/profile.model.dart';
import 'package:medical_booking_app/providers/profile.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/views/InformationAccount/components/updateProfile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? token = context.read<UserProvider>().token;
    context.read<ProfileProvider>().getProfile(token == null ? "" : token);
    Profile? profile = context.watch<ProfileProvider>().profile;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Hồ sơ y tế",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(25, 117, 220, 1),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        UpdateProfileScreen(profile: profile)),
              );
            },
            icon: const Icon(
              Icons.auto_fix_high,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
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
          info(
              "Số điện thoại",
              profile == null || profile!.phoneNumber == null
                  ? "Chưa có thông tin"
                  : profile!.phoneNumber),
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
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            text2,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
