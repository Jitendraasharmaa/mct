class EventModel {
  final int day;
  final int month;
  final String eventName;
  final String templeName;
  final String time;

  EventModel({
    required this.day,
    required this.month,
    required this.eventName,
    required this.templeName,
    required this.time,
  });

  factory EventModel.fromMap(Map<dynamic, dynamic> map) {
    return EventModel(
      day: map['day'] ?? 0,
      month: map['month'] ?? 0,
      eventName: map['eventName'] ?? '',
      templeName: map['templeName'] ?? '',
      time: map['time'] ?? '',
    );
  }
}
