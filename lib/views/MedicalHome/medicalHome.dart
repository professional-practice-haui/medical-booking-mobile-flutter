import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:medical_booking_app/views/HealthForm/healthForm.dart';
import 'package:medical_booking_app/views/InformationAccount/informationAccount.dart';
import 'package:medical_booking_app/views/MedicalHome/components/descriptionMedicalHome.dart';
import 'package:medical_booking_app/views/MedicalHome/components/listDepartment.dart';
import 'package:medical_booking_app/views/MedicalHome/components/listDoctor.dart';
import 'package:medical_booking_app/views/MedicalHome/components/navbarMedicalHome.dart';
import 'package:medical_booking_app/views/MedicalHome/components/newMedical.dart';
import 'package:medical_booking_app/views/MedicalHome/components/titleAppBarMedicalHome.dart';
class MedicalHome extends StatefulWidget {
  const MedicalHome({super.key});

  @override
  State<MedicalHome> createState() => _MedicalHomeState();
}

class _MedicalHomeState extends State<MedicalHome> {
  int _selectedIndex = 0;
  // List of widgets for each tab
  List<Widget> _widgetOptions = <Widget>[
    // Widget for Trang chủ
    BodyHome(),
    // Widget for Đặt khám
    HealthForm(),
    // Widget for Lịch sử
    Text(
      'Lịch sử',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    // Widget for Cá nhân
    InformationAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: _selectedIndex==0? AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(25, 117, 220, 1),
          toolbarHeight: 80,
          title: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TitLeAppBarHomeMedical(),
          ),
        ):AppBar(automaticallyImplyLeading: false,toolbarHeight: 0),
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Đặt khám',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_outlined),
              label: 'Lịch sử',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Cá nhân',
            ),
          ],
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blueAccent,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
class BodyHome extends StatelessWidget {
  const BodyHome({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
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
        );
  }
}
