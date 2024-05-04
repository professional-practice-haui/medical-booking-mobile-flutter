import 'package:flutter/material.dart';
import 'package:medical_booking_app/views/InformationAccount/informationAccount.dart';
import 'package:medical_booking_app/views/MedicalHistory/medicalHistory.dart';
import 'package:medical_booking_app/views/MedicalHome/medicalHome.dart';
import 'package:medical_booking_app/views/MedicalLogin/login.dart';
import 'package:medical_booking_app/views/MedicalRegister/register.dart';
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
      case '/register':
        return MaterialPageRoute(builder: (_)=>RegisterScreen());
      case '/informationAccount':
        return MaterialPageRoute(builder: (_)=>InformationAccount());
      case '/history':
        return MaterialPageRoute(builder: (_)=>MedicalHistory());
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
