class Profile {
  final String email;
  final String fullName;
  final String address;
  final String phoneNumber;
  final String gender;
  final String dateOfBirth;
  final String password;
  final String avatarUrl;
  final bool isLocked;

  Profile({
    required this.email,
    required this.fullName,
    required this.address,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.password,
    required this.avatarUrl,
    required this.isLocked,
  });
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      email: json['email'],
      fullName: json['fullName'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      password: json['password'],
      avatarUrl: json['avatarUrl'],
      isLocked: json['isLocked'],
    );
  }
}
