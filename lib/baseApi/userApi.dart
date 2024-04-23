import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medical_booking_app/models/user.model.dart';

Future<dynamic> fetchRegister(String fullName, String email, String password) async {
  final response = await http.post(
    Uri.parse('https://7bbf-116-99-55-170.ngrok-free.app/api/v1/auth/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'fullName': fullName,
      'email': email,
      'password': password,
    }),
  );
  print(response.body);
  if (response.statusCode == 201) {
    Map<String, dynamic> responseData = jsonDecode(response.body);
    return responseData;
  } else {
    // If the server returns an error response, throw an exception.
    throw Exception('Failed to register user');
  }
}
Future<dynamic> fetchLogin(String email, String password) async {
  final response = await http.post(
    Uri.parse('https://7bbf-116-99-55-170.ngrok-free.app/api/v1/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = jsonDecode(response.body);
    print(responseData);
    User newUser = new User(userId: responseData['id'], email: email, password: password, fullName: responseData['fullName']);
    return newUser;
  } else {
    // If the server returns an error response, throw an exception.
    throw Exception('Failed to login user');
  }
}
