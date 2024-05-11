import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/department.model.dart';
import 'package:medical_booking_app/providers/department.provider.dart';
import 'package:provider/provider.dart';

class ListDepartment extends StatefulWidget {
  const ListDepartment({super.key, required this.imageWidth});
  final double imageWidth;
  @override
  State<ListDepartment> createState() => _ListDepartmentState();
}

class _ListDepartmentState extends State<ListDepartment> {
  @override
  void initState() {
    super.initState();
    context.read<DepartmentProvider>().getDepartments();
  }

  void show(BuildContext context, List<Department> lists) {
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
            itemCount: lists.length,
            itemBuilder: (context, index) {
              var department = lists[index];
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      department.image,
                      fit: BoxFit.cover,
                      width: widget.imageWidth,
                      height: widget.imageWidth,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    department.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DepartmentProvider>(
      builder: (context, departmentProvider, _) {
        if (departmentProvider.departments.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // Dữ liệu đã được tải xong, tiếp tục xử lý
          return _buildDepartmentList(context, departmentProvider.departments);
        }
      },
    );
  }

  Widget _buildDepartmentList(
      BuildContext context, List<Department> departments) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Row(
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
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            shrinkWrap: true, // Không cần kéo
            itemCount: 8,
            itemBuilder: (context, index) {
              var department = departments[index];
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      department.image,
                      fit: BoxFit.cover,
                      width: widget.imageWidth,
                      height: widget.imageWidth,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    department.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              );
            },
          ),
          InkWell(
            onTap: () => _showModalBottomSheet(context, departments),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
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

  void _showModalBottomSheet(
      BuildContext context, List<Department> departments) {
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
                    child: Image.network(
                      department.image,
                      fit: BoxFit.fill,
                      width: widget.imageWidth,
                      height: widget.imageWidth,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  // Sử dụng thuộc tính overflow và maxLines để hiển thị chữ trên cùng một dòng
                  Text(
                    department.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
