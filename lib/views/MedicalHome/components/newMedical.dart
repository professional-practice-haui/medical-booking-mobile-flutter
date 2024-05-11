import 'package:flutter/material.dart';

class NewMedical extends StatelessWidget {
  const NewMedical(
      {super.key, required this.imageWidth, required this.imageHeght});
  final double imageWidth, imageHeght;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      child: Column(children: [
        Row(
          children: [
            Icon(
              Icons.feed_outlined,
              color: Colors.lightBlueAccent,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Tin Y tế",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/images/anhyte.jpg",
            width: imageWidth,
            height: imageHeght,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "Thuốc lá là nguyên nhân gây ra nhiều bệnh nguy hiểm đặc biệt là có gây ra tử vong.",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ]),
    );
  }
}
