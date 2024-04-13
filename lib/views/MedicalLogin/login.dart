import 'package:flutter/material.dart';
import 'package:medical_booking_app/baseWidget/email.dart';
import 'package:medical_booking_app/baseWidget/password.dart';
import 'package:medical_booking_app/routes/routes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController được sử dụng để quản lý nội dung của các trường văn bản nhập liệu trong giao diện người dùng.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool checkEye = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;

  void _loginPressed() {
    String email = emailController.text;
    String password = passwordController.text;

    if (!_isValidEmail(email)) {
      print('Email không hợp lệ');
    }

    if (!_isValidPassword(password)) {
      print('Mật khẩu không hợp lệ');
    }
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }

  bool _isValidPassword(String password) {
    return password.length >= 6;
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
                    Text("Sign In ", style: TextStyle(fontSize: 26)),
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
              EmailTextField(emailController: emailController),
              PasswordTextField(passwordController: passwordController,hintText: "Password",),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue ?? false;
                          });
                        },
                      ),
                      Text("Ghi nhớ mật khẩu"),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesWidget.routeHome,
                        );
                      },
                      child: Text(
                        "Quên mật khẩu ?",
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ))
                ],
              ),
              TextButton(
                onPressed: _loginPressed,
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
                    "Sign In",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text("Chưa có tài khoản. "),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context,
                              RoutesWidget.routeRegister
                          );
                        },
                        child: Text(
                          "Đăng Kí Ngay",
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
