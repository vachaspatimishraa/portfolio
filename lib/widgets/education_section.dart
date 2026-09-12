import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

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
                  'ACADEMIC BACKGROUND',
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
                'Education & Academic Distinctions',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Rigorous foundations spanning business strategy, enterprise IT, computer engineering, and mathematical sciences.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 36),

              // Grid of 4 Education Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 850 ? 2 : 1;
                  final list = PortfolioData.educationList;

                  final chunked = <List<EducationItem>>[];
                  for (var i = 0; i < list.length; i += crossAxisCount) {
                    chunked.add(
                      list.sublist(
                        i,
                        (i + crossAxisCount > list.length) ? list.length : i + crossAxisCount,
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
                                child: _EduCard(item: row[j], isDark: isDark),
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

class _EduCard extends StatefulWidget {
  final EducationItem item;
  final bool isDark;

  const _EduCard({required this.item, required this.isDark});

  @override
  State<_EduCard> createState() => _EduCardState();
}

class _EduCardState extends State<_EduCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final isDark = widget.isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF111726) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered
                ? const Color(0xFF6366F1).withValues(alpha: 0.8)
                : (isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0)),
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? const Color(0xFF6366F1).withValues(alpha: isDark ? 0.18 : 0.08)
                  : Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
              blurRadius: _hovered ? 24 : 10,
              offset: Offset(0, _hovered ? 6 : 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item.icon, color: const Color(0xFF6366F1), size: 24),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: item.isPrimary
                            ? const Color(0xFF6366F1).withValues(alpha: 0.15)
                            : (isDark ? const Color(0xFF182238) : const Color(0xFFF1F5F9)),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: item.isPrimary
                              ? const Color(0xFF6366F1).withValues(alpha: 0.4)
                              : (isDark ? const Color(0xFF2E3D60) : const Color(0xFFCBD5E1)),
                        ),
                      ),
                      child: Text(
                        item.status,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: item.isPrimary
                              ? const Color(0xFF6366F1)
                              : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF182238) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark ? const Color(0xFF2E3D60) : const Color(0xFFCBD5E1),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded, size: 15, color: Color(0xFFF59E0B)),
                          const SizedBox(width: 4),
                          Text(
                            item.score,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: isDark ? Colors.white : const Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              item.degree,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.institution,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF6366F1),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${item.specializations} • ${item.duration}',
              style: TextStyle(
                fontSize: 12.5,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              item.note,
              style: TextStyle(
                fontSize: 13,
                height: 1.55,
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
