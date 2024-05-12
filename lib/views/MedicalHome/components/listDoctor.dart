import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/doctor.model.dart';
import 'package:medical_booking_app/providers/doctor.provider.dart';
import 'package:provider/provider.dart';

class ListDoctor extends StatefulWidget {
  const ListDoctor({super.key, required this.imageWidth});
  final double imageWidth;
  @override
  State<ListDoctor> createState() => _ListDoctorState();
}

class _ListDoctorState extends State<ListDoctor> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorProvider>().getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, doctorProvider, _) {
        if (doctorProvider.doctors.isEmpty) {
          return Center(
            child: Text("Không có dữ liệu"),
          );
        } else {
          // Dữ liệu đã được tải xong, tiếp tục xử lý
          return _buildDoctorList(context, doctorProvider.doctors);
        }
      },
    );
  }

  Widget _buildDoctorList(BuildContext context, List<Doctor> doctors) {
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
              SizedBox(
                width: 5,
              ),
              Text(
                "Bác Sĩ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: doctors
                  .map((doctor) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                doctor.image,
                                fit: BoxFit.fill,
                                width: widget.imageWidth,
                                height: widget.imageWidth,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              doctor.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              "${doctor.experience} năm kinh nghiệm",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
