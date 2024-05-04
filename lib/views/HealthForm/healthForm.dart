import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/department.model.dart';

class HealthForm extends StatefulWidget {
  @override
  _HealthFormState createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cccdController = TextEditingController();
  final TextEditingController bhytController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ngayKhamController = TextEditingController();
  final TextEditingController chuyenKhoaKhamController =
      TextEditingController();

  // Dropdown menu value and items
  // List<Department> departments = [
  //   Department(
  //       departmentId: "", avatar: "anh1", name: "Khoa tim mạch", year: 2000),
  //   Department(departmentId: "", avatar: "anh1", name: "Khoa mắt", year: 2000),
  //   Department(departmentId: "", avatar: "anh1", name: "Khoa dược", year: 2000),
  //   Department(
  //       departmentId: "", avatar: "anh1", name: "Khoa da liễu", year: 2000),
  //   Department(
  //       departmentId: "", avatar: "anh1", name: "Khoa thần kinh", year: 2000),
  //   Department(
  //       departmentId: "", avatar: "anh1", name: "Khoa tâm lý", year: 2000),
  //   Department(
  //       departmentId: "",
  //       avatar: "anh1",
  //       name: "Khoa Nội cơ – xương – khớp",
  //       year: 2000),
  //   Department(
  //       departmentId: "",
  //       avatar: "anh1",
  //       name: "Khoa Nội thận – tiết niệu",
  //       year: 2000),
  //   Department(
  //       departmentId: "",
  //       avatar: "anh1",
  //       name: "Khoa Y học cổ truyền",
  //       year: 2000),
  //   Department(
  //       departmentId: "",
  //       avatar: "anh1",
  //       name: "Khoa Ngoại tổng hợp",
  //       year: 2000),
  //   Department(
  //       departmentId: "", avatar: "anh1", name: "Khoa Da Liễu", year: 2000),
  //   Department(
  //       departmentId: "",
  //       avatar: "anh1",
  //       name: "Khoa Ngoại thần kinh",
  //       year: 2000),
  //   Department(
  //       departmentId: "",
  //       avatar: "anh1",
  //       name: "Khoa Ngoại thận – tiết niệu",
  //       year: 2000),
  //   Department(
  //       departmentId: "",
  //       avatar: "anh1",
  //       name: "Khoa Răng - hàm – mặt",
  //       year: 2000),
  //   Department(
  //       departmentId: "",
  //       avatar: "anh1",
  //       name: "Khoa Vật lý trị liệu – phục hồi chức năng",
  //       year: 2000),
  // ];

  @override
  Widget build(BuildContext context) {
    String selectedDoctor;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biểu mẫu đặt lịch khám bệnh',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
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
                    controller: fullNameController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                    controller: phoneController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                        "Ảnh CCCS/CMND",
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                  // DropdownButtonFormField<String>(
                  //   items: departments
                  //       .map<DropdownMenuItem<String>>((Department depart) {
                  //     return DropdownMenuItem<String>(
                  //       value: depart.name,
                  //       child: Text(depart.name),
                  //     );
                  //   }).toList(),
                  //   onChanged: (value) {
                  //     setState(() {});
                  //   },
                  //   decoration: InputDecoration(
                  //     contentPadding:
                  //         EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //       borderSide: BorderSide(width: 1),
                  //     ),
                  //     filled: true,
                  //     fillColor: Colors.grey[200],
                  //     hintStyle: TextStyle(color: Colors.grey[600]),
                  //   ),
                  //   style: TextStyle(color: Colors.black),
                  //   validator: (value) {
                  //     if (value == "" || value == null) {
                  //       return 'Vui lòng chọn khoa để khám';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Ngày khám",
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
                    controller: ngayKhamController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                        ngayKhamController.text = formattedDate;
                      });
                    },
                    readOnly: true,
                    validator: (value) {
                      if (value == "" || value == null) {
                        return 'Vui lòng chọn ngày khám';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      child: Text('Đặt lịch khám'),
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

  void _submitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // If the form is valid, submit
      String name = fullNameController.text;
      String phone = phoneController.text;
      String cccd = cccdController.text;
      String bhyt = bhytController.text;
      String dateOfBirth = dateOfBirthController.text;
      String address = addressController.text;
      String ngayKham = ngayKhamController.text;
      String chuyenKhoaKham = chuyenKhoaKhamController.text;
      // Reset form after submission
      _formKey.currentState!.reset();
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    fullNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
