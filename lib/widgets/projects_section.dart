import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';
import '../utils/url_helper.dart';
import 'project_detail_modal.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final categories = ['All', 'AI & Career', 'FinTech & Tools', 'Communication'];
    final filteredProjects = _selectedCategory == 'All'
        ? PortfolioData.projects
        : PortfolioData.projects.where((p) => p.category == _selectedCategory).toList();

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
                  'COMPLETED & ACTIVE PRODUCTS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: isDark ? const Color(0xFF818CF8) : const Color(0xFF4F46E5),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Headline & Subtitle
              Text(
                'Featured Digital Products',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Production-ready applications engineered with Flutter, offline-first databases, real-time cloud backends, and user-centric ergonomics.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 28),

              // Category Filter Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((cat) {
                    final isSelected = _selectedCategory == cat;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () => setState(() => _selectedCategory = cat),
                        borderRadius: BorderRadius.circular(20),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF6366F1)
                                : (isDark ? const Color(0xFF161F33) : const Color(0xFFF1F5F9)),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF6366F1)
                                  : (isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1)),
                            ),
                          ),
                          child: Text(
                            cat == 'All' ? 'All Products (${PortfolioData.projects.length})' : cat,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : (isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 36),

              // Responsive Project Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth > 1050) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth > 650) {
                    crossAxisCount = 2;
                  }

                  final chunked = <List<ProjectItem>>[];
                  for (var i = 0; i < filteredProjects.length; i += crossAxisCount) {
                    chunked.add(
                      filteredProjects.sublist(
                        i,
                        (i + crossAxisCount > filteredProjects.length)
                            ? filteredProjects.length
                            : i + crossAxisCount,
                      ),
                    );
                  }

                  return Column(
                    children: chunked.map((row) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var j = 0; j < row.length; j++) ...[
                              if (j > 0) const SizedBox(width: 24),
                              Expanded(
                                child: _ProjectCard(
                                  project: row[j],
                                  onViewDetails: () =>
                                      ProjectDetailModal.show(context, row[j]),
                                ),
                              ),
                            ],
                            // Filler if last row has fewer items
                            for (var k = 0; k < crossAxisCount - row.length; k++) ...[
                              const SizedBox(width: 24),
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

class _ProjectCard extends StatefulWidget {
  final ProjectItem project;
  final VoidCallback onViewDetails;

  const _ProjectCard({
    required this.project,
    required this.onViewDetails,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final project = widget.project;
    final primaryAccent = project.gradientColors.first;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF111726) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? primaryAccent.withValues(alpha: 0.8)
                : (isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0)),
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? primaryAccent.withValues(alpha: isDark ? 0.22 : 0.1)
                  : Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
              blurRadius: _hovered ? 28 : 12,
              offset: Offset(0, _hovered ? 8 : 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Screenshot Banner if available
            if (project.imageAsset != null)
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      project.imageAsset!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: project.gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            (isDark ? const Color(0xFF111726) : Colors.white).withValues(alpha: 0.95),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: _buildStatusBadge(project, isDark),
                    ),
                  ],
                ),
              )
            else
              // Gradient Accent Bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: project.gradientColors,
                  ),
                ),
              ),

            // Card Body
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row (only if no image header)
                  if (project.imageAsset == null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                project.gradientColors.first.withValues(alpha: 0.18),
                                project.gradientColors.last.withValues(alpha: 0.18),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            _getIcon(project.id),
                            color: project.gradientColors.first,
                            size: 22,
                          ),
                        ),
                        _buildStatusBadge(project, isDark),
                      ],
                    ),
                  if (project.imageAsset == null) const SizedBox(height: 16),

                  // Name & Tagline
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          project.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.4,
                            color: isDark ? Colors.white : const Color(0xFF0F172A),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF182238) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          project.category,
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    project.tagline,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: project.gradientColors.first,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Description
                  Text(
                    project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.55,
                      color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tech Badges
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.technologies.take(4).map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF182238) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1),
                          ),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 22),

                  // Card Action Bar
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.tonal(
                          onPressed: widget.onViewDetails,
                          style: FilledButton.styleFrom(
                            backgroundColor: isDark ? const Color(0xFF182238) : const Color(0xFFEEF2F6),
                            foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View Details',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_outward_rounded, size: 14),
                            ],
                          ),
                        ),
                      ),
                      if (project.githubUrl != null) ...[
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () => UrlHelper.openUrl(project.githubUrl!),
                          tooltip: 'GitHub Repository',
                          icon: const Icon(Icons.code_rounded, size: 18),
                          style: IconButton.styleFrom(
                            backgroundColor: isDark ? const Color(0xFF182238) : const Color(0xFFEEF2F6),
                            foregroundColor: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(ProjectItem project, bool isDark) {
    final isCompleted = project.status == 'Completed';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isCompleted
            ? (isDark ? const Color(0x2E10B981) : const Color(0x22059669))
            : (isDark ? const Color(0x2E0EA5E9) : const Color(0x220284C7)),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCompleted
              ? (isDark ? const Color(0x6610B981) : const Color(0x66059669))
              : (isDark ? const Color(0x660EA5E9) : const Color(0x660284C7)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isCompleted ? const Color(0xFF10B981) : const Color(0xFF0EA5E9),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            project.status,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isCompleted
                  ? (isDark ? const Color(0xFF34D399) : const Color(0xFF047857))
                  : (isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7)),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String id) {
    switch (id) {
      case 'voryn':
        return Icons.videocam_rounded;
      case 'fintrack':
        return Icons.account_balance_wallet_rounded;
      case 'vitafolio':
        return Icons.description_rounded;
      case 'taskuvo':
        return Icons.task_alt_rounded;
      case 'prepmate':
        return Icons.school_rounded;
      default:
        return Icons.folder_outlined;
    }
  }
}
