import 'package:http/http.dart' as http;
import 'package:medical_booking_app/models/profile.model.dart';
import 'dart:convert';

import 'package:medical_booking_app/providers/user.provider.dart';

class ProfileService {
  static Future<Profile> getAllProfile(String token) async {
    Profile profile;
    // String token =
    //     'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYW5ndDc3MDhAZ21haWwuY29tIiwiZXhwIjoxNzE1NDM2NDI0fQ.DVVX6s8GUd70FUYtKxV4djl0f-b1KSTjHlh_tHyESx8';
    final response = await http.put(
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
      // print(jsonData["data"]);
      profile = Profile.fromJson(jsonData["data"]);
    } else {
      throw Exception('Failed to get profile');
    }
    return profile;
  }

  static Future<dynamic> updateProfile(
      String token,
      String fullName,
      String phoneNumber,
      String dateOfBirth,
      String gender,
      String address,
      String email) async {
    Profile profile;
    // String token =
    //     'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYW5ndDc3MDhAZ21haWwuY29tIiwiZXhwIjoxNzE1NDM2NDI0fQ.DVVX6s8GUd70FUYtKxV4djl0f-b1KSTjHlh_tHyESx8';
    final response = await http.put(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/users/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        <String, dynamic>{
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'dateOfBirth': dateOfBirth,
          'gender': gender,
          'address': address,
          'email': email
          // 'avatarUrl': avatarUrl,
        },
      ),
    );
    String responseBody = response.body;
    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);

    if (response.statusCode == 200) {
      // Decode JSON data
      final jsonData = jsonDecode(decodedResponse);
      // print(jsonData["data"]);
      profile = Profile.fromJson(jsonData["data"]);
    } else {
      print(response.statusCode);
      throw Exception('Failed to put profile');
    }
    return profile;
  }
}
