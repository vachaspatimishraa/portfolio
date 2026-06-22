enum TimelineType { education, achievement, milestone, award }

class TimelineItem {
  final String year;
  final String title;
  final String description;
  final TimelineType type;
  final String status;

  TimelineItem({
    required this.year,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
  });

  String get typeLabel => type.toString().split('.').last.toUpperCase();
}
