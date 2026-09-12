import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/nav_header.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/journey_section.dart';
import 'widgets/education_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer_section.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VachaspatiPortfolioApp());
}

class VachaspatiPortfolioApp extends StatefulWidget {
  const VachaspatiPortfolioApp({super.key});

  @override
  State<VachaspatiPortfolioApp> createState() => _VachaspatiPortfolioAppState();
}

class _VachaspatiPortfolioAppState extends State<VachaspatiPortfolioApp> {
  late final ThemeController _themeController;

  @override
  void initState() {
    super.initState();
    _themeController = ThemeController(ThemeMode.dark);
  }

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeController,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Vachaspati Mishra | Software Developer & Product Builder',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          home: PortfolioShell(themeController: _themeController),
        );
      },
    );
  }
}

class PortfolioShell extends StatefulWidget {
  final ThemeController themeController;

  const PortfolioShell({super.key, required this.themeController});

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Page Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Top spacer for the sticky header
                const SizedBox(height: 72),

                // Hero Section
                Container(
                  key: _homeKey,
                  child: HeroSection(
                    onExploreProjects: () => _scrollTo(_projectsKey),
                    onJourneyTap: () => _scrollTo(_journeyKey),
                    onContactTap: () => _scrollTo(_contactKey),
                  ),
                ),

                // About Section
                Container(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),

                // Projects Section
                Container(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),

                // Skills Section
                Container(
                  key: _skillsKey,
                  child: const SkillsSection(),
                ),

                // Journey Section
                Container(
                  key: _journeyKey,
                  child: const JourneySection(),
                ),

                // Education Section
                Container(
                  key: _educationKey,
                  child: const EducationSection(),
                ),

                // Contact Section
                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),

                // Footer
                FooterSection(
                  onBackToTop: () => _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOutCubic,
                  ),
                ),
              ],
            ),
          ),

          // Sticky Top Navigation Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavHeader(
              themeController: widget.themeController,
              onHomeTap: () => _scrollTo(_homeKey),
              onAboutTap: () => _scrollTo(_aboutKey),
              onProjectsTap: () => _scrollTo(_projectsKey),
              onSkillsTap: () => _scrollTo(_skillsKey),
              onJourneyTap: () => _scrollTo(_journeyKey),
              onEducationTap: () => _scrollTo(_educationKey),
              onContactTap: () => _scrollTo(_contactKey),
            ),
          ),
        ],
      ),
    );
  }
}
