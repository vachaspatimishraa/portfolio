import 'package:flutter/material.dart';

class ProjectItem {
  final String id;
  final String name;
  final String tagline;
  final String description;
  final String status; // 'Completed' or 'Active'
  final String category; // 'AI & Career', 'FinTech & Tools', 'Communication'
  final List<String> technologies;
  final List<String> keyFeatures;
  final String problemStatement;
  final String architecture;
  final String? githubUrl;
  final String? liveUrl;
  final String? imageAsset;
  final List<Color> gradientColors;

  const ProjectItem({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.status,
    required this.category,
    required this.technologies,
    required this.keyFeatures,
    required this.problemStatement,
    required this.architecture,
    this.githubUrl,
    this.liveUrl,
    this.imageAsset,
    required this.gradientColors,
  });
}

class SkillCategory {
  final String title;
  final IconData icon;
  final List<String> skills;

  const SkillCategory({
    required this.title,
    required this.icon,
    required this.skills,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String specializations;
  final String score;
  final String status;
  final String duration;
  final String note;
  final IconData icon;
  final bool isPrimary;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.specializations,
    required this.score,
    required this.status,
    required this.duration,
    required this.note,
    required this.icon,
    this.isPrimary = false,
  });
}

class JourneyMilestone {
  final String year;
  final String title;
  final String subtitle;
  final String description;
  final String type; // 'education' or 'project'
  final IconData icon;
  final Color accentColor;

  const JourneyMilestone({
    required this.year,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.type,
    required this.icon,
    required this.accentColor,
  });
}

class PortfolioData {
  static const String name = 'Vachaspati Mishra';
  static const String headline = 'I build products, not just projects.';
  static const String role =
      'B.Tech CSE Graduate (7.4 CGPA) • MBA 2nd Year (IT & Marketing)';
  static const String avatarAsset = 'assets/images/profile/avatar.png';
  static const String heroBgAsset = 'assets/images/backgrounds/hero_bg.png';

  static const String aboutNarrative =
      'Graduated with a Bachelor of Technology in Computer Science & Engineering (7.4 CGPA) from AKTU in 2026, '
      'and currently in the 2nd year of my MBA specializing in Information Technology and Marketing. '
      'I bridge hardcore technical engineering with commercial product strategy, shipping completed cross-platform '
      'applications with clean architectures, offline resilience, and proven real-world utility.';

  static const String email = 'vachaspatimishra@outlook.in';
  static const String phone = '8081025075';
  static const String githubUrl = 'https://github.com/vachaspatimishraa';
  static const String linkedinUrl = 'https://linkedin.com/in/vachaspatimishra';

  static const List<ProjectItem> projects = [
    ProjectItem(
      id: 'prepmate',
      name: 'PrepMateAI',
      tagline: 'AI-powered preparation & career readiness platform.',
      description:
          'A completed full-featured career readiness product featuring automated resume authoring, real-time ATS score analysis, skill gap detection, and structured interview practice.',
      status: 'Completed',
      category: 'AI & Career',
      technologies: ['Flutter', 'Riverpod', 'REST APIs', 'Firebase', 'Dart'],
      keyFeatures: [
        'AI-driven resume parsing and real-time ATS compatibility scoring',
        'Automated skill gap detection mapped against industry job descriptions',
        'Interactive practice questions and curriculum progress indicators',
        'Clean, focus-driven study companion eliminating preparation burnout',
      ],
      problemStatement:
          'Preparing for technical roles and interviews requires systematic curriculum visibility and ATS optimization. PrepMateAI automates gap analysis and structures daily progress.',
      architecture:
          'Production-grade modular state architecture powered by Riverpod with RESTful microservice integration and Firebase real-time data sync.',
      githubUrl: 'https://github.com/vachaspatimishraa',
      imageAsset: 'assets/images/projects/prepmate_ai.png',
      gradientColors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
    ),
    ProjectItem(
      id: 'taskuvo',
      name: 'Taskuvo',
      tagline: 'Streamlined productivity & task execution system.',
      description:
          'A completed, high-efficiency productivity and task tracking system engineered to eliminate task app bloat with rapid capture, priority matrix, and progress transparency.',
      status: 'Completed',
      category: 'FinTech & Tools',
      technologies: ['Flutter', 'Dart', 'Clean Architecture', 'Local DB'],
      keyFeatures: [
        'Rapid milestone and priority matrix tracking with zero friction',
        'Structured task lifecycle from capture to completion with metrics',
        'Clean, distraction-free ergonomics optimized for high productivity',
        'Fast reactive state updates with responsive desktop and mobile views',
      ],
      problemStatement:
          'Over-engineered productivity applications introduce cognitive friction that slows execution. Taskuvo delivers high-speed capture, clean separation, and immediate status clarity.',
      architecture:
          'Decoupled Clean Architecture prioritizing instant local query speeds, low memory footprint, and modular state handlers.',
      githubUrl: 'https://github.com/vachaspatimishraa',
      gradientColors: [Color(0xFFF59E0B), Color(0xFFEA580C)],
    ),
    ProjectItem(
      id: 'voryn',
      name: 'Voryn',
      tagline: 'Connect your way.',
      description:
          'A next-generation communication product delivering 1-to-1 audio and video calling, virtual meetings, screen sharing, and lightweight call messaging.',
      status: 'Active',
      category: 'Communication',
      technologies: ['Flutter', 'Supabase', 'Riverpod', 'WebRTC', 'Local Cache'],
      keyFeatures: [
        '1-to-1 crystal-clear audio and video calling with minimal latency',
        'Virtual meetings and real-time screen sharing functionality',
        'Four ergonomic navigation hubs: Connect, Recents, Contacts, and Meetings',
        'Exact contact discovery via unique Voryn ID and verified phone number',
        'Lightweight call messaging, presence indicators, and DND controls',
      ],
      problemStatement:
          'Communication apps often sacrifice either privacy, ergonomic simplicity, or speed. Voryn is architected to balance instant calling usability with a distinct, uncluttered communication interface.',
      architecture:
          'Dual-layer architecture using Supabase as the authoritative cloud source of truth paired with a fast local cache for immediate offline recents and contacts access.',
      githubUrl: 'https://github.com/vachaspatimishraa',
      imageAsset: 'assets/images/projects/connectify.png',
      gradientColors: [Color(0xFFF43F5E), Color(0xFFFB7185)],
    ),
    ProjectItem(
      id: 'fintrack',
      name: 'FinTrack',
      tagline: 'Personal finance & budgeting product.',
      description:
          'An offline-first finance management application built for detailed expense categorization, privacy-first local storage, and cloud synchronization.',
      status: 'Completed',
      category: 'FinTech & Tools',
      technologies: ['Flutter', 'Isar Database', 'Supabase', 'Dart'],
      keyFeatures: [
        'Local-first high-speed storage powered by Isar embedded database',
        'Granular income and expense tracking with custom categories',
        'Visual financial summaries with PDF and Excel statement export',
        'Biometric authentication and secure app lock protection',
        'Cloud synchronization capability powered by Supabase',
        'Multi-language support (English / Hindi) with dynamic theming',
      ],
      problemStatement:
          'Most personal budgeting tools mandate continuous internet access and transmit sensitive financial transactions without offline fallback. FinTrack puts local privacy first while allowing optional cloud sync.',
      architecture:
          'Offline-first architecture leveraging Isar for instantaneous zero-latency local queries and reactive updates, backed by Supabase synchronization for multi-device harmony.',
      githubUrl: 'https://github.com/vachaspatimishraa',
      gradientColors: [Color(0xFF10B981), Color(0xFF059669)],
    ),
    ProjectItem(
      id: 'vitafolio',
      name: 'VitaFolio',
      tagline: 'Professional resume & CV builder.',
      description:
          'A dynamic CV builder engineered to streamline resume authoring, section management, live previewing, and verified identity workflows.',
      status: 'Completed',
      category: 'AI & Career',
      technologies: ['Flutter', 'Supabase', 'Riverpod', 'OCR / Parser'],
      keyFeatures: [
        'Modular resume section management (Education, Experience, Skills, Languages)',
        'Real-time formatted preview and dynamic editing canvas',
        'Phone OTP verification and international country-code picker',
        'Email confirmation and account authentication via Supabase',
        'Automated parser workflows to accelerate profile creation',
      ],
      problemStatement:
          'Creating ATS-friendly, clean resumes across devices is cumbersome and error-prone. VitaFolio structures user information cleanly into professional templates with live visual validation.',
      architecture:
          'Reactive UI bound to a structured data model backed by Supabase authentication and storage, ensuring persistent profile history and seamless editing.',
      githubUrl: 'https://github.com/vachaspatimishraa',
      gradientColors: [Color(0xFF0EA5E9), Color(0xFF6366F1)],
    ),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      title: 'Mobile & Frontend',
      icon: Icons.phone_android_rounded,
      skills: [
        'Flutter (Mobile & Web)',
        'Dart',
        'Material Design 3',
        'Responsive UI',
        'Adaptive Layouts',
        'Implicit & Custom Animations',
      ],
    ),
    SkillCategory(
      title: 'State Management',
      icon: Icons.layers_rounded,
      skills: [
        'Riverpod',
        'Provider',
        'GetX',
        'BLoC Pattern',
        'Reactive Architecture',
      ],
    ),
    SkillCategory(
      title: 'Backend & Cloud',
      icon: Icons.cloud_outlined,
      skills: [
        'Supabase (Auth, DB, Realtime)',
        'Firebase (Auth, Firestore, FCM)',
        'Isar Embedded DB',
        'SQLite',
        'REST APIs',
        'Python & Django',
      ],
    ),
    SkillCategory(
      title: 'Engineering & DevOps',
      icon: Icons.terminal_rounded,
      skills: [
        'Git & GitHub',
        'Docker',
        'VS Code',
        'Android Studio',
        'Clean Architecture',
        'Data Structures & Algorithms',
      ],
    ),
    SkillCategory(
      title: 'MBA (IT & Marketing)',
      icon: Icons.insights_rounded,
      skills: [
        'Product Lifecycle Management',
        'IT Strategy & Governance',
        'Marketing Strategy & Branding',
        'Market Research & User Psychology',
        'Go-To-Market Execution',
      ],
    ),
  ];

  static const List<EducationItem> educationList = [
    EducationItem(
      degree: 'Bachelor of Technology (B.Tech) in CSE',
      institution: 'Dr. A.P.J. Abdul Kalam Technical University (AKTU)',
      specializations: 'Computer Science & Engineering',
      score: '7.4 CGPA',
      status: 'Graduated (2026)',
      duration: 'Graduated in 2026',
      note:
          'Graduated in 2026 with a 7.4 CGPA. Mastered software engineering principles, algorithms, data structures, and production-grade cross-platform systems development.',
      icon: Icons.school_rounded,
      isPrimary: true,
    ),
    EducationItem(
      degree: 'Master of Business Administration (MBA)',
      institution: 'Dr. A.P.J. Abdul Kalam Technical University (AKTU)',
      specializations: 'Information Technology (IT) & Marketing',
      score: '2nd Year (Ongoing)',
      status: '2nd Year (Pursuing)',
      duration: 'Currently in 2nd Year',
      note:
          'Synthesizing enterprise IT governance and strategic marketing to build commercially successful, user-centered digital products with scalable go-to-market execution.',
      icon: Icons.workspace_premium_rounded,
      isPrimary: true,
    ),
    EducationItem(
      degree: 'Intermediate (Class XII)',
      institution: 'Uttar Pradesh State Board',
      specializations: 'Science & Mathematics',
      score: '1st Division',
      status: 'Completed',
      duration: '2022',
      note: 'Secured First Division honors with a focus on mathematical logic and scientific foundations.',
      icon: Icons.menu_book_rounded,
    ),
    EducationItem(
      degree: 'High School (Class X)',
      institution: 'Uttar Pradesh State Board',
      specializations: 'General Sciences & Mathematics',
      score: '1st Division',
      status: 'Completed',
      duration: '2020',
      note: 'Graduated with First Division academic distinction.',
      icon: Icons.auto_stories_rounded,
    ),
  ];

  static const List<JourneyMilestone> journeyMilestones = [
    JourneyMilestone(
      year: '2026',
      title: 'B.Tech CSE Graduate (7.4 CGPA) & MBA 2nd Year',
      subtitle: 'AKTU • Dual Engineering & Business Advantage',
      description:
          'Successfully graduated B.Tech in Computer Science with a 7.4 CGPA and advanced into the 2nd year of MBA (IT & Marketing), combining technical mastery with business leadership.',
      type: 'education',
      icon: Icons.workspace_premium_rounded,
      accentColor: Color(0xFF6366F1),
    ),
    JourneyMilestone(
      year: '2025',
      title: 'Completed PrepMateAI & FinTrack',
      subtitle: 'AI Career Readiness & Offline-First Budgeting',
      description:
          'Fully completed PrepMateAI (AI resume builder with real-time ATS scoring) and FinTrack (local-first Isar DB with Supabase cloud sync).',
      type: 'project',
      icon: Icons.task_alt_rounded,
      accentColor: Color(0xFF8B5CF6),
    ),
    JourneyMilestone(
      year: '2024',
      title: 'Completed Taskuvo & Built Voryn Core',
      subtitle: 'Productivity System & Communication Architecture',
      description:
          'Completed Taskuvo (focused workflow execution engine) and engineered the encrypted real-time calling architecture powering Voryn.',
      type: 'project',
      icon: Icons.rocket_launch_rounded,
      accentColor: Color(0xFF0EA5E9),
    ),
    JourneyMilestone(
      year: '2022',
      title: 'Commenced B.Tech CSE & Class XII Honors',
      subtitle: 'AKTU • UP State Board 1st Division',
      description:
          'Began Computer Science & Engineering degree after securing First Division honors in Class XII, mastering Flutter and systems architecture.',
      type: 'education',
      icon: Icons.school_rounded,
      accentColor: Color(0xFF10B981),
    ),
    JourneyMilestone(
      year: '2020',
      title: 'Class X Academic Distinction',
      subtitle: 'UP State Board 1st Division',
      description:
          'Graduated with First Division academic distinction, establishing deep foundations in mathematics and logical problem solving.',
      type: 'education',
      icon: Icons.military_tech_rounded,
      accentColor: Color(0xFFF59E0B),
    ),
  ];
}
