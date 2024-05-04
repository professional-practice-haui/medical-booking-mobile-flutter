import 'package:http/http.dart' as http;
import 'package:medical_booking_app/models/doctor.model.dart';
import 'dart:convert';

class DoctorService {
  static Future<List<Doctor>> getDoctors() async {
    late List<Doctor> lists;
    final response = await http.get(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/doctors'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    String responseBody = response.body;

    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);
    if (response.statusCode == 200) {
      // Decode JSON data
      final jsonData = jsonDecode(decodedResponse);
      // Parse data and return list of Department objects
      lists = List<Doctor>.from(
          jsonData['data']['items'].map((x) => Doctor.fromJson(x)));
    } else {
      throw Exception('Failed to load doctors');
    }
    return lists;
  }
}
