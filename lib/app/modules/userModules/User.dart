class User {
  final String userId;
  final String email;
  final String password;
  final String fullName;
  final String address;
  final String phone;
  final String dateOfBirth;
  final String gender;
  final String avatar;
  final bool isLocked;

  User({
    required this.userId,
    required this.email,
    required this.password,
    required this.fullName,
    required this.address,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.avatar,
    required this.isLocked,
  });
}