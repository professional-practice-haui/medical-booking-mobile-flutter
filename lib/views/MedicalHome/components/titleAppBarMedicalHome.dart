import 'package:flutter/material.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:medical_booking_app/views/MedicalLogin/login.dart';
class TitLeAppBarHomeMedical extends StatelessWidget {
  const TitLeAppBarHomeMedical({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(12, 10, 0, 0),
                      child: Text(
                        "Buổi sáng hứng khởi",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                RoutesWidget.routeRegister
                            );
                          },
                          child: const Text(
                            "Đăng ký",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text("/", style: TextStyle(color: Colors.white)),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                RoutesWidget.routeLogin
                            );
                          },
                          child: const Text(
                            "Đăng Nhập",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_rounded,
                    color: Colors.white)
            )
          ],
        ),
      ],
    );
  }
}
