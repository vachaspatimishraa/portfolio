import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';
import '../utils/url_helper.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onBackToTop;

  const FooterSection({super.key, required this.onBackToTop});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final currentYear = DateTime.now().year;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 750;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF07090E) : const Color(0xFFF1F5F9),
        border: Border(
          top: BorderSide(
            color: isDark ? const Color(0xFF1E283E) : const Color(0xFFE2E8F0),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (screenWidth > 1200 ? 64 : 32),
        vertical: 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: isMobile
              ? Column(
                  children: [
                    _buildIdentity(isDark),
                    const SizedBox(height: 20),
                    _buildLinks(isDark),
                    const SizedBox(height: 24),
                    _buildCopyright(currentYear, isDark),
                    const SizedBox(height: 16),
                    _buildBackToTop(isDark),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildIdentity(isDark)),
                    _buildLinks(isDark),
                    const SizedBox(width: 32),
                    Row(
                      children: [
                        _buildCopyright(currentYear, isDark),
                        const SizedBox(width: 16),
                        _buildBackToTop(isDark),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildIdentity(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioData.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          PortfolioData.role,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildLinks(bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FooterLink(
          label: 'GitHub',
          onTap: () => UrlHelper.openUrl(PortfolioData.githubUrl),
          isDark: isDark,
        ),
        _dot(isDark),
        _FooterLink(
          label: 'LinkedIn',
          onTap: () => UrlHelper.openUrl(PortfolioData.linkedinUrl),
          isDark: isDark,
        ),
        _dot(isDark),
        _FooterLink(
          label: 'Email',
          onTap: () => UrlHelper.sendEmail(PortfolioData.email),
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _dot(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '•',
        style: TextStyle(
          color: isDark ? const Color(0xFF475569) : const Color(0xFF94A3B8),
        ),
      ),
    );
  }

  Widget _buildCopyright(int year, bool isDark) {
    return Text(
      '© $year Vachaspati Mishra',
      style: TextStyle(
        fontSize: 12,
        color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
      ),
    );
  }

  Widget _buildBackToTop(bool isDark) {
    return IconButton(
      onPressed: onBackToTop,
      tooltip: 'Back to top',
      icon: const Icon(Icons.arrow_upward_rounded, size: 18),
      style: IconButton.styleFrom(
        backgroundColor: isDark ? const Color(0xFF161F33) : Colors.white,
        foregroundColor: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0),
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isDark;

  const _FooterLink({
    required this.label,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
          ),
        ),
      ),
    );
  }
}
