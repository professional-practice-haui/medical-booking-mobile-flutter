import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_booking_app/baseWidget/AnimationNextScreen.dart';
import 'package:medical_booking_app/baseWidget/Dialog.dart';
import 'package:medical_booking_app/models/department.model.dart';
import 'package:medical_booking_app/models/shift.model.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/providers/department.provider.dart';
import 'package:medical_booking_app/providers/heathForm.provider.dart';
import 'package:medical_booking_app/providers/shift.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:medical_booking_app/services/healthForm.service.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as img;

class HealthForm extends StatefulWidget {
  @override
  _HealthFormState createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> departments = [];
  List<DropdownMenuItem<String>> shifts = [];
  List<DropdownMenuItem<String>> doctors = [];
  List<DropdownMenuItem<String>> ngayKhams = [];
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

  void convertToPng(String imagePath) {
    var image = img.decodeImage(File(imagePath).readAsBytesSync())!;
    File('$imagePath.png').writeAsBytesSync(img.encodePng(image));
  }

  String? selectedDepartment,
      selectedCccd,
      selectedBhyt,
      selectedDoctor,
      selectedNgayKham;
  String? selectedShift;
  late int selectedShiftId;
  void getAddress(BuildContext context) {
    context.watch<DepartmentProvider>().isLoading
        ? departments = []
        : departments =
            context.watch<DepartmentProvider>().departments.map((department) {
            return DropdownMenuItem(
                value: department.name, child: Text("${department.name}"));
          }).toList();
    List<Shift> shiftTime = context.watch<ShiftProvider>().shifts;
    Map<String, Shift> uniqueShiftsMap = {};
    Map<DateTime, Shift> dateTimeShiftsMap = {};
    for (Shift shift in context.watch<ShiftProvider>().shifts) {
      uniqueShiftsMap[shift.time] = shift;
      dateTimeShiftsMap[shift.date] = shift;
    }
    List<Shift> uniqueShiftsList = uniqueShiftsMap.values.toList();
    List<Shift> dateShiftsList = dateTimeShiftsMap.values.toList();
    context.watch<ShiftProvider>().isLoading
        ? shifts = []
        : shifts = uniqueShiftsList.map((shift) {
            return DropdownMenuItem(
              value: "${shift.time}",
              child: Text("${shift.time}"),
              onTap: () {
                setState(() {
                  selectedShiftId = shiftTime
                      .firstWhere((element) =>
                          element.date == shift.date &&
                          element.time == shift.time)
                      .id;
                });
              },
            );
          }).toList();

    context.watch<ShiftProvider>().isLoading
        ? doctors = []
        : doctors = shiftTime.map((shift) {
            return DropdownMenuItem(
              value: "${shift.doctorName}",
              child: Text("${shift.doctorName}"),
              onTap: () {},
            );
          }).toList();
    context.watch<ShiftProvider>().isLoading
        ? ngayKhams = []
        : ngayKhams = dateShiftsList.map((shift) {
            return DropdownMenuItem(
              value:
                  "${shift.date.toIso8601String().split('T')[0].split('-').reversed.join('-')}",
              child: Text(
                  "${shift.date.toIso8601String().split('T')[0].split('-').reversed.join('-')}"),
              onTap: () {},
            );
          }).toList();
  }

  @override
  Widget build(BuildContext context) {
    getAddress(context);
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    User? user = context.watch<UserProvider>().user;
    String? token = context.watch<UserProvider>().token;
    List<String> genders = ['Nam', 'Nữ', 'Khác'];
    context.watch<ShiftProvider>().shifts;

    String selectedGender = genders[0];
    String errorMessage = '';
    void _submitForm(BuildContext context) async {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        String name = namePatientController.text;
        String phone = phoneNumberController.text;
        String cccd = cccdController.text;
        String bhyt = bhytController.text;
        String dateOfBirth = dateOfBirthController.text;
        String address = addressController.text;
        String ngayKham = ngayKhamController.text;
        String chuyenKhoaKham = chuyenKhoaKhamController.text;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AnimationNextScreen();
          },
        );

        int status = await HealthFormService.createHealthForm(
          token!,
          namePatientController.text,
          emailController.text,
          phoneNumberController.text,
          selectedShiftId,
          reasonController.text,
          selectedCccd!,
          selectedBhyt!,
        );
        // await Future.delayed(Duration(milliseconds: 100));
        Navigator.pop(context);
        if (status != 201) {
          showFaildDiaLog(context, "Tạo đơn khám bệnh thất bại");
        } else {
          showSuccessDiaLog(context, "Tạo đơn khám bệnh thành công");
          namePatientController.clear();
          phoneNumberController.clear();
          cccdController.clear();
          bhytController.clear();
          dateOfBirthController.clear();
          addressController.clear();
          ngayKhamController.clear();
          chuyenKhoaKhamController.clear();
          reasonController.clear();
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
          title: const Center(
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
                        rowWidget("Tên bệnh nhân"),
                        TextFormField(
                          controller: namePatientController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(width: 1),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              hintText: "Ví dụ: Nguyễn Duy Sơn"),
                          validator: (value) {
                            if (value == "") {
                              return 'Vui lòng nhập đúng họ và tên';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        rowWidget("Email"),
                        TextFormField(
                          controller: emailController,
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
                              hintText: "Ví dụ: abc@gmail.com"),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng nhập đúng email của bạn';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Số điện thoại",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(width: 1),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              hintText: "Ví dụ: 0999898987"),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),
                        rowWidget("CCCD/CMND"),
                        Column(
                          children: [
                            TextFormField(
                              controller: cccdController,
                              readOnly: true,
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
                                prefixIcon: Icon(Icons.image),
                                hintText: "Chọn ảnh",
                              ),
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return 'Vui lòng tải ảnh CCCD của bạn';
                                }
                                return null;
                              },
                              onTap: () async {
                                final picker = ImagePicker();
                                final pickedFile = await picker.pickImage(
                                    source:
                                        ImageSource.gallery); // Mở thư viện ảnh
                                if (pickedFile != null) {
                                  // Nếu đã chọn ảnh, gán đường dẫn của ảnh vào controller
                                  setState(() {
                                    selectedCccd = pickedFile.path;
                                  });
                                  cccdController.text = selectedCccd!;
                                  convertToPng(cccdController.text);
                                  convertToPng(selectedCccd!);
                                  cccdController.text =
                                      path.basename(cccdController.text);
                                }
                              },
                            ),
                            if (selectedCccd != null)
                              Column(
                                children: [
                                  SizedBox(
                                      height: 10), // Thêm SizedBox trước ảnh
                                  Image.file(
                                    File(selectedCccd!),
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "BHYT",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            TextFormField(
                              controller: bhytController,
                              readOnly: true,
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
                                prefixIcon: Icon(Icons.image),
                                hintText: "Chọn ảnh",
                              ),
                              onTap: () async {
                                final picker = ImagePicker();
                                final pickedFile = await picker.pickImage(
                                    source:
                                        ImageSource.gallery); // Mở thư viện ảnh
                                if (pickedFile != null) {
                                  // Nếu đã chọn ảnh, gán đường dẫn của ảnh vào controller
                                  setState(() {
                                    selectedBhyt = pickedFile.path;
                                  });
                                  bhytController.text = selectedBhyt!;
                                  convertToPng(bhytController.text);
                                  convertToPng(selectedBhyt!);
                                  bhytController.text =
                                      path.basename(bhytController.text);
                                }
                              },
                            ),
                            if (selectedBhyt != null)
                              Column(
                                children: [
                                  SizedBox(height: 10),
                                  Image.file(
                                    File(selectedBhyt!),
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              )
                          ],
                        ),
                        const SizedBox(height: 20),
                        rowWidget("Địa chỉ hiện tại"),
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
                              hintText: "Ví dụ: Hà Nội"),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return 'Vui lòng nhập địa chỉ của bạn';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        rowWidget("Chuyên khoa khám"),
                        DropdownButtonFormField<String>(
                          value: selectedDepartment,
                          isExpanded: true,
                          items: departments,
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
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng chọn một khoa';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        rowWidget("Bác sĩ khám"),
                        DropdownButtonFormField<String>(
                          value: selectedDoctor,
                          isExpanded: true,
                          items: doctors,
                          onChanged: (value) {
                            setState(() {
                              selectedDoctor = value!;
                            });
                          },
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
                            hintText: '-Chọn-',
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        rowWidget("Ca khám"),
                        DropdownButtonFormField<String>(
                          value: selectedShift,
                          isExpanded: true,
                          items: shifts,
                          onChanged: (value) {
                            setState(() {
                              selectedShift = value!;
                            });
                          },
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
                            hintText: '-Chọn-',
                          ),
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null) {
                              return 'Vui lòng chọn ca khám';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        rowWidget("Ngày khám"),
                        DropdownButtonFormField<String>(
                          value: selectedNgayKham,
                          isExpanded: true,
                          items: ngayKhams,
                          onChanged: (value) {
                            setState(() {
                              selectedNgayKham = value!;
                            });
                          },
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
                            hintText: '-Chọn-',
                          ),
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null) {
                              return 'Vui lòng chọn ngày khám ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        rowWidget("Lí do"),
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
                              hintText: "Ví dụ: đi trời mưa, bị ngã xe,..."),
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
  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    namePatientController.dispose();
    genderController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    cccdController.dispose();
    bhytController.dispose();
    addressController.dispose();
    ngayKhamController.dispose();
    deniedReasonController.dispose();
    reasonController.dispose();
    caKhamController.dispose();
    doctorController.dispose();
    chuyenKhoaKhamController.dispose();

    super.dispose();
  }

  Widget rowWidget(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        const Text(
          '*',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
