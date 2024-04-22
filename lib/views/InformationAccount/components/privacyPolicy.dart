import 'package:flutter/material.dart';

class privacyPolicy extends StatelessWidget {
  const privacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Điều khoản sử dụng",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(25, 117, 220, 1),
      ),
      body: Column(children: [],)
    );
  }
}
