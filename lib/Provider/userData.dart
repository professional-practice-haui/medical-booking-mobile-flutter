import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/user.model.dart';

class UserData extends ChangeNotifier {
  String accessToken;
  User user;

  UserData({required this.user,required this.accessToken});

  void updateUser(User newUser, String newToken) {
    user = newUser;
    accessToken = newToken;
    notifyListeners();
  }
}
