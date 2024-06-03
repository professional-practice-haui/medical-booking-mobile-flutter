import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/profile.model.dart';
import 'package:medical_booking_app/providers/profile.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/views/InformationAccount/components/profile.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  final Profile? profile;

  const UpdateProfileScreen({super.key, this.profile});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _fullNameController =
        TextEditingController(text: widget.profile!.fullName);
    TextEditingController _phoneNumberController =
        TextEditingController(text: widget.profile!.phoneNumber);
    TextEditingController _dateOfBirthController =
        TextEditingController(text: widget.profile!.dateOfBirth);
    TextEditingController _genderController =
        TextEditingController(text: widget.profile!.gender);
    TextEditingController _addressController =
        TextEditingController(text: widget.profile!.address);
    TextEditingController _emailController =
        TextEditingController(text: widget.profile!.email);
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
      String? token = context.read<UserProvider>().token;
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "Chỉnh sửa thông tin",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(25, 117, 220, 1),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    input(_fullNameController, "Họ và tên", true),
                    input(_phoneNumberController, "Số điện thoại", true),
                    input(_dateOfBirthController, "Ngày sinh", true),
                    input(_genderController, "Giới tính", true),
                    input(_addressController, "Địa chỉ", true),
                    input(_emailController, "Email", false),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      onPressed: () {
                        print("start put");
                        profileProvider.putProfile(
                            token == null ? "" : token,
                            _fullNameController.text,
                            _phoneNumberController.text,
                            _dateOfBirthController.text,
                            _genderController.text,
                            _addressController.text,
                            _emailController.text);

                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cập nhật',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Widget input(TextEditingController controller, String text, bool isLocked) {
    return Column(
      children: [
        TextFormField(
          enabled: isLocked,
          textAlign: TextAlign.left,
          controller: controller,
          decoration: InputDecoration(
            labelText: text,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
