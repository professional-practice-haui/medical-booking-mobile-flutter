import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/user.model.dart';

import 'package:medical_booking_app/services/user.service.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  String? token;
  String? errorMessage = '';
  bool checkLogin = false;
  bool checkRegister = false;

  // Phương thức đăng nhập
  Future<void> login(String email, String password) async {
    try {
      final response = await UserService.fetchLogin(email, password);
      if (response["code"] == 200) {
        // Đăng nhập thành công
        user = User(
          id: response["data"]["user"]['id'],
          email: response["data"]["user"]['email'],
          fullName: response["data"]["user"]['fullName'],
          address: response["data"]["user"]['address'],
          phone: response["data"]["user"]['phone'],
          dateOfBirth: response["data"]["user"]['dateOfBirth'],
          genderName: response["data"]["user"]['genderName'],
          avatar: response["data"]["user"]['avatar'],
          isLocked: response["data"]["user"]['isLocked'],
          createdDate: response["data"]["user"]['createdDate'],
          lastModifiedDate: response["data"]["user"]['lastModifiedDate'],
        );
        token = response["data"]["token"];
        checkLogin = true;
      } else {
        // Đăng nhập thất bại, lưu thông báo lỗi
        errorMessage = response["message"];
      }
    } catch (e) {
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Error: $e");
    }
    notifyListeners();
  }

  Future<void> register(String fullName, String email, String password) async {
    try {
      final response =
          await UserService.fetchRegister(fullName, email, password);

      if (response["code"] == 201) {
        checkRegister = true;
      } else {
        // Đăng ký thất bại, lưu thông báo lỗi
        errorMessage = response["message"];
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Error: $e");
    }

    // Thông báo cho người nghe rằng có sự thay đổi
    notifyListeners();
  }

  void logout() {
    user = User();
    token = ''; // Xóa token
    errorMessage = ''; // Xóa thông báo lỗi
    notifyListeners();
  }
}
