import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/department.model.dart';
import 'package:medical_booking_app/services/department.service.dart';

class DepartmentProvider extends ChangeNotifier {
  List<Department> departments = [];
  String? errorMessage = "";
  bool isLoading = true;
  // Phương thức lấy danh sách các phòng ban
  Future<void> getDepartments() async {
    isLoading = true;
    departments = await DepartmentService.getDepartments();
    isLoading = false;
    notifyListeners();
  }
}
