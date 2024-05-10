import 'package:flutter/material.dart';
import 'package:medical_booking_app/services/profile.service.dart';

import '../models/profile.model.dart';

class ProfileProvider extends ChangeNotifier {
  Profile? profile;
  String? errorMessage = "";
  
  Future<void> getProfile(String token) async {
    try {
      profile = await ProfileService.getAllProfile(token);
    } catch (e) {
      // Xử lý khi gặp lỗi
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Error: $e");
    }
    notifyListeners();
  }
}
