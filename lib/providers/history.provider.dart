import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/historyForm.model.dart';
import 'package:medical_booking_app/services/history.service.dart';

class HistoryProvider extends ChangeNotifier {
  List<HistoryForm> forms = [];
  String? errorMessage = "";

  // Phương thức lấy danh sách các phòng ban
  Future<void> getForms(String token) async {
    try {
      forms = await HistoryService.getHistoryForms(token);
    } catch (e) {
      // Xử lý khi gặp lỗi
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Error: $e");
    }
    notifyListeners();
  }
}
