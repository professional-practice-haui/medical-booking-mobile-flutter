// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:medical_booking_app/models/user.model.dart';

// class UserService {
//   static Future<dynamic> getDoctors() async {
//     final response = await http.get(
//       Uri.parse(
//           'https://medical-booking-be-spring.onrender.com/api/v1/doctors'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     String responseBody = response.body;

//     // Decode the response using UTF-8 encoding
//     String decodedResponse = utf8.decode(responseBody.codeUnits);

//     // Parse the JSON data
//     Map<String, dynamic> responseData = jsonDecode(decodedResponse);
//     return responseData;
//   }
// }
