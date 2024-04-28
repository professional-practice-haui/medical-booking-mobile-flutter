import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/department.model.dart';

class ListDepartment extends StatelessWidget {
  void show(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Tất cả chuyên khoa",
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
          ),
          body: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Số cột trong mỗi hàng
            ),
            shrinkWrap: true, // Không cần kéo
            itemCount: departments.length,
            itemBuilder: (context, index) {
              var department = departments[index];
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      department.avatar,
                      fit: BoxFit.scaleDown,
                      width: imageWidth,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    department.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  ListDepartment({super.key, required this.imageWidth});
  final double imageWidth;
  final List<Department> departments = List.generate(
      20,
      (index) => Department(
          departmentId: "${index + 1}",
          avatar: "assets/images/tim-mach.jpg",
          name: "Khoa${index + 1}",
          year: index + 1));
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.medical_services_outlined,
                color: Colors.lightBlueAccent,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Khám theo chuyên khoa",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Số cột trong mỗi hàng
            ),
            shrinkWrap: true, // Không cần kéo
            itemCount: 8,
            itemBuilder: (context, index) {
              var department = departments[index];
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      department.avatar,
                      fit: BoxFit.scaleDown,
                      width: imageWidth,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    department.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
          InkWell(
            onTap: () => show(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Xem tất cả các chuyên khoa",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
