// lib/widgets/cards/project_card.dart

import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../models/project_model.dart';
import '../../utils/lib_utils_helpers.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onTap;

  const ProjectCard({
    Key? key,
    required this.project,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    Widget imageSection = Container(
      width: isMobile ? double.infinity : 220,
      height: isMobile ? 180 : double.infinity,
      decoration: BoxDecoration(
        borderRadius: isMobile
            ? const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
        gradient: widget.project.imagePath == null
            ? LinearGradient(
                colors: [
                  Color(int.parse('FF${widget.project.gradientStart.replaceFirst('#', '')}', radix: 16)),
                  Color(int.parse('FF${widget.project.gradientEnd.replaceFirst('#', '')}', radix: 16)),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
      ),
      child: ClipRRect(
        borderRadius: isMobile
            ? const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
        child: Stack(
          children: [
            if (widget.project.imagePath != null)
              Positioned.fill(
                child: Image.asset(
                  widget.project.imagePath!,
                  fit: BoxFit.cover,
                ),
              ),
            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppTheme.primaryMedium.withValues(alpha: 0.9),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Widget contentSection = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title and Description
          Text(
            widget.project.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.project.description,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 12),

          // Metrics
          if (widget.project.metrics.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.only(top: 12),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppTheme.borderColor, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.project.metrics.entries
                  .take(3)
                  .map((entry) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        entry.value,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.accentCyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        entry.key,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 10),
                      ),
                    ],
                  )).toList(),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // Tech Stack
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: widget.project.techStack.map((tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primaryDark.withValues(alpha: 0.5),
                border: Border.all(color: AppTheme.borderColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tech,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.textSecondary,
                  fontSize: 10,
                ),
              ),
            )).toList(),
          ),

          const SizedBox(height: 16),

          // Action Buttons
          if (widget.project.githubUrl != null)
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () => AppHelpers.launchURL(widget.project.githubUrl!),
                icon: const Icon(Icons.code, size: 16, color: AppTheme.accentCyan),
                label: const Text('GitHub', style: TextStyle(color: Colors.white, fontSize: 12)),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: AppTheme.primaryDark.withValues(alpha: 0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: AppTheme.borderColor),
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered 
              ? AppTheme.accentCyan.withValues(alpha: 0.5)
              : AppTheme.borderColor,
            width: _isHovered ? 2 : 1,
          ),
          color: AppTheme.primaryLight.withValues(alpha: 0.5),
        ),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageSection,
                  contentSection,
                ],
              )
            : IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    imageSection,
                    Expanded(child: contentSection),
                  ],
                ),
              ),
      ),
    );
  }
}

// lib/widgets/cards/skill_card.dart

class SkillCard extends StatefulWidget {
  final String skill;

  const SkillCard({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _isHovered 
            ? AppTheme.primaryLight.withValues(alpha: 0.8)
            : AppTheme.primaryLight.withValues(alpha: 0.5),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.accentCyan,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                  widget.skill,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/widgets/cards/timeline_item.dart

class TimelineItemWidget extends StatelessWidget {
  final String year;
  final String title;
  final String description;
  final String type;
  final String status;
  final bool isLast;

  const TimelineItemWidget({
    Key? key,
    required this.year,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.accentCyan,
                  border: Border.all(
                    color: AppTheme.primaryDark,
                    width: 4,
                  ),
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 100,
                  color: AppTheme.accentCyan.withValues(alpha: 0.5),
                ),
            ],
          ),

          const SizedBox(width: 32),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      year,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.accentCyan,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryLight.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        type.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (status.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    status,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
