class Department {
  final int departmentId;
  final String image;
  final String name;
  final String? nameLeader;
  final String? description;

  const Department({
    required this.departmentId,
    required this.image,
    required this.name,
    this.nameLeader,
    this.description,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      departmentId: json['id'],
      name: json['name'],
      nameLeader: json['nameLeader'],
      description: json['description'],
      image: json['image'],
    );
  }
}
