import 'package:flutter/material.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:medical_booking_app/baseWidget/email.dart';
import 'package:medical_booking_app/baseWidget/password.dart';
import 'package:medical_booking_app/views/MedicalLogin/components/username.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/baseApi/userApi.dart';
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isChecked = false;
  bool checkEye = false;
  bool isEmailFocused = false,isPasswordFocused = false,isUserNameFocused = false,isConfirmPasswordFocused=false;
  User? registeredUser;
  String? errorMessage;
  void _registerUser(BuildContext context) async {
    try {
      dynamic response = await fetchRegister(
        fullNameController.text,
        emailController.text,
        passwordController.text,
      );
      if(response!=null){
        Navigator.of(context).pushNamed(RoutesWidget.routeLogin);
      }
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign Up ", style: TextStyle(fontSize: 26)),
                      Text(
                        "You",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      Text(
                        "MedID",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      )
                    ],
                  ),
                ),
                FullNameTextField(fullNameController: fullNameController),
                EmailTextField(emailController: emailController),
                PasswordTextField(passwordController: passwordController,hintText: "Password",),
                PasswordTextField(passwordController: confirmPasswordController,hintText: "Confirm Password",),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed: ()=>_registerUser(context),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    width: screenWidth,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
                // Hiển thị thông báo lỗi nếu có
                if (errorMessage != null)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
