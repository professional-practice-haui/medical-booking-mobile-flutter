class HealthForm {
  final int id;
  final int userId;
  final String namePatient;
  final String email;
  final String phoneNumber;
  final String shiftId;
  final String reason;
  final String cccd;
  final String bhyt;
  final String deniedReason;

  HealthForm({
    required this.id,
    required this.userId,
    required this.namePatient,
    required this.email,
    required this.phoneNumber,
    required this.shiftId,
    required this.reason,
    required this.cccd,
    required this.bhyt,
    required this.deniedReason,
  });

  factory HealthForm.fromJson(Map<String, dynamic> json) {
    return HealthForm(
      id: json['id'],
      userId: json['userId'],
      namePatient: json['namePatient'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      shiftId: json['shiftId'],
      cccd: json['cccd'],
      bhyt: json['bhyt'],
      reason: json['reason'],
      deniedReason: json['deniedReason'],
    );
  }
}
