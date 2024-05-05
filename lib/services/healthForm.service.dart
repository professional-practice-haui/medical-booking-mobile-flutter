import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medical_booking_app/models/heathForm.model.dart';

class HealthFormService {
  static Future<HealthForm> createHealthForm(
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
    late HealthForm healthForm;
    final response = await http.post(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/healthForms'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'userId': userId,
        'namePatient': namePatient,
        'email': email,
        'phoneNumber': phoneNumber,
        'shiftId': shiftId,
        'reason': reason,
        'cccd': cccd,
        'bhyt': bhyt,
        'deniedReason': deniedReason,
      }),
    );
    String responseBody = response.body;
    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);
    print(decodedResponse);
    if (response.statusCode == 201) {
      // Decode JSON data
      final jsonData = jsonDecode(decodedResponse) as Map<String, dynamic>;
      healthForm = HealthForm.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to create health form');
    }
    return healthForm;
  }
}
