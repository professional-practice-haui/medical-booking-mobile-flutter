class Profile {
  // final String createdDate;
  // final String lastModifiedDate;
  // final int id;
  final String fullName;
  final String email;
  final String address;
  final String phoneNumber;
  final String gender;
  final String dateOfBirth;
  // final String avatar;
  // final bool isLocked;
  // final List<String> roles;
  Profile({
    // required this.createdDate,
    // required this.lastModifiedDate,
    // required this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    // required this.avatar,
    // required this.isLocked,
    // required this.roles,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      // createdDate: json['createdDate'],
      // lastModifiedDate: json['lastModifiedDate'],
      // id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      // avatar: json['avatar'],
      // isLocked: json['isLocked'],
      // roles: List<String>.from(json['roles']),
    );
  }
}
