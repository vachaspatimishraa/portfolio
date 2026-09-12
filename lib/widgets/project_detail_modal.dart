import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';
import '../utils/url_helper.dart';

class ProjectDetailModal extends StatelessWidget {
  final ProjectItem project;

  const ProjectDetailModal({super.key, required this.project});

  static void show(BuildContext context, ProjectItem project) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (ctx) => ProjectDetailModal(project: project),
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760, maxHeight: 850),
            child: ProjectDetailModal(project: project),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111726) : Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 24 : 20),
        border: Border.all(
          color: isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.6 : 0.15),
            blurRadius: 32,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isMobile ? 24 : 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Modal Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF161F33) : const Color(0xFFF8FAFC),
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getProjectIcon(project.id),
                      color: theme.colorScheme.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              project.name,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: project.status == 'Active'
                                    ? (isDark ? const Color(0x2210B981) : const Color(0x22059669))
                                    : (isDark ? const Color(0x22F59E0B) : const Color(0x22D97706)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                project.status,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: project.status == 'Active'
                                      ? (isDark ? const Color(0xFF34D399) : const Color(0xFF047857))
                                      : (isDark ? const Color(0xFFFBBF24) : const Color(0xFFB45309)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          project.tagline,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                    tooltip: 'Close',
                    style: IconButton.styleFrom(
                      foregroundColor: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),

            // Modal Body
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Screenshot Banner if available
                    if (project.imageAsset != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1),
                            ),
                          ),
                          child: Image.asset(
                            project.imageAsset!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Overview
                    _buildSectionHeader(context, 'Overview & Purpose', Icons.info_outline_rounded),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Problem Statement
                    _buildSectionHeader(context, 'Problem Solved', Icons.help_outline_rounded),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0E1320) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1),
                        ),
                      ),
                      child: Text(
                        project.problemStatement,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                          color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Key Features
                    _buildSectionHeader(context, 'Key Features', Icons.check_circle_outline_rounded),
                    const SizedBox(height: 12),
                    ...project.keyFeatures.map((feat) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4, right: 10),
                                child: Icon(
                                  Icons.arrow_right_alt_rounded,
                                  size: 18,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  feat,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    height: 1.5,
                                    color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 20),

                    // Architecture & Engineering Decisions
                    _buildSectionHeader(
                      context,
                      'Architecture & Engineering Decisions',
                      Icons.account_tree_outlined,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.architecture,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.6,
                        color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Technologies Used
                    _buildSectionHeader(context, 'Technologies', Icons.code_rounded),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: theme.colorScheme.primary.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            // Modal Footer Actions
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF161F33) : const Color(0xFFF8FAFC),
                border: Border(
                  top: BorderSide(
                    color: isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (project.githubUrl != null) ...[
                    OutlinedButton.icon(
                      onPressed: () => UrlHelper.openUrl(project.githubUrl!),
                      icon: const Icon(Icons.code_rounded, size: 18),
                      label: const Text('View on GitHub'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        side: BorderSide(
                          color: isDark ? const Color(0xFF2E3D60) : const Color(0xFFCBD5E1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Done'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Row(
      children: [
        Icon(icon, size: 18, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }

  static IconData _getProjectIcon(String id) {
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
