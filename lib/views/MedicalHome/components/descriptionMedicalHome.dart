import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_booking_app/routes/routes.dart';

class DescriptionMedicalHome extends StatelessWidget {
  const DescriptionMedicalHome(
      {Key? key, required this.imageHeight, required this.imageWidth});

  final double imageHeight, imageWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(left: 15, right: 15),
          width: imageWidth,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(imageHeight / 8.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: imageWidth / 1.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Đăng ký thành viên",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            child: Text(
                              "Trở thành thành viên để trải nghiệm những tiện ích chăm sóc sức khoẻ từ YouMed.",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.crown,
                      size: 40,
                      color: Color.fromRGBO(255, 241, 0, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: imageWidth,
          margin: EdgeInsets.only(left: 15, right: 15, top: 0,bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutesWidget.routeRegister);
            },
            child: Text("ĐĂNG KÍ NGAY",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              backgroundColor: Colors.lightBlueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
