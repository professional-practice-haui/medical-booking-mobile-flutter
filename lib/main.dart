import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_booking_app/routes/routeGenrator.dart';
import 'package:medical_booking_app/routes/routes.dart';
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: RoutesWidget.routeHome,
        onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
