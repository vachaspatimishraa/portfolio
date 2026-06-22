import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/theme.dart';
import '../config/constants.dart';
import '../data/portfolio_data.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/stats_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/skills_section.dart';
import '../widgets/sections/timeline_section.dart';
import '../widgets/sections/contact_section.dart';
import '../config/lib_config_routes.dart';
import '../utils/lib_utils_helpers.dart';

/// Main home screen widget that displays the complete portfolio
/// 
/// This is the primary screen of the application that composes all
/// major portfolio sections:
/// - Hero/Introduction
/// - Statistics/Metrics
/// - Featured Projects
/// - Skills/Expertise
/// - Professional Timeline
/// - Contact/CTA
/// 
/// The screen is fully responsive and works on mobile, tablet, and desktop.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  /// Scroll controller for tracking scroll position
  late ScrollController _scrollController;

  /// Animation controller for scroll-based animations
  late AnimationController _animationController;

  /// Track if hero section is visible
  bool _isHeroVisible = true;

  /// Keys for scrollable sections
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  /// Scaffold key for mobile drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Smoothly scroll to a specific section key
  void _scrollToSection(GlobalKey key) {
    // Small delay ensures any drawer pop transitions (Navigator.pop) do not
    // interrupt or cancel the scroll animation.
    Future.delayed(const Duration(milliseconds: 150), () {
      final context = key.currentContext;
      if (context != null && context.mounted) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Listen to scroll events for animations
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  /// Handle scroll events for dynamic UI updates
  void _onScroll() {
    // Update hero visibility based on scroll position
    final newVisibility = _scrollController.offset < 300;
    if (_isHeroVisible != newVisibility) {
      setState(() => _isHeroVisible = newVisibility);
    }

    // Animate based on scroll position - set value directly to avoid driving
    // conflicting animations on every scroll tick.
    final scrollFraction = (_scrollController.offset / 500).clamp(0.0, 1.0);
    _animationController.value = scrollFraction;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.colorBgPrimary,
      drawer: isMobile ? _buildDrawer(context) : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed Left Sidebar (Desktop & Tablet only)
          if (!isMobile) _buildSidebar(context),

          // Main scrollable content
          Expanded(
            child: Stack(
              children: [
                // Scrollable content
                SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Top spacing
                      const SizedBox(height: 80),

                      // Hero section with background (Starts immediately with no blank space)
                      Container(
                        key: _homeKey,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/backgrounds/hero_bg.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                AppTheme.colorBgPrimary.withValues(alpha: 0.7),
                                AppTheme.colorBgPrimary,
                              ],
                            ),
                          ),
                          child: HeroSection(
                            onViewWorkTap: () => _scrollToSection(_workKey),
                            onContactTap: () => _scrollToSection(_contactKey),
                          ),
                        ),
                      ),

                      // About Me Section (Page 2)
                      const SizedBox(height: 60),
                      Container(
                        key: _aboutKey,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const AboutMeSection(),
                      ),

                      // Skills Section (Page 3)
                      const SizedBox(height: 60),
                      Container(
                        key: _skillsKey,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SkillsSection(
                          skillCategories: PortfolioData.skills,
                        ),
                      ),

                      // Featured Projects Section (Page 4)
                      const SizedBox(height: 60),
                      Container(
                        key: _workKey,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ProjectsSection(
                          projects: PortfolioData.projects,
                          onViewAllTap: () => Navigator.pushNamed(context, AppRoutes.projects),
                        ),
                      ),

                      // Timeline Section (Page 5)
                      const SizedBox(height: 60),
                      Container(
                        key: _journeyKey,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TimelineSection(
                          timelineItems: PortfolioData.timeline,
                        ),
                      ),

                      // Contact Section (Page 6)
                      const SizedBox(height: 60),
                      Container(
                        key: _contactKey,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ContactSection(
                          onEmailTap: () => _launchUrl(AppConstants.emailUrl),
                          onLinkedinTap: () => _launchUrl(AppConstants.linkedinUrl),
                        ),
                      ),

                      // Footer
                      _buildFooter(),
                    ],
                  ),
                ),

                // Floating Download Resume button in Top Right Corner (hidden on mobile APK)
                if (!isMobile)
                  Positioned(
                    top: 24,
                    right: 24,
                    child: InkWell(
                      onTap: () => AppHelpers.downloadResume(context),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.accentCyan, width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                          color: AppTheme.primaryDark.withValues(alpha: 0.8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'DOWNLOAD RESUME',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.download, color: AppTheme.accentCyan, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Floating menu button for mobile
                if (isMobile)
                  Positioned(
                    top: 24,
                    left: 24,
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: AppTheme.accentCyan),
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      style: IconButton.styleFrom(
                        backgroundColor: AppTheme.primaryDark.withValues(alpha: 0.8),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: AppTheme.borderColor),
                        ),
                      ),
                    ),
                  ),

                // Floating navigation indicator (optional)
                if (!isMobile)
                  Positioned(
                    right: 30,
                    top: 100,
                    child: _buildScrollIndicator(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build left fixed sidebar for desktop and tablet
  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 240,
      decoration: const BoxDecoration(
        color: AppTheme.primaryDark,
        border: Border(
          right: BorderSide(color: AppTheme.borderColor, width: 1),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Custom glowing VM Logo at the top
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                            colors: [AppTheme.accentCyan, AppTheme.accentPurple],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.accentCyan.withValues(alpha: 0.3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'VM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'SpaceGrotesk',
                          ),
                        ),
                      ),
                    ),
                    _SidebarNavLink(
                      label: 'Home',
                      icon: Icons.home_outlined,
                      onTap: () => _scrollToSection(_homeKey),
                    ),
                    const SizedBox(height: 8),
                    _SidebarNavLink(
                      label: 'About',
                      icon: Icons.person_outline,
                      onTap: () => _scrollToSection(_aboutKey),
                    ),
                    const SizedBox(height: 8),
                    _SidebarNavLink(
                      label: 'Skills',
                      icon: Icons.bolt_outlined,
                      onTap: () => _scrollToSection(_skillsKey),
                    ),
                    const SizedBox(height: 8),
                    _SidebarNavLink(
                      label: 'Projects',
                      icon: Icons.folder_open_outlined,
                      onTap: () => _scrollToSection(_workKey),
                    ),
                    const SizedBox(height: 8),
                    _SidebarNavLink(
                      label: 'Journey',
                      icon: Icons.route_outlined,
                      onTap: () => _scrollToSection(_journeyKey),
                    ),
                    const SizedBox(height: 8),
                    _SidebarNavLink(
                      label: 'Contact',
                      icon: Icons.mail_outline,
                      onTap: () => _scrollToSection(_contactKey),
                    ),
                    const Spacer(),
                    // Sidebar social links at bottom
                    _SidebarSocialLink(
                      label: 'GitHub',
                      icon: FontAwesomeIcons.github,
                      onTap: () => AppHelpers.launchURL(AppConstants.githubUrl),
                    ),
                    _SidebarSocialLink(
                      label: 'LinkedIn',
                      icon: FontAwesomeIcons.linkedin,
                      onTap: () => AppHelpers.launchURL(AppConstants.linkedinUrl),
                    ),
                    _SidebarSocialLink(
                      label: 'Email',
                      icon: FontAwesomeIcons.envelope,
                      onTap: () => AppHelpers.launchURL('mailto:${AppConstants.email}'),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Build sliding drawer for mobile sidebar links
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.primaryDark,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Menu',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppTheme.accentCyan,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpaceGrotesk',
                ),
              ),
            ),
            const SizedBox(height: 40),
            _SidebarNavLink(
              label: 'Home',
              icon: Icons.home_outlined,
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_homeKey);
              },
            ),
            const SizedBox(height: 8),
            _SidebarNavLink(
              label: 'About',
              icon: Icons.person_outline,
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_aboutKey);
              },
            ),
            const SizedBox(height: 8),
            _SidebarNavLink(
              label: 'Skills',
              icon: Icons.bolt_outlined,
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_skillsKey);
              },
            ),
            const SizedBox(height: 8),
            _SidebarNavLink(
              label: 'Projects',
              icon: Icons.folder_open_outlined,
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_workKey);
              },
            ),
            const SizedBox(height: 8),
            _SidebarNavLink(
              label: 'Journey',
              icon: Icons.route_outlined,
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_journeyKey);
              },
            ),
            const SizedBox(height: 8),
            _SidebarNavLink(
              label: 'Contact',
              icon: Icons.mail_outline,
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_contactKey);
              },
            ),
          ],
        ),
      ),
    );
  }




  /// Build footer section
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(
        color: AppTheme.colorBgSecondary,
        border: Border(
          top: BorderSide(
            color: AppTheme.accentCyan.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // CTA Button
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Text(
                  'Ready to collaborate?',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.colorTextPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _scrollToSection(_contactKey),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentCyan,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Get in Touch',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Footer info
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppTheme.accentCyan.withValues(alpha: 0.1),
                ),
              ),
            ),
            child: Column(
              children: [
                // Name and title
                Text(
                  AppConstants.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.colorTextPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Full Stack Flutter Developer | UI/UX Enthusiast',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.colorTextSecondary,
                      ),
                ),

                const SizedBox(height: 12),

                // Copyright
                Text(
                  '© 2026 ${AppConstants.name}. All rights reserved.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.colorTextTertiary,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Crafted with Flutter & ❤️',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.colorTextTertiary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build scroll progress indicator (desktop only)
  Widget _buildScrollIndicator() {
    return Column(
      children: [
        Text(
          'Scroll',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppTheme.colorTextSecondary,
              ),
        ),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              width: 24,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppTheme.accentCyan.withValues(alpha: 0.5),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _animationController.value,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppTheme.accentCyan.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }



  /// Launch URL in browser or email client
  void _launchUrl(String url) {
    AppHelpers.launchURL(url);
  }
}

/// Responsive Sidebar Nav Link with Hover Effect
class _SidebarNavLink extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _SidebarNavLink({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_SidebarNavLink> createState() => __SidebarNavLinkState();
}

class __SidebarNavLinkState extends State<_SidebarNavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          decoration: BoxDecoration(
            color: _isHovered ? AppTheme.primaryLight.withValues(alpha: 0.5) : Colors.transparent,
            border: Border(
              left: BorderSide(
                color: _isHovered ? AppTheme.accentCyan : Colors.transparent,
                width: 4,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: _isHovered ? AppTheme.accentCyan : AppTheme.textSecondary,
                size: 20,
              ),
              const SizedBox(width: 16),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _isHovered ? AppTheme.accentCyan : AppTheme.textSecondary,
                  fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Responsive Sidebar Social Link
class _SidebarSocialLink extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _SidebarSocialLink({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_SidebarSocialLink> createState() => _SidebarSocialLinkState();
}

class _SidebarSocialLinkState extends State<_SidebarSocialLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          color: Colors.transparent,
          child: Row(
            children: [
              FaIcon(
                widget.icon,
                color: _isHovered ? AppTheme.accentCyan : AppTheme.textSecondary,
                size: 16,
              ),
              const SizedBox(width: 16),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: _isHovered ? AppTheme.accentCyan : AppTheme.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Extension to check screen size
extension BuildContextExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;
  bool get isTablet =>
      MediaQuery.of(this).size.width >= 600 &&
      MediaQuery.of(this).size.width < 1200;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1200;

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}
