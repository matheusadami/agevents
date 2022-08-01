import 'dart:convert';

import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.type.dart';

class EventModel {
  final String uuid;
  final String name;
  final String date;
  final String description;
  final EventType? eventType;
  final EventPriority? eventPriority;

  EventModel({
    this.uuid = '',
    required this.name,
    required this.date,
    required this.description,
    this.eventType,
    this.eventPriority,
  });

  EventModel copyWith({
    String? uuid,
    String? name,
    String? date,
    String? description,
    EventType? eventType,
    EventPriority? eventPriority,
  }) {
    return EventModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      date: date ?? this.date,
      description: description ?? this.description,
      eventType: eventType ?? this.eventType,
      eventPriority: eventPriority ?? this.eventPriority,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'date': date,
      'description': description,
      'eventType': eventType?.index,
      'eventPriority': eventPriority?.index,
    };
  }

  factory EventModel.empty() {
    return EventModel(
      uuid: '',
      name: '',
      date: '',
      description: '',
    );
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
      date: map['date'] ?? '',
      description: map['description'] ?? '',
      eventType: EventType.values.elementAt(map['eventType'] ?? 0),
      eventPriority: EventPriority.values.elementAt(map['eventPriority'] ?? 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(uuid: $uuid, name: $name, date: $date, description: $description, eventType: $eventType, eventPriority: $eventPriority)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.uuid == uuid &&
        other.name == name &&
        other.date == date &&
        other.description == description &&
        other.eventType == eventType &&
        other.eventPriority == eventPriority;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        name.hashCode ^
        date.hashCode ^
        description.hashCode ^
        eventType.hashCode ^
        eventPriority.hashCode;
  }
}
