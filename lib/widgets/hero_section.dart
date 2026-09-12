import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';
import '../utils/url_helper.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onExploreProjects;
  final VoidCallback onContactTap;
  final VoidCallback onJourneyTap;

  const HeroSection({
    super.key,
    required this.onExploreProjects,
    required this.onContactTap,
    required this.onJourneyTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 980;

    return Stack(
      children: [
        // Ambient Background Glow Mesh
        Positioned(
          top: -100,
          right: -80,
          child: Container(
            width: 480,
            height: 480,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF6366F1).withValues(alpha: 0.18),
                  const Color(0xFF0EA5E9).withValues(alpha: 0.05),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -80,
          left: -80,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF8B5CF6).withValues(alpha: 0.12),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Hero Content
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (screenWidth > 1250 ? 64 : 32),
            vertical: isMobile ? 40 : 88,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMobileProfileBadge(context),
                        const SizedBox(height: 28),
                        _buildHeroLeft(context, isMobile: true),
                        const SizedBox(height: 44),
                        _buildHeroRight(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 6, child: _buildHeroLeft(context, isMobile: false)),
                        const SizedBox(width: 48),
                        Expanded(flex: 5, child: _buildHeroRight(context)),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileProfileBadge(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFF0EA5E9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6366F1).withValues(alpha: 0.4),
                blurRadius: 18,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(3),
          child: ClipOval(
            child: Image.asset(
              PortfolioData.avatarAsset,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 36),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                PortfolioData.name,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0x1F10B981) : const Color(0x15059669),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark ? const Color(0x5510B981) : const Color(0x35059669),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'B.Tech CSE Graduate (2026) • MBA 2nd Year',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isDark ? const Color(0xFF34D399) : const Color(0xFF047857),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeroLeft(BuildContext context, {required bool isMobile}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile) ...[
          // Desktop Status Pill + Mini Avatar
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFF0EA5E9)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6366F1).withValues(alpha: 0.35),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(2),
                child: ClipOval(
                  child: Image.asset(
                    PortfolioData.avatarAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFF6366F1).withValues(alpha: 0.35),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'B.Tech CSE Graduate (7.4 CGPA) • MBA 2nd Year (IT & Marketing)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isDark ? const Color(0xFFC7D2FE) : const Color(0xFF4338CA),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],

        // Hero Headline
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: isMobile ? 36 : 52,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.3,
              height: 1.12,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
            children: [
              const TextSpan(text: 'I build '),
              TextSpan(
                text: 'products',
                style: TextStyle(
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF0EA5E9)],
                    ).createShader(const Rect.fromLTWH(0, 0, 240, 70)),
                ),
              ),
              const TextSpan(text: ',\nnot just projects.'),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // Subtitle Narrative
        Text(
          'Hi, I’m Vachaspati Mishra. I graduated in 2026 with a B.Tech in Computer Science & Engineering '
          '(7.4 CGPA) from AKTU and am currently in the 2nd year of my MBA in IT & Marketing. '
          'I engineer complete, production-ready applications across career tech (PrepMateAI), '
          'productivity (Taskuvo), personal finance (FinTrack), and real-time communication (Voryn).',
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.65,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
            fontSize: 15.5,
          ),
        ),
        const SizedBox(height: 28),

        // Metrics Grid (4 items)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF111726) : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1),
            ),
          ),
          child: Row(
            children: [
              Expanded(child: _buildStatItem('7.4 CGPA', 'B.Tech CSE (2026)', isDark)),
              _buildStatDivider(isDark),
              Expanded(child: _buildStatItem('MBA 2nd Yr', 'IT & Marketing', isDark)),
              _buildStatDivider(isDark),
              Expanded(child: _buildStatItem('Completed', 'Taskuvo & PrepMate', isDark)),
              _buildStatDivider(isDark),
              Expanded(child: _buildStatItem('5 Products', 'Full Portfolio', isDark)),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Action Buttons
        Wrap(
          spacing: 14,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            FilledButton(
              onPressed: onExploreProjects,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Explore Completed Products',
                    style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_downward_rounded, size: 16),
                ],
              ),
            ),
            OutlinedButton.icon(
              onPressed: onJourneyTap,
              icon: Icon(
                Icons.timeline_rounded,
                size: 16,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
              ),
              label: Text(
                'Career Journey',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                side: BorderSide(
                  color: isDark ? const Color(0xFF2E3D60) : const Color(0xFFCBD5E1),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: onContactTap,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                side: BorderSide(
                  color: isDark ? const Color(0xFF2E3D60) : const Color(0xFFCBD5E1),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Let’s Connect',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Quick Social Links
        Row(
          children: [
            _SocialIconBtn(
              icon: Icons.code_rounded,
              tooltip: 'GitHub Profile',
              onTap: () => UrlHelper.openUrl(PortfolioData.githubUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconBtn(
              icon: Icons.work_outline_rounded,
              tooltip: 'LinkedIn Profile',
              onTap: () => UrlHelper.openUrl(PortfolioData.linkedinUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconBtn(
              icon: Icons.mail_outline_rounded,
              tooltip: 'Email (vachaspatimishra@outlook.in)',
              onTap: () => UrlHelper.sendEmail(PortfolioData.email),
            ),
            const SizedBox(width: 12),
            _SocialIconBtn(
              icon: Icons.phone_outlined,
              tooltip: 'Call (+91 8081025075)',
              onTap: () => UrlHelper.makePhoneCall(PortfolioData.phone),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String val, String label, bool isDark) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          val,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
            color: Color(0xFF6366F1),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider(bool isDark) {
    return Container(
      width: 1,
      height: 24,
      color: isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1),
    );
  }

  Widget _buildHeroRight(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111726) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? const Color(0xFF23304E) : const Color(0xFFE2E8F0),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: isDark ? 0.18 : 0.08),
            blurRadius: 36,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Window Bar with Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFEF4444), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFF59E0B), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF182238) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'vachaspati.profile.dart',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Courier',
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Code Architecture Block
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0A0D14) : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isDark ? const Color(0xFF1E283E) : const Color(0xFFE2E8F0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _codeLine('final', ' vachaspati = ', 'EngineerAndBuilder(', isDark),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _codeArg('education: ', '"B.Tech CSE (7.4 CGPA, 2026)",', isDark),
                      _codeArg('mba: ', '"2nd Year (IT & Marketing)",', isDark),
                      _codeArg('completedProducts: ', '["Taskuvo", "PrepMateAI", "FinTrack", "VitaFolio"],', isDark),
                      _codeArg('activeFlagship: ', '"Voryn (Calling Engine)",', isDark),
                    ],
                  ),
                ),
                _codeLine(');', '', '', isDark),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Real Preview Cards Showcase
          Text(
            'FEATURED COMPLETE PRODUCTS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
            ),
          ),
          const SizedBox(height: 12),

          // Product Showcase Tiles
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 104,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/projects/prepmate_ai.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(color: const Color(0xFF1E2230)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.85)],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF10B981),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text('COMPLETED', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'PrepMateAI',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 104,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/projects/connectify.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(color: const Color(0xFF1E2230)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.85)],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0EA5E9),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text('ACTIVE', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Voryn Engine',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _codeLine(String keyword, String mid, String tail, bool isDark) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontFamily: 'Courier', fontSize: 13),
        children: [
          TextSpan(text: keyword, style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
          TextSpan(text: mid, style: TextStyle(color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF0F172A))),
          TextSpan(text: tail, style: const TextStyle(color: Color(0xFF38BDF8))),
        ],
      ),
    );
  }

  Widget _codeArg(String prop, String val, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontFamily: 'Courier', fontSize: 12),
          children: [
            TextSpan(text: prop, style: TextStyle(color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569))),
            TextSpan(text: val, style: const TextStyle(color: Color(0xFF10B981))),
          ],
        ),
      ),
    );
  }
}

class _SocialIconBtn extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialIconBtn({required this.icon, required this.tooltip, required this.onTap});

  @override
  State<_SocialIconBtn> createState() => _SocialIconBtnState();
}

class _SocialIconBtnState extends State<_SocialIconBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _hovered
                  ? const Color(0xFF6366F1).withValues(alpha: 0.15)
                  : (isDark ? const Color(0xFF161F33) : const Color(0xFFF1F5F9)),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _hovered
                    ? const Color(0xFF6366F1)
                    : (isDark ? const Color(0xFF23304E) : const Color(0xFFCBD5E1)),
              ),
            ),
            child: Icon(
              widget.icon,
              size: 20,
              color: _hovered
                  ? const Color(0xFF6366F1)
                  : (isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
            ),
          ),
        ),
      ),
    );
  }
}
