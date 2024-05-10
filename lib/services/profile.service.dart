import 'package:http/http.dart' as http;
import 'package:medical_booking_app/models/profile.model.dart';
import 'dart:convert';

import 'package:medical_booking_app/providers/user.provider.dart';

class ProfileService {
  static Future<Profile> getAllProfile(String token) async {
    Profile profile;
    // String token =
    //     'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYW5ndDc3MDhAZ21haWwuY29tIiwiZXhwIjoxNzE1NDM2NDI0fQ.DVVX6s8GUd70FUYtKxV4djl0f-b1KSTjHlh_tHyESx8';
    final response = await http.get(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/users/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );
    String responseBody = response.body;
    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);

    if (response.statusCode == 200) {
      // Decode JSON data
      final jsonData = jsonDecode(decodedResponse);

      profile = Profile.fromJson(jsonData["data"]["items"]);
    } else {
      throw Exception('Failed to get profile');
    }
    return profile;
  }

  static Future<Profile> updateProfile() async {
    Profile profile = Profile(
        email: " haha",
        fullName: "fullName",
        address: "address",
        phoneNumber: "phoneNumber",
        gender: "gender",
        dateOfBirth: "dateOfBirth",
        password: "password",
        avatarUrl: "avatarUrl",
        isLocked: false);
    String token =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYW5ndDc3MDhAZ21haWwuY29tIiwiZXhwIjoxNzE1NDM2NDI0fQ.DVVX6s8GUd70FUYtKxV4djl0f-b1KSTjHlh_tHyESx8';
    final response = await http.post(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/users/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        <String, dynamic>{
          'email': profile.email,
          'fullName': profile.fullName,
          'address': profile.address,
          'phoneNumber': profile.phoneNumber,
          'gender': profile.gender,
          'dateOfBirth': profile.dateOfBirth,
          'password': profile.password,
          'avatarUrl': profile.avatarUrl,
          'isLocked': profile.isLocked,
        },
      ),
    );
    String responseBody = response.body;
    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);
    print(decodedResponse);
    if (response.statusCode == 201) {
      // Decode JSON data
      final jsonData = jsonDecode(decodedResponse) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to update profile');
    }
    return profile;
  }
}
