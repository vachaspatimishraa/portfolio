// lib/data/portfolio_data.dart

import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/timeline_model.dart';
import '../models/stat_model.dart';
import '../models/contact_model.dart';

class PortfolioData {
  static final List<ProjectModel> projects = [
    ProjectModel(
      id: 1,
      title: 'PrepMateAI',
      category: 'featured',
      description: 'AI-powered platform with resume builder, ATS score analysis, and skill gap detection',
      gradientStart: '#667eea',
      gradientEnd: '#764ba2',
      techStack: ['Flutter', 'Riverpod', 'REST APIs', 'Firebase'],
      metrics: {},
      githubUrl: 'https://github.com/vachaspatimishraa',
      liveUrl: 'https://github.com/vachaspatimishraa',
      startDate: DateTime(2026, 2),
      endDate: DateTime(2026, 3),
      imagePath: 'assets/images/projects/prepmate_ai.png',
    ),
    ProjectModel(
      id: 2,
      title: 'Connectify',
      category: 'featured',
      description: 'Real-time messaging platform with end-to-end encryption and rich media support',
      gradientStart: '#f093fb',
      gradientEnd: '#f5576c',
      techStack: ['Flutter', 'Firebase', 'Riverpod', 'FCM'],
      metrics: {},
      githubUrl: 'https://github.com/vachaspatimishraa',
      liveUrl: 'https://github.com/vachaspatimishraa',
      startDate: DateTime(2025, 2),
      endDate: DateTime(2025, 3),
      imagePath: 'assets/images/projects/connectify.png',
    ),
  ];

  static final List<SkillCategory> skills = [
    SkillCategory(
      category: 'Mobile',
      icon: 'mobile',
      skills: [
        'Flutter',
        'Dart',
        'Firebase',
        'SQLite',
        'Responsive UI',
      ],
    ),
    SkillCategory(
      category: 'State Management',
      icon: 'layers',
      skills: [
        'Riverpod',
        'Provider',
        'GetX',
        'BLoC Pattern',
      ],
    ),
    SkillCategory(
      category: 'Backend & APIs',
      icon: 'server',
      skills: [
        'REST APIs',
        'Python',
        'Django',
        'Firebase',
        'Authentication',
      ],
    ),
    SkillCategory(
      category: 'Tools & Concepts',
      icon: 'tool',
      skills: [
        'Git/GitHub',
        'Android Studio',
        'VS Code',
        'Clean Architecture',
        'OOP',
        'DSA',
      ],
    ),
  ];

  static final List<StatItem> stats = [
    StatItem(number: '20+', label: 'Projects Completed'),
    StatItem(number: '50K+', label: 'Users Impacted'),
    StatItem(number: '99.8%', label: 'Code Quality'),
  ];

  static final List<TimelineItem> timeline = [
    TimelineItem(
      year: '2026',
      title: 'B.Tech (AKTU)',
      description: 'Dr. A.P.J. Abdul Kalam Technical University, Uttar Pradesh',
      status: 'Expected',
      type: TimelineType.education,
    ),
    TimelineItem(
      year: '2025',
      title: 'PrepMateAI',
      description: 'AI-powered career platform with resume builder and ATS analysis',
      status: '',
      type: TimelineType.achievement,
    ),
    TimelineItem(
      year: '2024',
      title: 'Connectify',
      description: 'Real-time messaging platform with Firebase and Riverpod',
      status: '',
      type: TimelineType.achievement,
    ),
    TimelineItem(
      year: '2022',
      title: 'Intermediate (Class XII)',
      description: 'Uttar Pradesh State Board - 1st Division',
      status: '',
      type: TimelineType.education,
    ),
    TimelineItem(
      year: '2020',
      title: 'Matriculation (Class X)',
      description: 'Uttar Pradesh State Board - 1st Division',
      status: '',
      type: TimelineType.education,
    ),
  ];

  static final List<ContactInfo> contactLinks = [
    ContactInfo(
      platform: 'Email',
      value: 'vachaspatimishra@outlook.in',
      url: 'mailto:vachaspatimishra@outlook.in',
      icon: 'email',
    ),
    ContactInfo(
      platform: 'GitHub',
      value: 'vachaspatimishraa',
      url: 'https://github.com/vachaspatimishraa',
      icon: 'github',
    ),
    ContactInfo(
      platform: 'LinkedIn',
      value: 'vachaspatimishra',
      url: 'https://linkedin.com/in/vachaspatimishra',
      icon: 'linkedin',
    ),
  ];

  // Resume content
  static const String resumeUrl = 'https://your-domain.com/resume.pdf';
  
  static const Map<String, dynamic> resumeData = {
    'fullName': 'Vachaspati Mishra',
    'title': 'Flutter Developer',
    'email': 'vachaspatimishra@outlook.in',
    'phone': '+91-8081025075',
    'location': 'Uttar Pradesh, India',
    'github': 'github.com/vachaspatimishraa',
    'linkedin': 'linkedin.com/in/vachaspatimishra',
    'summary': 'Flutter Developer skilled in Flutter, Dart, Python, Firebase, and REST APIs. '
        'Experienced in building scalable mobile applications using Riverpod and Clean Architecture '
        'with strong problem-solving and DSA skills.',
    'cgpa': '7.2/10',
    'expectedGraduation': 'Expected 2026',
    'languages': ['Dart', 'Python', 'Java', 'SQL'],
    'technologies': ['Flutter', 'Riverpod', 'Firebase', 'REST APIs', 'SQLite'],
    'concepts': ['Clean Architecture', 'OOP', 'DBMS', 'OS', 'DSA', 'Responsive UI', 'Async Programming'],
  };
}
