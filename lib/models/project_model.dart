class ProjectModel {
  final int id;
  final String title;
  final String category; // 'featured', 'work', 'personal'
  final String description;
  final String gradientStart;
  final String gradientEnd;
  final List<String> techStack;
  final Map<String, String> metrics;
  final String? githubUrl;
  final String? liveUrl;
  final DateTime startDate;
  final DateTime endDate;
  final String? imagePath;

  ProjectModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.gradientStart,
    required this.gradientEnd,
    required this.techStack,
    required this.metrics,
    this.githubUrl,
    this.liveUrl,
    required this.startDate,
    required this.endDate,
    this.imagePath,
  });

  String get dateRange => '${startDate.toString().split(' ')[0]} – ${endDate.toString().split(' ')[0]}';
}
