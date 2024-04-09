import 'package:flutter/material.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:medical_booking_app/baseWidget/email.dart';
import 'package:medical_booking_app/baseWidget/password.dart';
import 'package:medical_booking_app/views/MedicalLogin/components/username.dart';

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
  // TextEditingController được sử dụng để quản lý nội dung của các trường văn bản nhập liệu trong giao diện người dùng.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isChecked = false;
  bool checkEye = false;
  bool isEmailFocused = false,isPasswordFocused = false,isUserNameFocused = false,isConfirmPasswordFocused=false;

  void _registerPressed() {
    String confirmPassword = confirmPasswordController.text;
    String password = passwordController.text;
    if(confirmPassword!=password){
      print("Mật khẩu nhập không đúng với xác nhận!");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
              UserNameTextField(userNameController: userNameController),
              EmailTextField(emailController: emailController),
              PasswordTextField(passwordController: passwordController,hintText: "Password",),
              PasswordTextField(passwordController: confirmPasswordController,hintText: "Confirm Password",),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: _registerPressed,
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
            ],
          ),
        ),
      ),
    );
  }
}
