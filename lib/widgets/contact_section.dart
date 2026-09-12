import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';
import '../utils/url_helper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 850;

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
              // Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'GET IN TOUCH',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: isDark ? const Color(0xFF818CF8) : const Color(0xFF4F46E5),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Title & Subtitle
              Text(
                'Let’s Connect & Build Together',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Open for product engineering roles, full-stack Flutter opportunities, and collaborative discussions.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),

              // Contact Channels Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth > 950) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth > 600) {
                    crossAxisCount = 2;
                  }

                  final channels = [
                    _ContactChannelData(
                      icon: Icons.mail_outline_rounded,
                      title: 'Email',
                      value: PortfolioData.email,
                      actionLabel: 'Send Email',
                      onTap: () => UrlHelper.sendEmail(PortfolioData.email),
                      accentColor: const Color(0xFF6366F1),
                    ),
                    _ContactChannelData(
                      icon: Icons.phone_outlined,
                      title: 'Phone',
                      value: '+91 ${PortfolioData.phone}',
                      actionLabel: 'Call Now',
                      onTap: () => UrlHelper.makePhoneCall(PortfolioData.phone),
                      accentColor: const Color(0xFF10B981),
                    ),
                    _ContactChannelData(
                      icon: Icons.code_rounded,
                      title: 'GitHub',
                      value: 'vachaspatimishraa',
                      actionLabel: 'View Profile',
                      onTap: () => UrlHelper.openUrl(PortfolioData.githubUrl),
                      accentColor: const Color(0xFF38BDF8),
                    ),
                    _ContactChannelData(
                      icon: Icons.work_outline_rounded,
                      title: 'LinkedIn',
                      value: 'vachaspatimishra',
                      actionLabel: 'Connect',
                      onTap: () => UrlHelper.openUrl(PortfolioData.linkedinUrl),
                      accentColor: const Color(0xFFA855F7),
                    ),
                  ];

                  final chunked = <List<_ContactChannelData>>[];
                  for (var i = 0; i < channels.length; i += crossAxisCount) {
                    chunked.add(
                      channels.sublist(
                        i,
                        (i + crossAxisCount > channels.length)
                            ? channels.length
                            : i + crossAxisCount,
                      ),
                    );
                  }

                  return Column(
                    children: chunked.map((row) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var j = 0; j < row.length; j++) ...[
                              if (j > 0) const SizedBox(width: 20),
                              Expanded(
                                child: _ContactCard(data: row[j]),
                              ),
                            ],
                            for (var k = 0; k < crossAxisCount - row.length; k++) ...[
                              const SizedBox(width: 20),
                              const Expanded(child: SizedBox()),
                            ],
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactChannelData {
  final IconData icon;
  final String title;
  final String value;
  final String actionLabel;
  final VoidCallback onTap;
  final Color accentColor;

  _ContactChannelData({
    required this.icon,
    required this.title,
    required this.value,
    required this.actionLabel,
    required this.onTap,
    required this.accentColor,
  });
}

class _ContactCard extends StatefulWidget {
  final _ContactChannelData data;

  const _ContactCard({required this.data});

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final item = widget.data;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF111726) : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _hovered
                  ? item.accentColor.withValues(alpha: 0.8)
                  : (isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0)),
              width: _hovered ? 1.5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? item.accentColor.withValues(alpha: isDark ? 0.2 : 0.08)
                    : Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
                blurRadius: _hovered ? 20 : 8,
                offset: Offset(0, _hovered ? 6 : 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item.accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: item.accentColor, size: 22),
              ),
              const SizedBox(height: 18),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    item.actionLabel,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: item.accentColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_outward_rounded, size: 14, color: item.accentColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
