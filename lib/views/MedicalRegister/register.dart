import 'package:flutter/material.dart';
import 'package:medical_booking_app/Provider/user.provider.dart';
import 'package:medical_booking_app/services/userServices.dart';
import 'package:medical_booking_app/baseWidget/AnimationNextScreen.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isChecked = false;
  bool checkEye1 = false;
  bool checkEye2 = false;
  bool isEmailFocused = false,
      isPasswordFocused = false,
      isUserNameFocused = false,
      isConfirmPasswordFocused = false;
  User? registeredUser;
  String? errorMessage;

  void _registerUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        await userProvider.register(
          fullNameController.text,
          emailController.text,
          passwordController.text,
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AnimationNextScreen();
          },
        );
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context); // Đóng dialog AnimationNextScreen
        if (userProvider.checkRegister == true) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                content: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Đăng kí thành công",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesWidget.routeLogin);
                          Future.delayed(Duration(seconds: 1));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'OK',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          setState(() {
            errorMessage = userProvider.errorMessage;
          });
        }
      } catch (e) {
        setState(() {
          errorMessage = e.toString();
        });
      }
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                SizedBox(height: 20.0),
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên đầy đủ của bạn.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập đầy đủ email của bạn.';
                    }
                    if (!value.contains('@')) {
                      return 'Vui lòng nhập địa chỉ email hợp lệ.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        checkEye1 ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          checkEye1 = !checkEye1;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu của bạn.';
                    }
                    return null;
                  },
                  obscureText:
                      !checkEye1, // Ẩn hoặc hiện mật khẩu tùy thuộc vào giá trị của checkEye
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          checkEye2 ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            checkEye2 = !checkEye2;
                          });
                        },
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập đúng mật khẩu xác nhận.';
                    }
                    if (value != passwordController.text) {
                      return 'Mật khẩu xác nhận không chính xác.';
                    }
                    return null;
                  },
                  obscureText: !checkEye2,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => _registerUser(context),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightBlueAccent),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Bạn đã có tài khoản."),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesWidget.routeLogin);
                      },
                      child: Text(
                        " Hãy đăng nhập.",
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                    )
                  ],
                ),
                if (errorMessage != null)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
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
