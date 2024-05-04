import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medical_booking_app/models/department.model.dart';

class DepartmentService {
  static Future<List<Department>> getDepartments() async {
    late List<Department> lists;
    final response = await http.get(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/departments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    String responseBody = response.body;

    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);
    if (response.statusCode == 200) {
      // Decode JSON data
      final jsonData = jsonDecode(response.body);
      // Parse data and return list of Department objects
      lists = List<Department>.from(
          jsonData['data']['items'].map((x) => Department.fromJson(x)));
    } else {
      throw Exception('Failed to load departments');
    }
    return lists;
  }
}
