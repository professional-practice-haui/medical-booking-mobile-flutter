import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/shift.model.dart';
import 'package:medical_booking_app/services/shift.service.dart';

class ShiftProvider extends ChangeNotifier {
  List<Shift> shifts = [];
  String? errorMessage = "";

  // Phương thức lấy danh sách các phòng ban
  Future<void> getShifts() async {
    try {
      shifts = await ShiftService.getAllShift();
    } catch (e) {
      // Xử lý khi gặp lỗi
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Error: $e");
    }
    notifyListeners();
  }
}
