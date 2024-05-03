import 'package:flutter/material.dart';
class FullNameTextField extends StatefulWidget {
  const FullNameTextField({super.key,required this.fullNameController});
  final TextEditingController fullNameController;
  @override
  State<FullNameTextField> createState() => _FullNameTextFieldState();
}

class _FullNameTextFieldState extends State<FullNameTextField> {
  bool isUserNameFocused = false;
  late FocusNode userNameFocusNode; // FocusNode for tracking the focus state
  @override
  void initState() {
    super.initState();
    userNameFocusNode = FocusNode(); // Initialize the FocusNode
    userNameFocusNode.addListener(_onUserNameFocusChange);
  }
  @override
  void dispose() {
    userNameFocusNode.removeListener(_onUserNameFocusChange);
    userNameFocusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }
  void _onUserNameFocusChange() {
    setState(() {
      isUserNameFocused = userNameFocusNode.hasFocus;
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
              color: isUserNameFocused
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
                child: Icon(Icons.person,size: 20,),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: TextFormField(
                    controller: widget.fullNameController,
                    focusNode: userNameFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập đầy đủ họ tên!';
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
