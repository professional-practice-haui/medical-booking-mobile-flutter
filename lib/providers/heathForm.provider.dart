import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/heathForm.model.dart';
import 'package:medical_booking_app/services/healthForm.service.dart';

class HealthFormProvider extends ChangeNotifier {
  List<HealthForm> healthForms = [];
  String? errorMessage = "";
  Future<void> createHealthForms(
      String token,
      int userId,
      String namePatient,
      String email,
      String phoneNumber,
      int shiftId,
      String reason,
      String cccd,
      String bhyt,
      String deniedReason) async {
    try {
      HealthForm hf = await HealthFormService.createHealthForm(
          token,
          userId,
          namePatient,
          email,
          phoneNumber,
          shiftId,
          reason,
          cccd,
          bhyt,
          deniedReason);
      healthForms.add(hf);
    } catch (e) {
      // Xử lý khi gặp lỗi
      errorMessage = e.toString();
      print("Error: $e");
    }
    notifyListeners();
  }
}
