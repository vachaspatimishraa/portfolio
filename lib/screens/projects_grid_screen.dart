import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/cards/project_card.dart';
import '../widgets/common/animated_background.dart';
import '../utils/lib_utils_helpers.dart';

class ProjectsGridScreen extends StatelessWidget {
  const ProjectsGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet = MediaQuery.of(context).size.width >= 768 && MediaQuery.of(context).size.width < 1200;
    
    // Determine cross axis count based on screen width
    int crossAxisCount = 3;
    if (isMobile) {
      crossAxisCount = 1;
    } else if (isTablet) {
      crossAxisCount = 2;
    }

    return Scaffold(
      backgroundColor: AppTheme.colorBgPrimary,
      body: AnimatedBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Navigation Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppTheme.accentCyan),
                      onPressed: () => Navigator.pop(context),
                      hoverColor: AppTheme.primaryLight.withValues(alpha: 0.5),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'All Projects',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SpaceGrotesk',
                      ),
                    ),
                  ],
                ),
              ),
              
              // Project Grid/List
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: isMobile
                          ? Column(
                              children: PortfolioData.projects.map((project) => Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: ProjectCard(
                                  project: project,
                                  onTap: () {
                                    if (project.githubUrl != null) {
                                      AppHelpers.launchURL(project.githubUrl!);
                                    }
                                  },
                                ),
                              )).toList(),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 24,
                                mainAxisSpacing: 24,
                                childAspectRatio: 1.15,
                              ),
                              itemCount: PortfolioData.projects.length,
                              itemBuilder: (context, index) {
                                final project = PortfolioData.projects[index];
                                return ProjectCard(
                                  project: project,
                                  onTap: () {
                                    if (project.githubUrl != null) {
                                      AppHelpers.launchURL(project.githubUrl!);
                                    }
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
