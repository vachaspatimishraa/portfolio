import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';

class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

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
                  'JOURNEY & TIMELINE',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: isDark ? const Color(0xFF818CF8) : const Color(0xFF4F46E5),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Title
              Text(
                'Milestones & Academic Progression',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'A track record of continuous learning, rigorous engineering, and product execution from 2020 to 2026.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 48),

              // Timeline
              Column(
                children: PortfolioData.journeyMilestones.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isLast = index == PortfolioData.journeyMilestones.length - 1;

                  return _TimelineRow(
                    milestone: item,
                    isLast: isLast,
                    isDark: isDark,
                    isMobile: isMobile,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineRow extends StatefulWidget {
  final JourneyMilestone milestone;
  final bool isLast;
  final bool isDark;
  final bool isMobile;

  const _TimelineRow({
    required this.milestone,
    required this.isLast,
    required this.isDark,
    required this.isMobile,
  });

  @override
  State<_TimelineRow> createState() => _TimelineRowState();
}

class _TimelineRowState extends State<_TimelineRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final m = widget.milestone;
    final isDark = widget.isDark;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column: Year Badge (on Desktop) or Indicator
          SizedBox(
            width: widget.isMobile ? 64 : 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: m.accentColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: m.accentColor.withValues(alpha: 0.35),
                    ),
                  ),
                  child: Text(
                    m.year,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: m.accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Middle Column: Dot + Vertical Spine Line
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? const Color(0xFF111726) : Colors.white,
                  border: Border.all(
                    color: m.accentColor,
                    width: 3.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: m.accentColor.withValues(alpha: 0.4),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          m.accentColor.withValues(alpha: 0.6),
                          isDark ? const Color(0xFF1E283E) : const Color(0xFFCBD5E1),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),

          // Right Column: Milestone Card
          Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.only(bottom: widget.isLast ? 0 : 28),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF111726) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _hovered
                        ? m.accentColor.withValues(alpha: 0.8)
                        : (isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0)),
                    width: _hovered ? 1.5 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _hovered
                          ? m.accentColor.withValues(alpha: isDark ? 0.15 : 0.06)
                          : Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
                      blurRadius: _hovered ? 20 : 6,
                      offset: Offset(0, _hovered ? 6 : 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                m.title,
                                style: TextStyle(
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w800,
                                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                                  letterSpacing: -0.3,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                m.subtitle,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: m.accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: m.accentColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(m.icon, color: m.accentColor, size: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      m.description,
                      style: TextStyle(
                        fontSize: 13.5,
                        height: 1.55,
                        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
