// lib/models/project_model.dart

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
  });

  String get dateRange => '${startDate.toString().split(' ')[0]} – ${endDate.toString().split(' ')[0]}';
}

// lib/models/skill_model.dart

class SkillCategory {
  final String category;
  final List<String> skills;
  final String icon;

  SkillCategory({
    required this.category,
    required this.skills,
    required this.icon,
  });
}

// lib/models/timeline_model.dart

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

// lib/models/stat_model.dart

class StatItem {
  final String number;
  final String label;

  StatItem({
    required this.number,
    required this.label,
  });
}

// lib/models/contact_model.dart

class ContactInfo {
  final String platform;
  final String value;
  final String url;
  final String icon;

  ContactInfo({
    required this.platform,
    required this.value,
    required this.url,
    required this.icon,
  });
}
