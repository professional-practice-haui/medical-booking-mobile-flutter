import 'package:flutter/material.dart';
class EmailTextField extends StatefulWidget {
  const EmailTextField({super.key,required this.emailController});
  final TextEditingController emailController;
  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  bool isEmailFocused = false;
  late FocusNode emailFocusNode; // FocusNode for tracking the focus state
  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode(); // Initialize the FocusNode
    emailFocusNode.addListener(_emailFocusChange);
  }
  @override
  void dispose() {
    emailFocusNode.removeListener(_emailFocusChange);
    emailFocusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }
  void _emailFocusChange() {
    setState(() {
      isEmailFocused = emailFocusNode.hasFocus;
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
              color: isEmailFocused
                  ? Colors.lightBlueAccent
                  : Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.mail_outline,size: 20,),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: TextFormField(
                    controller: widget.emailController,
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập đầy đủ Email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
