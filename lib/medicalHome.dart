import 'package:flutter/material.dart';
import 'package:medical_booking_app/listDoctor.dart';
import 'package:medical_booking_app/navbarMedicalHome.dart';

// class MedicalHome extends StatefulWidget {
//   const MedicalHome({super.key});
//
//   @override
//   State<MedicalHome> createState() => MedicalHomeState();
// }
//
// class MedicalHomeState extends State<MedicalHome> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(25, 117, 220, 1),
//         title: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.person,
//                           color: Colors.white,
//                         )),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.fromLTRB(12, 10, 0, 0),
//                           child: Text(
//                             "Buổi sáng hứng khởi",
//                             style: TextStyle(color: Colors.white, fontSize: 12),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 "Đăng ký",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             Text("/", style: TextStyle(color: Colors.white)),
//                             TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 "Đăng ký",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.notifications_none_rounded,
//                         color: Colors.white))
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           NavbarMedicalHome(imageWidth: screenWidth, imageHeight: screenHeight/4),
//           Row(
//             children: [
//               const Icon(
//                 Icons.person,
//                 color: Colors.blue,
//               ),
//               Text(
//                 "Bác Sĩ",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//           ListDoctor(imageWidth: screenWidth/6,)
//         ],
//       ),
//     );
//   }
// }
class MedicalHome extends StatelessWidget {
  const MedicalHome({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 117, 220, 1),
        title: Column(
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
                              onPressed: () {},
                              child: const Text(
                                "Đăng ký",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text("/", style: TextStyle(color: Colors.white)),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Đăng ký",
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
                        color: Colors.white))
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          NavbarMedicalHome(
              imageWidth: screenWidth, imageHeight: screenHeight / 3.5),
          Row(
            children: [
              const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              Text(
                "Bác Sĩ",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          ListDoctor(
            imageWidth: screenWidth / 6,
          )
        ],
      ),
    );
  }
}
