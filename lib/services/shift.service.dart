import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medical_booking_app/models/shift.model.dart';

class ShiftService {
  static Future<List<Shift>> getAllShift() async {
    List<Shift> shifts;
    String token =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJleHAiOjE3MTQ5NjExNjd9.lbiE27ulL8GcPOsqu1SeLMoMD5KwpXaM16wYQZx9SzY';
    final response = await http.get(
      Uri.parse('https://medical-booking-be-spring.onrender.com/api/v1/shifts'),
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

      shifts = List<Shift>.from(
          jsonData["data"]["items"].map((x) => Shift.fromJson(x)));
    } else {
      throw Exception('Failed to get shifts');
    }
    return shifts;
  }
}
