import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Hồ sơ y tế",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(25, 117, 220, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(250, 250, 250, 0),
        ),
        child: Column(
          children: [
            form(
                "1",
                "2",
                'https://i.pinimg.com/236x/e1/6c/70/e16c704fc0b655e553dd7a1a8a00475d.jpg',
                "4",
                "5",
                "6")
          ],
        ),
      ),
    );
  }

  InkWell form(String formId, String doctorName, String image, String time,
      String shift, String patientName) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(doctorName),
                ClipOval(
                  child: Image.network(
                    image,
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
                Text(time),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Chuyên khoa"),
                Text(shift),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bệnh nhân"),
                Text(patientName),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
