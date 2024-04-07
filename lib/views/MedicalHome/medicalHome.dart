import 'package:flutter/material.dart';
import 'package:medical_booking_app/views/MedicalHome/components/descriptionMedicalHome.dart';
import 'package:medical_booking_app/views/MedicalHome/components/listDepartment.dart';
import 'package:medical_booking_app/views/MedicalHome/components/listDoctor.dart';
import 'package:medical_booking_app/views/MedicalHome/components/navbarMedicalHome.dart';
import 'package:medical_booking_app/views/MedicalHome/components/newMedical.dart';
import 'package:medical_booking_app/views/MedicalHome/components/titleAppBarMedicalHome.dart';

class MedicalHome extends StatelessWidget {
  const MedicalHome({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 117, 220, 1),
        title: TitLeAppBarHomeMedical(),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(208, 190, 199, 0.3),
          ),
          child: Column(
            children: [
              NavbarMedicalHome(
                imageWidth: screenWidth,
                imageHeight: screenHeight / 3.5,
              ),
              DescriptionMedicalHome(
                imageWidth: screenWidth,
                imageHeight: screenHeight / 4,
              ),
              ListDoctor(
                imageWidth: screenWidth / 6,
              ),
              ListDepartment(
                imageWidth: screenWidth / 6,
              ),
              NewMedical(imageWidth: screenWidth,imageHeght: screenHeight/4,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: screenWidth,
        height: screenHeight/16,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BoxItemBottomNavBar(icon: Icon(Icons.home_filled),textBox: "Trang chủ",),
              BoxItemBottomNavBar(icon: Icon(Icons.home_filled),textBox: "Đặt khám",),
              BoxItemBottomNavBar(icon: Icon(Icons.home_filled),textBox: "Lịch sử",),
              BoxItemBottomNavBar(icon: Icon(Icons.home_filled),textBox: "Cá nhân",)
            ],
        ),
      ),
    );
  }
}

class BoxItemBottomNavBar extends StatelessWidget {
  const BoxItemBottomNavBar({super.key,required this.icon,required this.textBox});
  final String textBox;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          icon,
          Text(textBox)
        ],
      ),
    );
  }
}
