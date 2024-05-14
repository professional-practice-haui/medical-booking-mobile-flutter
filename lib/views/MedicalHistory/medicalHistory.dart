import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_booking_app/models/historyForm.model.dart';
import 'package:medical_booking_app/providers/history.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:provider/provider.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  Future<void> _fetchData() async {
    String? token = context.read<UserProvider>().token;
    print("token $token");
    // await Future.delayed(const Duration(seconds: 2));
    context.read<HistoryProvider>().getForms(token == null ? "" : token);
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
        builder: (context, historyProvider, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Hồ sơ y tế",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(25, 117, 220, 1),
        ),
        body: historyProvider.forms.isEmpty
            ? const Text(
                "Chưa có đơn đặt khám",
                textAlign: TextAlign.center,
              )
            : Container(
                decoration: const BoxDecoration(
                  color: Colors.white10,
                ),
                child: ListView.builder(
                    itemCount: historyProvider.forms.length,
                    itemBuilder: (context, index) {
                      return form(historyProvider.forms[index]);
                    })),
      );
    });
  }

  InkWell form(HistoryForm form) {
    String text;
    Color colorBackground;
    Color colorText;
    if (form.status == 0) {
      colorBackground = Colors.yellow.shade100;
      colorText = Colors.orange;
      text = "Đang chờ";
    } else if (form.status == 1) {
      colorBackground = Colors.green.shade100;
      colorText = Colors.green;
      text = "Đã đặt lịch";
    } else {
      colorBackground = Colors.red.shade100;
      colorText = Colors.red;
      text = "Đã hủy";
    }
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorBackground,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    text,
                    style: TextStyle(color: colorText),
                  ),
                ),
                Text("STT ${form.acceptedNumber}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(form.nameDoctor),
                ClipOval(
                  child: Image.network(
                    form.imageDoctor,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Giờ khám"),
                Text(form.time),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Chuyên khoa"),
                Text(form.nameDepartment),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bệnh nhân"),
                Text(form.namePatient),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
