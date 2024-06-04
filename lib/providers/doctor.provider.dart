import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/doctor.model.dart';
import 'package:medical_booking_app/services/doctor.service.dart';

class DoctorProvider extends ChangeNotifier {
  List<Doctor> doctors = [];
  String? errorMessage = "";
  bool isLoading = false;
  // Phương thức lấy danh sách các phòng ban
  Future<void> getDoctors() async {
    isLoading = true;
    try {
      doctors = await DoctorService.getDoctors();
      isLoading = false;
    } catch (e) {
      // Xử lý khi gặp lỗi
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Error: $e");
    }
    notifyListeners();
  }
}
