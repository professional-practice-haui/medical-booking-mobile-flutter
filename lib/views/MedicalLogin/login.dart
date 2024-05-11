import 'package:flutter/material.dart';
import 'package:medical_booking_app/baseWidget/Dialog.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/services/user.service.dart';
import 'package:medical_booking_app/baseWidget/AnimationNextScreen.dart';
import 'package:medical_booking_app/main.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool checkEye = false;
  String? errorMessage;
  // final box = GetStorage();

  final _formKey = GlobalKey<FormState>();
  void _loginPressed(BuildContext context) async {
    try {
      if (_formKey.currentState!.validate()) {
        String email = emailController.text;
        String password = passwordController.text;
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        await userProvider.login(email, password);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AnimationNextScreen();
          },
        );
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
        if (userProvider.checkLogin == true) {
          showSuccessDiaLog(context, "Đăng nhập thành công");
          print("token:" + userProvider.token.toString());
          await Future.delayed(Duration(seconds: 1));
          Navigator.pushNamed(context, RoutesWidget.routeHome);
        } else {
          setState(() {
            errorMessage = userProvider.errorMessage;
          });
        }
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        print(errorMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              false, // Đặt thành false để ẩn nút quay trở lại
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập địa chỉ email của bạn.';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
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
                          checkEye ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            checkEye = !checkEye;
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
                        !checkEye, // Ẩn hoặc hiện mật khẩu tùy thuộc vào giá trị của checkEye
                  ),
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
                          // Xử lý khi người dùng nhấn vào "Quên mật khẩu ?"
                          // Thực hiện các hành động cần thiết, ví dụ: hiển thị form lấy lại mật khẩu, gửi yêu cầu lấy lại mật khẩu,...
                        },
                        child: Text(
                          "Quên mật khẩu ?",
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () => _loginPressed(context),
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
                      width: screenWidth,
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Chưa có tài khoản? "),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesWidget.routeRegister);
                          },
                          child: Text(
                            "Đăng Kí Ngay",
                            style: TextStyle(color: Colors.lightBlueAccent),
                          ),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
