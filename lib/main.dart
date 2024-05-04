import 'package:flutter/material.dart';
import 'package:medical_booking_app/routes/routeGenrator.dart';
import 'package:medical_booking_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RoutesWidget.routeHistory,
      // initialRoute: RoutesWidget.routeInformationAccount,

      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
