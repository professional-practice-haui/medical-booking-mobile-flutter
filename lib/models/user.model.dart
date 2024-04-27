class User {
  final String id;
  final String email;
  final String password;
  final String fullName;
  final String? address;
  final String? phone;
  final String? dateOfBirth;
  final String? genderName;
  final String? avatar;
  final bool? isLocked;
  final String? createdDate;
  final String? lastModifiedDate;
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    this.address,
    this.phone,
    this.dateOfBirth,
    this.genderName,
    this.avatar,
    this.isLocked,
    this.createdDate,
    this.lastModifiedDate
  });
}