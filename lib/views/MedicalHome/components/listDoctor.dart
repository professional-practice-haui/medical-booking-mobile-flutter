import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/doctor.model.dart';

class ListDoctor extends StatelessWidget {
  ListDoctor({Key? key, required this.imageWidth}) : super(key: key);

  final double imageWidth;
  final List<Doctor> doctors = List.generate(
    13,
        (index) => Doctor(
      doctorId: "${index + 1}",
      avatar: "assets/images/meo.png",
      name: "Sơn ${index + 1}",
      gender: "Nam",
      degree: "${index + 1}",
      experience: index + 1,
      description: "Bác Sĩ Sơn ${index + 1}",
      departmentId: "${index + 1}",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              SizedBox(width: 5,),
              Text(
                "Bác Sĩ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: doctors.map((doctor) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        doctor.avatar,
                        fit: BoxFit.scaleDown,
                        width: imageWidth,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      doctor.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${doctor.experience} năm kinh nghiệm",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}