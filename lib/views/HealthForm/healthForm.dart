import 'package:flutter/material.dart';
import 'package:medical_booking_app/baseWidget/AnimationNextScreen.dart';
import 'package:medical_booking_app/models/department.model.dart';
import 'package:medical_booking_app/models/shift.model.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/providers/department.provider.dart';
import 'package:medical_booking_app/providers/heathForm.provider.dart';
import 'package:medical_booking_app/providers/shift.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';

class HealthForm extends StatefulWidget {
  @override
  _HealthFormState createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController namePatientController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cccdController = TextEditingController();
  final TextEditingController bhytController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ngayKhamController = TextEditingController();
  final TextEditingController deniedReasonController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController caKhamController = TextEditingController();
  final TextEditingController doctorController = TextEditingController();
  final TextEditingController chuyenKhoaKhamController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ShiftProvider>().getShifts();
    context.read<DepartmentProvider>().getDepartments();
  }

  @override
  Widget build(BuildContext context) {
    String selectedDoctor;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    User? user = context.watch<UserProvider>().user;
    String? token = context.watch<UserProvider>().token;
    DepartmentProvider departmentProvider =
        Provider.of<DepartmentProvider>(context, listen: false);
    ShiftProvider shiftProvider =
        Provider.of<ShiftProvider>(context, listen: false);
    List<String> genders = ['Nam', 'Nữ', 'Khác'];
    List<Department> departments = departmentProvider.departments;
    List<Shift> shifts = shiftProvider.shifts;
    Shift selectedShift = shifts[0];
    int selectedShiftId = 0;
    String selectedDepartment = departments[0].name;
    String selectedGender = genders[0];
    List<String> departmentNames =
        departments.map((department) => department.name).toList();
    List<String> uniqueDepartmentNames = departmentNames.toSet().toList();
    String errorMessage = '';
    void _submitForm(BuildContext context) async {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        // If the form is valid, submit
        String name = namePatientController.text;
        String phone = phoneNumberController.text;
        String cccd = cccdController.text;
        String bhyt = bhytController.text;
        String dateOfBirth = dateOfBirthController.text;
        String address = addressController.text;
        String ngayKham = ngayKhamController.text;
        String chuyenKhoaKham = chuyenKhoaKhamController.text;
        // Reset form after submission
        HealthFormProvider healthFormProvider =
            Provider.of<HealthFormProvider>(context, listen: false);
        // print(selectedShift);
        // print("Khoa Kham");
        // print(selectedDepartment);
        await healthFormProvider.createHealthForms(
            token!,
            user!.id!,
            namePatientController.text,
            emailController.text,
            phoneNumberController.text,
            selectedShiftId,
            reasonController.text,
            cccdController.text,
            bhyt,
            deniedReasonController.text);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AnimationNextScreen();
          },
        );
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
        if (healthFormProvider.errorMessage != '') {
          setState(() {
            errorMessage = healthFormProvider.errorMessage!;
          });
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
                        "Tạo đơn khám bệnh thất bại",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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
          await showDialog(
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
                        "Tạo đơn khám bệnh thành công",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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
        }
        _formKey.currentState!.reset();
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightBlueAccent,
          toolbarHeight: 80,
          title: Center(
            child: Text(
              'Đặt lịch khám bệnh',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: user != null && token != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Biểu mẫu đặt lịch khám bệnh',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Text(
                              "Họ và tên",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        TextFormField(
                          controller: genderController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          validator: (value) {
                            if (value == "") {
                              return 'Vui lòng nhập đúng họ và tên';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Giới tính",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: selectedGender,
                          items: [
                            DropdownMenuItem(
                              value: null,
                              child: Text(
                                '-Chọn-',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                            ...genders.map((name) {
                              return DropdownMenuItem<String>(
                                value: name,
                                child: Text(
                                  name,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }),
                          ],
                          onChanged: (value) {
                            // setState(() {
                            //   selectedGender = value!;
                            // });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: '-Chọn-',
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng giới tính';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Ngày Sinh",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        TextFormField(
                          controller: dateOfBirthController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            hintText: "dd/mm/yyyy",
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                            if (newDate == null) return;
                            String formattedDate =
                                "${newDate.day}/${newDate.month}/${newDate.year}";
                            setState(() {
                              dateOfBirthController.text = formattedDate;
                            });
                          },
                          readOnly: true,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng chọn ngày sinh.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Số điện thoại",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng nhập số điện thoại';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "CCCD/CMND",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        TextFormField(
                          controller: cccdController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng nhập mã số CCCD của bạn';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Số BHYT",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        TextFormField(
                          controller: bhytController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng nhập mã số BHYT của bạn';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Địa chỉ hiện tại",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng nhập địa chỉ của bạn';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Chuyên khoa khám",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          value: selectedDepartment,
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: null,
                              child: Text(
                                '-Chọn-',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                            ...uniqueDepartmentNames.map((name) {
                              return DropdownMenuItem<String>(
                                value: name,
                                child: Text(
                                  name,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedDepartment = value!;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: '-Chọn-',
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng chọn một khoa';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Ca Khám",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        DropdownButtonFormField<Shift>(
                          value: selectedShift,
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              value: null,
                              child: Text(
                                '-Chọn-',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                            ...shifts.map((Shift s) {
                              return DropdownMenuItem<Shift>(
                                value: s,
                                child: Text(
                                  '${s.time} ${s.date.toIso8601String().split('T')[0]}',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onTap: () {},
                              );
                            }),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedShift = value!;
                              selectedShiftId = value.id;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: '-Chọn-',
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null) {
                              return 'Vui lòng chọn ca khám';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Mô tả về bệnh",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        TextFormField(
                          controller: deniedReasonController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng nhập mô tả của bệnh';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Lí do",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            // Add some space between text and asterisk
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        TextFormField(
                          controller: reasonController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng nhập lí do';
                            }
                            return null;
                          },
                        ),
                        if (errorMessage != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              errorMessage,
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          ),
                        SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _submitForm(context);
                            },
                            child: Text('Đặt lịch khám'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesWidget.routeLogin);
                  },
                  child: Text('Đăng nhập'),
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    namePatientController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
