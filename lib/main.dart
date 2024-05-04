import 'package:flutter/material.dart';
import 'package:medical_booking_app/Provider/user.provider.dart';
import 'package:medical_booking_app/routes/routeGenrator.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        initialRoute: RoutesWidget.routeHome,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
