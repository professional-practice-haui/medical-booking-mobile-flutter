import 'package:flutter/material.dart';
import 'package:medical_booking_app/providers/department.provider.dart';
import 'package:medical_booking_app/providers/doctor.provider.dart';
import 'package:medical_booking_app/providers/profile.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
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
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DepartmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DoctorProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: RoutesWidget.routeHome,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
