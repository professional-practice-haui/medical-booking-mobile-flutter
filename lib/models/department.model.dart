class Department {
  final String departmentId;
  final String avatar;
  final String name;
  final int year;
  final String? leader;
  final String? description;

  const Department({
    required this.departmentId,
    required this.avatar,
    required this.name,
    required this.year,
    this.leader,
    this.description,
  });
}
