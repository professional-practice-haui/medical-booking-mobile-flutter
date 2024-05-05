class Shift {
  final int id;
  final DateTime date;
  final String time;
  final String place;
  final int maxSlot;

  Shift({
    required this.id,
    required this.date,
    required this.time,
    required this.place,
    required this.maxSlot,
  });

  // Factory constructor to create a Shift object from JSON data
  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      id: json['id'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      place: json['place'],
      maxSlot: json['maxSlot'],
    );
  }
}
