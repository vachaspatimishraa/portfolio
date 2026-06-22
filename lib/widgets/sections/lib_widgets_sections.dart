// lib/widgets/sections/hero_section.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../utils/lib_utils_helpers.dart';
import '../cards/project_card.dart';
import '../cards/skill_card.dart';
import '../common/gradient_button.dart';
import '../common/gradient_text.dart';
import '../common/section_header.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWorkTap;
  final VoidCallback onContactTap;

  const HeroSection({
    Key? key,
    required this.onViewWorkTap,
    required this.onContactTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    Widget content = Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Status Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.primaryLight.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.greenAccent.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.greenAccent,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'FLUTTER DEVELOPER',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Main Heading
        Text(
          "Hi, I'm",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: isMobile ? 20 : 26,
            fontWeight: FontWeight.w600,
            fontFamily: 'SpaceGrotesk',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "VACHASPATI",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Colors.white,
            fontSize: isMobile ? 44 : 76,
            fontWeight: FontWeight.w900,
            fontFamily: 'SpaceGrotesk',
            letterSpacing: 1.0,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppTheme.accentCyan, AppTheme.accentBlue, AppTheme.accentPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            "MISHRA",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
              fontSize: isMobile ? 44 : 76,
              fontWeight: FontWeight.w900,
              fontFamily: 'SpaceGrotesk',
              letterSpacing: 1.0,
              height: 1.1,
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Subtitle
        Container(
          constraints: const BoxConstraints(maxWidth: 540),
          child: Text(
            "Building scalable cross-platform mobile applications using Flutter, Riverpod, Firebase and REST APIs.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: isMobile ? 15 : 17,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),

        const SizedBox(height: 40),

        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton(
              onPressed: onViewWorkTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accentBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EXPLORE MY WORK',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.0),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: onContactTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: AppTheme.borderColor, width: 1.5),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LET'S CONNECT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.0),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Tech Chips Row
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildTechChip('Flutter', Image.asset('assets/icons/tech/flutter.png', width: 16, height: 16)),
            _buildTechChip('Dart', const Icon(Icons.bolt, color: AppTheme.accentCyan, size: 16)),
            _buildTechChip('Firebase', Image.asset('assets/icons/tech/firebase.png', width: 16, height: 16)),
            _buildTechChip('Riverpod', Image.asset('assets/icons/tech/riverpod.png', width: 16, height: 16)),
            _buildTechChip('Python', Image.asset('assets/icons/tech/python.png', width: 16, height: 16)),
          ],
        ),
      ],
    );

    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - 80),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 80,
      ),
      child: isMobile
          ? content
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 11,
                  child: content,
                ),
                const Spacer(flex: 9), // Clear space on the right for the background mockup image
              ],
            ),
    );
  }

  Widget _buildTechChip(String label, Widget icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight.withValues(alpha: 0.3),
        border: Border.all(color: AppTheme.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// lib/widgets/sections/stats_section.dart

class StatsSection extends StatelessWidget {
  final List<Map<String, String>> stats;

  const StatsSection({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 60,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.borderColor),
          bottom: BorderSide(color: AppTheme.borderColor),
        ),
      ),
      child: GridView.count(
        crossAxisCount: isMobile ? 2 : 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 32,
        crossAxisSpacing: 32,
        children: stats.map((stat) => Column(
          children: [
            Text(
              stat['number']!,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: isMobile ? 32 : 48,
                background: Paint()
                  ..shader = AppTheme.cyanToBlue.createShader(
                    const Rect.fromLTWH(0, 0, 200, 70),
                  ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              stat['label']!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        )).toList(),
      ),
    );
  }
}

// lib/widgets/sections/projects_section.dart

class ProjectsSection extends StatelessWidget {
  final List<dynamic> projects;
  final VoidCallback onViewAllTap;

  const ProjectsSection({
    Key? key,
    required this.projects,
    required this.onViewAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final featuredProjects = projects.take(2).toList();

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FEATURED PROJECTS',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.bold,
              fontFamily: 'SpaceGrotesk',
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'A selection of projects that showcase my expertise in mobile development and user-centered design.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 40),

          isMobile
              ? Column(
                  children: featuredProjects
                      .map((project) => Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: ProjectCard(
                              project: project,
                              onTap: () {
                                if (project.githubUrl != null) {
                                  AppHelpers.launchURL(project.githubUrl!);
                                }
                              },
                            ),
                          ))
                      .toList(),
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: featuredProjects
                        .map((project) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: ProjectCard(
                                  project: project,
                                  onTap: () {
                                    if (project.githubUrl != null) {
                                      AppHelpers.launchURL(project.githubUrl!);
                                    }
                                  },
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),

          const SizedBox(height: 48),

          Center(
            child: GradientButton(
              text: 'View All Projects',
              onPressed: onViewAllTap,
              isOutlined: true,
              hasShadow: false,
            ),
          ),
        ],
      ),
    );
  }
}

// lib/widgets/sections/skills_section.dart

class SkillsSection extends StatelessWidget {
  final List<dynamic> skillCategories;

  const SkillsSection({
    Key? key,
    required this.skillCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SKILLS & TECHNOLOGIES',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.bold,
              fontFamily: 'SpaceGrotesk',
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 32),

          isMobile
              ? Column(
                  children: skillCategories.map<Widget>((category) => _buildCategoryColumn(context, category)).toList(),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: skillCategories.map<Widget>((category) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: _buildCategoryColumn(context, category),
                    ),
                  )).toList(),
                ),
        ],
      ),
    );
  }

  Widget _buildCategoryColumn(BuildContext context, dynamic category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          category.category,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.accentCyan,
          ),
        ),
        const SizedBox(height: 16),
        ...category.skills.map<Widget>((skill) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SkillCard(skill: skill),
        )).toList(),
        const SizedBox(height: 24),
      ],
    );
  }
}

// lib/widgets/sections/timeline_section.dart

class TimelineSection extends StatelessWidget {
  final List<dynamic> timelineItems;

  const TimelineSection({
    Key? key,
    required this.timelineItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPERIENCE & EDUCATION',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.bold,
              fontFamily: 'SpaceGrotesk',
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'My career milestones and academic background from 2020 to 2026',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          ...timelineItems.asMap().entries.map((entry) => TimelineItemWidget(
            year: entry.value.year,
            title: entry.value.title,
            description: entry.value.description,
            type: entry.value.typeLabel,
            status: entry.value.status,
            isLast: entry.key == timelineItems.length - 1,
          )).toList(),
        ],
      ),
    );
  }
}

// lib/widgets/sections/contact_section.dart

class ContactSection extends StatelessWidget {
  final VoidCallback onEmailTap;
  final VoidCallback onLinkedinTap;

  const ContactSection({
    Key? key,
    required this.onEmailTap,
    required this.onLinkedinTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    Widget leftColumn = Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "LET'S CONNECT",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.bold,
            fontFamily: 'SpaceGrotesk',
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "I'm currently open to new opportunities and collaborations. Feel free to reach out!",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.5,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: onEmailTap,
          icon: const Icon(Icons.send_outlined, size: 18),
          label: const Text(
            'SEND MESSAGE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.0),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.accentPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );

    Widget rightColumn = isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ContactCard(
                icon: Icons.mail_outline,
                title: 'Email',
                value: 'vachaspatimishra@outlook.in',
                onTap: onEmailTap,
              ),
              const SizedBox(height: 16),
              _ContactCard(
                icon: Icons.phone_outlined,
                title: 'Phone',
                value: '+91 8081025075',
                onTap: () => AppHelpers.launchURL('tel:+918081025075'),
              ),
              const SizedBox(height: 16),
              _ContactCard(
                icon: FontAwesomeIcons.github,
                title: 'GitHub',
                value: 'github.com/vachaspatimishraa',
                onTap: () => AppHelpers.launchURL(AppConstants.githubUrl),
              ),
              const SizedBox(height: 16),
              _ContactCard(
                icon: FontAwesomeIcons.linkedin,
                title: 'LinkedIn',
                value: 'linkedin.com/in/vachaspatimishra',
                onTap: onLinkedinTap,
              ),
              const SizedBox(height: 16),
              _ContactCard(
                icon: Icons.description_outlined,
                title: 'Resume',
                value: 'Download Resume',
                onTap: () => AppHelpers.downloadResume(context),
              ),
            ],
          )
        : Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _ContactCard(
                icon: Icons.mail_outline,
                title: 'Email',
                value: 'vachaspatimishra@outlook.in',
                onTap: onEmailTap,
              ),
              _ContactCard(
                icon: Icons.phone_outlined,
                title: 'Phone',
                value: '+91 8081025075',
                onTap: () => AppHelpers.launchURL('tel:+918081025075'),
              ),
              _ContactCard(
                icon: FontAwesomeIcons.github,
                title: 'GitHub',
                value: 'github.com/vachaspatimishraa',
                onTap: () => AppHelpers.launchURL(AppConstants.githubUrl),
              ),
              _ContactCard(
                icon: FontAwesomeIcons.linkedin,
                title: 'LinkedIn',
                value: 'linkedin.com/in/vachaspatimishra',
                onTap: onLinkedinTap,
              ),
              _ContactCard(
                icon: Icons.description_outlined,
                title: 'Resume',
                value: 'Download Resume',
                onTap: () => AppHelpers.downloadResume(context),
              ),
            ],
          );

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                leftColumn,
                const SizedBox(height: 40),
                rightColumn,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: leftColumn,
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 3,
                  child: rightColumn,
                ),
              ],
            ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: _isHovered 
              ? AppTheme.primaryLight.withValues(alpha: 0.8)
              : AppTheme.primaryDark.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? AppTheme.accentCyan.withValues(alpha: 0.5) : AppTheme.borderColor,
            ),
          ),
          child: Row(
            mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: AppTheme.accentCyan,
                size: 20,
              ),
              const SizedBox(width: 16),
              isMobile
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppTheme.textSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.value,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppTheme.textSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.value,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'ABOUT ME',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.bold,
              fontFamily: 'SpaceGrotesk',
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 32),

          // Content Layout
          isMobile
              ? Column(
                  children: [
                    _buildAvatar(),
                    const SizedBox(height: 32),
                    _buildDetails(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvatar(),
                    const SizedBox(width: 32),
                    Expanded(child: _buildDetails(context)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.accentCyan.withValues(alpha: 0.5), width: 2),
        image: const DecorationImage(
          image: AssetImage('assets/images/profile/avatar.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm a Flutter Developer pursuing B.Tech from AKTU. I enjoy building scalable cross-platform applications with clean architecture and great user experiences.",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.6,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 32),
        // Stats Cards Row
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                icon: Icons.school_outlined,
                title: 'B.Tech (AKTU)',
                subtitle: 'Expected 2026',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                context,
                icon: Icons.trending_up,
                title: 'CGPA',
                subtitle: '7.2 / 10',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                context,
                icon: Icons.rocket_launch_outlined,
                title: 'Projects',
                subtitle: '2+ Completed',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.primaryDark.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.accentCyan, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 10,
              color: AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
