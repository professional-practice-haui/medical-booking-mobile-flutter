import 'package:flutter/material.dart';
import 'package:medical_booking_app/routes/routeGenrator.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:medical_booking_app/models/user.model.dart';
void main() {
  runApp(const MyApp());
}
class UserData with ChangeNotifier,DiagnosticableTreeMixin {
  String? accessToken;
  User user = new User(id: "", email: "", password: "", fullName: "");
  Future<void> updateUser(BuildContext context) async {
    dynamic response = await Navigator.pushNamed(context, RoutesWidget.routeLogin);
    print(response["data"]["user"]);
    user = User(
      id: response["data"]["user"]['id'],
      email: response["data"]["user"]['email'],
      password: response["data"]["user"]['password'],
      fullName: response["data"]["user"]['fullName'],
      address: response["data"]["user"]['address'],
      phone: response["data"]["user"]['phone'],
      dateOfBirth: response["data"]["user"]['dateOfBirth'],
      genderName: response["data"]["user"]['genderName'],
      avatar: response["data"]["user"]['avatar'],
      isLocked: response["data"]["user"]['isLocked'],
      createdDate: response["data"]["user"]['createdDate'],
      lastModifiedDate: response["data"]["user"]['lastModifiedDate'],
    );
    notifyListeners();
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserData()),
      ],
      child: MaterialApp(
        initialRoute: RoutesWidget.routeHome,
        // initialRoute: RoutesWidget.routeInformationAccount,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
