import 'dart:convert';

import 'package:agevents/core/enums/event.priority.dart';
import 'package:agevents/core/enums/event.status.dart';
import 'package:agevents/core/enums/event.type.dart';

class EventModel {
  final String id;
  final String name;
  final String date;
  final String description;
  final EventType? eventType;
  final EventStatus? eventStatus;
  final EventPriority? eventPriority;

  EventModel({
    this.id = '',
    required this.name,
    required this.date,
    required this.description,
    this.eventType,
    this.eventStatus,
    this.eventPriority,
  });

  EventModel copyWith({
    String? id,
    String? name,
    String? date,
    String? description,
    EventType? eventType,
    EventStatus? eventStatus,
    EventPriority? eventPriority,
  }) {
    return EventModel(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      description: description ?? this.description,
      eventType: eventType ?? this.eventType,
      eventStatus: eventStatus ?? this.eventStatus,
      eventPriority: eventPriority ?? this.eventPriority,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'title': name,
      'date': date,
      'description': description,
      'category': eventType?.index,
      'status': eventStatus?.index,
      'priority': eventPriority?.index,
    };
  }

  factory EventModel.empty() {
    return EventModel(
      id: '',
      name: '',
      date: '',
      description: '',
    );
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['_id'] ?? '',
      name: map['title'] ?? '',
      date: map['date'] ?? '',
      description: map['description'] ?? '',
      eventType: EventType.values.elementAt(map['category'] ?? 0),
      eventStatus: EventStatus.values.elementAt(map['status'] ?? 0),
      eventPriority: EventPriority.values.elementAt(map['priority'] ?? 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(uuid: $id, name: $name, date: $date, description: $description, eventType: $eventType, eventStatus: $eventStatus, eventPriority: $eventPriority)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.id == id &&
        other.name == name &&
        other.date == date &&
        other.description == description &&
        other.eventType == eventType &&
        other.eventStatus == eventStatus &&
        other.eventPriority == eventPriority;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        date.hashCode ^
        description.hashCode ^
        eventType.hashCode ^
        eventStatus.hashCode ^
        eventPriority.hashCode;
  }
}
