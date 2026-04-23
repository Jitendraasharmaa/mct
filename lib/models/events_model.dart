class EventModel {
  final String id;
  final int day;
  final String month;
  final String eventName;
  final String templeName;
  final String time;

  EventModel({
    required this.id,
    required this.day,
    required this.month,
    required this.eventName,
    required this.templeName,
    required this.time,
  });

  factory EventModel.fromMap(String id, Map<dynamic, dynamic> map) {
    return EventModel(
      id: id,
      day: map['day'] ?? 0,
      month: map['month'] ?? '',
      eventName: map['eventName'] ?? '',
      templeName: map['templeName'] ?? '',
      time: map['time'] ?? '',
    );
  }
}