import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/department.model.dart';
import 'package:medical_booking_app/services/department.service.dart';

class DepartmentProvider extends ChangeNotifier {
  List<Department> departments = [];
  String? errorMessage = "";

  // Phương thức lấy danh sách các phòng ban
  Future<void> getDepartments() async {
    try {
      departments = await DepartmentService.getDepartments();
    } catch (e) {
      // Xử lý khi gặp lỗi
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Error: $e");
    }
    notifyListeners();
  }
}
