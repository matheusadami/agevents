class GraphicModel {
  final int touchedSection;
  final double percentagePersonalEvents;
  final double percentageStudyEvents;
  final double percentageWorkEvents;

  GraphicModel({
    this.touchedSection = -1,
    required this.percentagePersonalEvents,
    required this.percentageStudyEvents,
    required this.percentageWorkEvents,
  });

  GraphicModel copyWith({
    int? touchedSection,
    double? percentagePersonalEvents,
    double? percentageStudyEvents,
    double? percentageWorkEvents,
  }) {
    return GraphicModel(
      touchedSection: touchedSection ?? this.touchedSection,
      percentagePersonalEvents:
          percentagePersonalEvents ?? this.percentagePersonalEvents,
      percentageStudyEvents:
          percentageStudyEvents ?? this.percentageStudyEvents,
      percentageWorkEvents: percentageWorkEvents ?? this.percentageWorkEvents,
    );
  }
}
