import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 950;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (screenWidth > 1200 ? 64 : 32),
        vertical: 72,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Tag
              _buildTag(isDark, 'ABOUT ME'),
              const SizedBox(height: 12),

              // Title
              Text(
                'Blending Code, Product Strategy & Business Value',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 28),

              // Main Layout: Profile Card + Narrative
              isMobile
                  ? Column(
                      children: [
                        _buildProfileCard(context, isDark),
                        const SizedBox(height: 28),
                        _buildNarrative(context, isDark),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 4, child: _buildProfileCard(context, isDark)),
                        const SizedBox(width: 36),
                        Expanded(flex: 7, child: _buildNarrative(context, isDark)),
                      ],
                    ),
              const SizedBox(height: 48),

              // 3 Core Pillars
              isMobile
                  ? Column(
                      children: const [
                        _PillarCard(
                          icon: Icons.code_rounded,
                          title: 'Engineering Rigor',
                          description:
                              'Crafting clean, responsive Flutter applications with offline-first data engines (Isar), reliable backend sync (Supabase, Firebase), and reactive Riverpod state architecture.',
                          accentColor: Color(0xFF6366F1),
                        ),
                        SizedBox(height: 16),
                        _PillarCard(
                          icon: Icons.lightbulb_outline_rounded,
                          title: 'Product Builder Mindset',
                          description:
                              'Thinking through end-to-end user workflows, ergonomic interfaces, edge cases, and high-quality usability rather than just writing code snippets.',
                          accentColor: Color(0xFF38BDF8),
                        ),
                        SizedBox(height: 16),
                        _PillarCard(
                          icon: Icons.trending_up_rounded,
                          title: 'Business & Marketing (MBA)',
                          description:
                              'Applying marketing strategy, consumer psychology, and enterprise IT concepts to build tools that solve genuine user problems and provide tangible value.',
                          accentColor: Color(0xFF10B981),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: _PillarCard(
                            icon: Icons.code_rounded,
                            title: 'Engineering Rigor',
                            description:
                                'Crafting clean, responsive Flutter applications with offline-first data engines (Isar), reliable backend sync (Supabase, Firebase), and reactive Riverpod state architecture.',
                            accentColor: Color(0xFF6366F1),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: _PillarCard(
                            icon: Icons.lightbulb_outline_rounded,
                            title: 'Product Builder Mindset',
                            description:
                                'Thinking through end-to-end user workflows, ergonomic interfaces, edge cases, and high-quality usability rather than just writing code snippets.',
                            accentColor: Color(0xFF38BDF8),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: _PillarCard(
                            icon: Icons.trending_up_rounded,
                            title: 'Business & Marketing (MBA)',
                            description:
                                'Applying marketing strategy, consumer psychology, and enterprise IT concepts to build tools that solve genuine user problems and provide tangible value.',
                            accentColor: Color(0xFF10B981),
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

  Widget _buildProfileCard(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111726) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Photo
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF38BDF8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(3),
            child: ClipOval(
              child: Image.asset(
                PortfolioData.avatarAsset,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 60),
              ),
            ),
          ),
          const SizedBox(height: 18),

          Text(
            PortfolioData.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Software Developer & Product Builder',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF6366F1),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 14),

          _buildProfileDetailRow(Icons.school_rounded, 'B.Tech CSE Graduate (2026) • 7.4 CGPA', isDark),
          const SizedBox(height: 8),
          _buildProfileDetailRow(Icons.workspace_premium_rounded, 'MBA 2nd Year (IT & Marketing) • AKTU', isDark),
          const SizedBox(height: 8),
          _buildProfileDetailRow(Icons.task_alt_rounded, 'Completed: Taskuvo, PrepMateAI, FinTrack, VitaFolio', isDark),
          const SizedBox(height: 8),
          _buildProfileDetailRow(Icons.location_on_outlined, 'Uttar Pradesh, India', isDark),
        ],
      ),
    );
  }

  Widget _buildProfileDetailRow(IconData icon, String text, bool isDark) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF6366F1)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.5,
              color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrative(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Engineering Rigor Meets Strategic Business Leadership',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'In 2026, I graduated with a Bachelor of Technology (B.Tech) in Computer Science & Engineering '
          'from AKTU with a 7.4 CGPA. Currently, I am advancing my strategic capabilities in the 2nd year of my '
          'MBA specializing in Information Technology and Marketing at AKTU.\n\n'
          'This blend of computer systems engineering and business acumen directly shapes how I develop software. '
          'I have completed and deployed applications across productivity (Taskuvo), career readiness (PrepMateAI), '
          'personal finance (FinTrack), and resume engineering (VitaFolio), alongside developing Voryn, '
          'a dedicated real-time audio and video communication platform. I prioritize resilient offline architectures, '
          'ergonomic UI, and lasting product value.',
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.7,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
            fontSize: 15.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTag(bool isDark, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: isDark ? const Color(0xFF818CF8) : const Color(0xFF4F46E5),
        ),
      ),
    );
  }
}

class _PillarCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color accentColor;

  const _PillarCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.accentColor,
  });

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF111726) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered
                ? widget.accentColor.withValues(alpha: 0.8)
                : (isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0)),
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: [
            if (_hovered)
              BoxShadow(
                color: widget.accentColor.withValues(alpha: isDark ? 0.15 : 0.08),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, color: widget.accentColor, size: 24),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
