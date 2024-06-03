class HistoryForm {
  final int status;
  final int acceptedNumber;
  final String nameDoctor;
  final String imageDoctor;
  final String time;
  final String date;
  final String nameDepartment;
  final String namePatient;
  final String email;
  final String phoneNumber;
  final String reason;
  final String cccd;
  final String bhyt;
  HistoryForm({
    required this.status,
    required this.acceptedNumber,
    required this.nameDoctor,
    required this.imageDoctor,
    required this.time,
    required this.date,
    required this.nameDepartment,
    required this.namePatient,
    required this.email,
    required this.phoneNumber,
    required this.reason,
    required this.cccd,
    required this.bhyt,
  });
  factory HistoryForm.fromJson(Map<String, dynamic> json) {
    return HistoryForm(
      status: json['status'] as int,
      acceptedNumber: json['acceptedNumber'] as int,
      nameDoctor: json['shift']['doctor']['name'] as String,
      imageDoctor: json['shift']['doctor']['image'] as String,
      time: json['shift']['time'] as String,
      date: json['shift']['date'] as String,
      nameDepartment: json['shift']['doctor']['department']['name'] as String,
      namePatient: json['namePatient'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      reason: json['reason'] as String,
      cccd: json['cccd'] as String,
      bhyt: json['bhyt'] as String,
    );
  }
}
