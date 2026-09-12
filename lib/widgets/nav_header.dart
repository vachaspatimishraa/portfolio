import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NavHeader extends StatelessWidget {
  final ThemeController themeController;
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onJourneyTap;
  final VoidCallback onEducationTap;
  final VoidCallback onContactTap;

  const NavHeader({
    super.key,
    required this.themeController,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onSkillsTap,
    required this.onJourneyTap,
    required this.onEducationTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 850;

    return Container(
      height: 72,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : (screenWidth > 1200 ? 64 : 32),
      ),
      decoration: BoxDecoration(
        color: (isDark ? const Color(0xFF0A0D14) : Colors.white).withValues(alpha: 0.85),
        border: Border(
          bottom: BorderSide(
            color: isDark ? const Color(0xFF1E283E) : const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo / Monogram
              InkWell(
                onTap: onHomeTap,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6366F1), Color(0xFF38BDF8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6366F1).withValues(alpha: 0.35),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'VM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vachaspati Mishra',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3,
                            ),
                          ),
                          Text(
                            'Software & Product Builder',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isDark
                                  ? const Color(0xFF94A3B8)
                                  : const Color(0xFF64748B),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Desktop Navigation
              if (!isMobile)
                Row(
                  children: [
                    _NavLink(label: 'About', onTap: onAboutTap),
                    _NavLink(label: 'Projects', onTap: onProjectsTap),
                    _NavLink(label: 'Skills', onTap: onSkillsTap),
                    _NavLink(label: 'Journey', onTap: onJourneyTap),
                    _NavLink(label: 'Education', onTap: onEducationTap),
                    _NavLink(label: 'Contact', onTap: onContactTap),
                    const SizedBox(width: 12),
                    // Theme Switcher
                    ValueListenableBuilder<ThemeMode>(
                      valueListenable: themeController,
                      builder: (ctx, mode, _) {
                        final isCurrentlyDark = mode == ThemeMode.dark;
                        return IconButton(
                          onPressed: themeController.toggleTheme,
                          tooltip: isCurrentlyDark
                              ? 'Switch to Light Mode'
                              : 'Switch to Dark Mode',
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              isCurrentlyDark
                                  ? Icons.light_mode_rounded
                                  : Icons.dark_mode_rounded,
                              key: ValueKey(isCurrentlyDark),
                              size: 20,
                              color: isCurrentlyDark
                                  ? const Color(0xFFFBBF24)
                                  : const Color(0xFF4F46E5),
                            ),
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: isDark
                                ? const Color(0xFF161F33)
                                : const Color(0xFFF1F5F9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: isDark
                                    ? const Color(0xFF23304E)
                                    : const Color(0xFFE2E8F0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    // Primary CTA
                    FilledButton(
                      onPressed: onContactTap,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Get in Touch',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_forward_rounded, size: 14),
                        ],
                      ),
                    ),
                  ],
                )
              else
                // Mobile Action Bar: Theme toggle + Menu button
                Row(
                  children: [
                    ValueListenableBuilder<ThemeMode>(
                      valueListenable: themeController,
                      builder: (ctx, mode, _) {
                        final isCurrentlyDark = mode == ThemeMode.dark;
                        return IconButton(
                          onPressed: themeController.toggleTheme,
                          icon: Icon(
                            isCurrentlyDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            size: 20,
                            color: isCurrentlyDark
                                ? const Color(0xFFFBBF24)
                                : const Color(0xFF4F46E5),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () => _showMobileMenu(context),
                      icon: const Icon(Icons.menu_rounded),
                      tooltip: 'Menu',
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF111726) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border.all(
              color: isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              _MobileMenuItem(
                icon: Icons.person_outline_rounded,
                label: 'About Me',
                onTap: () {
                  Navigator.pop(ctx);
                  onAboutTap();
                },
              ),
              _MobileMenuItem(
                icon: Icons.layers_outlined,
                label: 'Featured Projects',
                onTap: () {
                  Navigator.pop(ctx);
                  onProjectsTap();
                },
              ),
              _MobileMenuItem(
                icon: Icons.code_rounded,
                label: 'Technical Skills',
                onTap: () {
                  Navigator.pop(ctx);
                  onSkillsTap();
                },
              ),
              _MobileMenuItem(
                icon: Icons.timeline_rounded,
                label: 'Journey & Milestones',
                onTap: () {
                  Navigator.pop(ctx);
                  onJourneyTap();
                },
              ),
              _MobileMenuItem(
                icon: Icons.school_outlined,
                label: 'Education & Distinctions',
                onTap: () {
                  Navigator.pop(ctx);
                  onEducationTap();
                },
              ),
              _MobileMenuItem(
                icon: Icons.mail_outline_rounded,
                label: 'Contact & Connect',
                onTap: () {
                  Navigator.pop(ctx);
                  onContactTap();
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _isHovered
                  ? const Color(0xFF6366F1)
                  : (isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF6366F1),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A),
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, size: 20),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
