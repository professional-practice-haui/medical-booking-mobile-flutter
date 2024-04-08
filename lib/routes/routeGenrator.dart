import 'package:flutter/material.dart';
import 'package:medical_booking_app/views/MedicalHome/medicalHome.dart';
import 'package:medical_booking_app/views/MedicalLogin/login.dart';
class RouteGenerator {
  static const String routeHome = '/home';
  static const String routeLogin = '/login';
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>MedicalHome());
      case '/login':
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
