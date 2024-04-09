import 'package:flutter/material.dart';
class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key,required this.passwordController,required this.hintText});
  final TextEditingController passwordController;
  final String hintText;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordFocused = false;
  bool isChecked = false;
  bool checkEye = false;
  late FocusNode passwordFocusNode; // FocusNode for tracking the focus state
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode(); // Initialize the FocusNode
    passwordFocusNode.addListener(_passwordFocusChange);
  }
  void _passwordFocusChange() {
    setState(() {
      isPasswordFocused = passwordFocusNode.hasFocus;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: isPasswordFocused
                  ? Colors.lightBlueAccent
                  : Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.lock,size: 20,),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: TextField(
                    controller: widget.passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: checkEye ? false : true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              setState(() {
                checkEye = !checkEye;
              });
            },
            icon: Icon(
              checkEye
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
