import 'dart:io';
import 'package:http/http.dart' as http;

class HealthFormService {
  static Future<int> createHealthForm(
      String token,
      String namePatient,
      String email,
      String phoneNumber,
      int shiftId,
      String reason,
      String cccdImagePath, // Đường dẫn của ảnh CCCD
      String bhytImagePath,
      String address // Đường dẫn của ảnh BHYT
      ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://medical-booking-be-spring.onrender.com/api/v1/health-forms'),
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['namePatient'] = namePatient;
    request.fields['email'] = email;
    request.fields['phoneNumber'] = phoneNumber;
    request.fields['shift'] = shiftId.toString();
    request.fields['reason'] = reason;
    request.fields['address'] = address;
    // Đọc nội dung của ảnh CCCD và thêm vào yêu cầu
    if (cccdImagePath.isNotEmpty) {
      File cccdImageFile = File(cccdImagePath);
      if (cccdImageFile.existsSync()) {
        request.files.add(await http.MultipartFile.fromPath(
          'cccd',
          cccdImagePath,
          filename: 'cccd_image.jpg', // Tên tệp trên server
        ));
      }
    }

    // Đọc nội dung của ảnh BHYT và thêm vào yêu cầu
    if (bhytImagePath.isNotEmpty) {
      File bhytImageFile = File(bhytImagePath);
      if (bhytImageFile.existsSync()) {
        request.files.add(await http.MultipartFile.fromPath(
          'bhyt',
          bhytImagePath,
          filename: 'bhyt_image.jpg', // Tên tệp trên server
        ));
      }
    }
    var response = await request.send();

    return response.statusCode;
  }
}
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as img;

// class HealthFormService {
//   static Future<int> createHealthForm(
//     String token,
//     String namePatient,
//     String email,
//     String phoneNumber,
//     int shiftId,
//     String reason,
//     String cccdImagePath, // Đường dẫn của ảnh CCCD
//     String bhytImagePath, // Đường dẫn của ảnh BHYT
//   ) async {
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse(
//           'https://medical-booking-be-spring.onrender.com/api/v1/health-forms'),
//     );
//     request.headers['Authorization'] = 'Bearer $token';
//     request.fields['namePatient'] = namePatient;
//     request.fields['email'] = email;
//     request.fields['phoneNumber'] = phoneNumber;
//     request.fields['shift'] = shiftId.toString();
//     request.fields['reason'] = reason;
//     if (cccdImagePath.isNotEmpty) {
//       File cccdImageFile = File(cccdImagePath);
//       if (cccdImageFile.existsSync()) {
//         List<int> cccdImageBytes = await cccdImageFile.readAsBytes();

//         request.files.add(http.MultipartFile.fromBytes(
//           'cccd',
//           cccdImageBytes,
//           filename: 'cccd_image.png', // Tên tệp trên server
//         ));
//       }
//     }

//     // Chuyển đổi ảnh BHYT thành .png hoặc .jpg nếu cần
//     if (bhytImagePath.isNotEmpty) {
//       File bhytImageFile = File(bhytImagePath);
//       if (bhytImageFile.existsSync()) {
//         List<int> bhytImageBytes = await bhytImageFile.readAsBytes();

//         request.files.add(http.MultipartFile.fromBytes(
//           'bhyt',
//           bhytImageBytes,
//           filename: 'bhyt_image.png', // Tên tệp trên server
//         ));
//       }
//     }

//     var response = await request.send();

//     return response.statusCode;
//   }
// }
