import 'package:flutter/material.dart';
import 'package:medical_booking_app/routes/routes.dart';
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
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(25, 117, 220, 1),
        toolbarHeight: 80,
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: TitLeAppBarHomeMedical(),
        ),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Hiển thị tất cả các label
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
        unselectedItemColor: Colors.black, // Màu của label khi không được chọn
        selectedItemColor: Colors.blueAccent,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          if(index!=0) Navigator.of(context).pushNamed(RoutesWidget.routeLogin);
        },
      ),
    );
  }
}
