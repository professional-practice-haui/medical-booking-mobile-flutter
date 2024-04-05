import 'package:flutter/material.dart';
import 'package:medical_booking_app/app/modules/doctorModules/Doctor.dart';
class ListDoctor extends StatelessWidget {
  ListDoctor({super.key,required this.imageWidth});
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
          departmentId: "${index + 1}"));
  @override
  Widget build(BuildContext context) {
    return
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                // Khoảng cách giữa các cột
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        doctors[index].avatar,
                        fit: BoxFit.scaleDown,
                        width: imageWidth,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Khoảng cách giữa các cột trên mỗi trang
                    Text(doctors[index].name),
                  ],
                ),
              );
            },
          ),
    );
  }
}
