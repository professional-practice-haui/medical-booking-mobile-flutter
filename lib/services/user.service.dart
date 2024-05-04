import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medical_booking_app/models/user.model.dart';

class UserService {
  static Future<dynamic> fetchRegister(
      String fullName, String email, String password) async {
    final response = await http.post(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fullName': fullName,
        'email': email,
        'password': password,
      }),
    );
    String responseBody = response.body;

    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);

    // Parse the JSON data
    Map<String, dynamic> responseData = jsonDecode(decodedResponse);
    return responseData;
  }

  static Future<dynamic> fetchLogin(String email, String password) async {
    final response = await http.post(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    // Convert the response body to a string
    String responseBody = response.body;

    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);

    // Parse the JSON data
    Map<String, dynamic> responseData = jsonDecode(decodedResponse);

    return responseData;
  }
}
