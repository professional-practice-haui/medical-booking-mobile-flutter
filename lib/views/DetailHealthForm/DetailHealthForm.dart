import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/historyForm.model.dart';

class DetailHealthForm extends StatelessWidget {
  DetailHealthForm({super.key, required this.historyForm});
  final HistoryForm historyForm;

  @override
  Widget build(BuildContext context) {
    Color colorBackground;
    Color colorText;
    String text;

    if (historyForm.status == 0) {
      colorBackground = Colors.yellow.shade100;
      colorText = Colors.orange;
      text = "Đang chờ";
    } else if (historyForm.status == 1) {
      colorBackground = Colors.green.shade100;
      colorText = Colors.green;
      text = "Đã đặt lịch";
    } else {
      colorBackground = Colors.red.shade100;
      colorText = Colors.red;
      text = "Đã hủy";
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "Thông tin chi tiết đơn khám",
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFF1976D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(historyForm.imageDoctor),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          historyForm.nameDoctor,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          historyForm.nameDepartment,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: colorText,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              _detailRow("Email", historyForm.email),
              SizedBox(height: 8),
              _detailRow("Số điện thoại", historyForm.phoneNumber),
              SizedBox(height: 8),
              _detailRow("Ngày khám", historyForm.date),
              SizedBox(height: 8),
              _detailRow("Ca khám", historyForm.time),
              SizedBox(height: 8),
              _detailRow("Tên bệnh nhân", historyForm.namePatient),
              SizedBox(height: 8),
              _detailRow("Lý do khám bệnh", historyForm.reason),
              SizedBox(height: 8),
              Text("Ảnh CCCD/CMND:",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 8),
              Image.network(
                historyForm.cccd,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8),
              Text(
                "Ảnh Bhyt:",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Image.network(
                historyForm.bhyt,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              if (historyForm.status == 1)
                Row(
                  children: [
                    Icon(Icons.check_circle, size: 16, color: Colors.green),
                    SizedBox(width: 8),
                    Text(
                      'Appointment Accepted',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
