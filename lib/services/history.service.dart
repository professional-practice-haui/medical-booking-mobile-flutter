import 'dart:convert';

import 'package:medical_booking_app/models/historyForm.model.dart';
import 'package:http/http.dart' as http;

class HistoryService {
  static Future<List<HistoryForm>> getHistoryForms(String token) async {
    late List<HistoryForm> lists;
    final response = await http.get(
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/health-forms/history'),
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
      // Parse data and return list of Department objects
      lists = List<HistoryForm>.from(
          jsonData['data']['items'].map((x) => HistoryForm.fromJson(x)));
    } else {
      throw Exception('Failed to load history');
    }
    return lists;
  }
}
