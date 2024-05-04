import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_booking_app/Provider/user.provider.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';

class TitleAppBarMedicalHome extends StatefulWidget {
  const TitleAppBarMedicalHome({super.key});

  @override
  State<TitleAppBarMedicalHome> createState() => _TitleAppBarMedicalHomeState();
}

class _TitleAppBarMedicalHomeState extends State<TitleAppBarMedicalHome> {
  String getCurrentTimePeriod(String? name) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    String status1 = "Buổi sáng hứng khởi";
    String status2 = "Buổi chiều vui vẻ";
    String status3 = "Buổi tối tốt lành";
    if (name != null) {
      if (hour >= 0 && hour < 12) {
        return "Chào ${name}\nBuổi sáng hứng khởi";
      } else if (hour >= 12 && hour < 18) {
        return "Chào ${name}\nBuổi chiều vui vẻ";
      } else {
        return "Chào ${name}\nBuổi tối tốt lành";
      }
    } else {
      if (hour >= 0 && hour < 12) {
        return "Buổi sáng hứng khởi";
      } else if (hour >= 12 && hour < 18) {
        return "Buổi chiều vui vẻ";
      } else {
        return "Buổi tối tốt lành";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<UserProvider>().user;
    String? token = context.watch<UserProvider>().token;
    String timePeriod = getCurrentTimePeriod(user?.fullName);
    void handelLogout(BuildContext context) {
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
                  Center(
                    child: Text(
                      "Bạn đã đăng xuất.Vui lòng đăng nhập.",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // box.remove('token');
                      // box.remove('user');
                      // box.save();
                      context.watch<UserProvider>().logout();
                      // Navigator.pushNamedAndRemoveUntil(
                      //   context,
                      //   RoutesWidget.routeLogin,
                      //   (route) => false, // Remove all routes in the stack
                      // );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
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

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: user != null && token != null
                        ? NetworkImage(user!.avatar!)
                        : NetworkImage(
                            "https://lh3.googleusercontent.com/l1PbMRIFRS4BcOXSyUjbSsi3OKJOdp6ysy0G5w2O-jNCHcRMnWRDXSWNee0MHifq9IMVqLxo23K3A0iMh8UutYMjOUpwyrsxnS-VpO7S=rp-w1080-nu"),
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
                    user != null && token != null
                        ? Container(
                            margin: EdgeInsets.only(left: 12, top: 10),
                            child: InkWell(
                                onTap: () => handelLogout(context),
                                child: Text("Đăng Xuất",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))))
                        : Row(
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
                          ),
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
