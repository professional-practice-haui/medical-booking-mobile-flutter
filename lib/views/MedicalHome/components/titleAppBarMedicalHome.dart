import 'package:flutter/material.dart';
import 'package:medical_booking_app/main.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';

class TitLeAppBarHomeMedical extends StatelessWidget {
  const TitLeAppBarHomeMedical({super.key});

  // Hàm để xác định buổi của ngày hiện tại
  String getCurrentTimePeriod() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return "Buổi sáng hứng khởi";
    } else if (hour >= 12 && hour < 18) {
      return "Buổi chiều vui vẻ";
    } else {
      return "Buổi tối tốt lành";
    }
  }

  @override
  Widget build(BuildContext context) {
    String timePeriod = getCurrentTimePeriod(); // Lấy buổi của ngày hiện tại
    var user = context.watch<UserData>().user;
    var accessToken = context.watch<UserData>().accessToken;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, RoutesWidget.routeInformationAccount);
                  },
                  child: CircleAvatar(
                    backgroundImage: user.avatar!=null?NetworkImage(user.avatar.toString()):NetworkImage("https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-2.jpg"),
                    radius: 15, // Đặt bán kính của ảnh vòng tròn
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(12, 10, 0, 0),
                      child: Text(
                        timePeriod, // Hiển thị buổi tương ứng
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
                              RoutesWidget.routeRegister,
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
                              RoutesWidget.routeLogin,
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
              icon: Icon(Icons.notifications_none_rounded, color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
