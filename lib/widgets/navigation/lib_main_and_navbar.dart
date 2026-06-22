// lib/widgets/navigation/custom_nav_bar.dart

import 'package:flutter/material.dart';
import 'dart:ui';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../utils/lib_utils_helpers.dart';

class CustomNavBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;

  const CustomNavBar({
    Key? key,
    this.onMenuTap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppTheme.primaryDark.withValues(alpha: 0.8),
        border: const Border(
          bottom: BorderSide(color: AppTheme.borderColor),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 48,
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo & Mobile Menu
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isMobile && widget.onMenuTap != null) ...[
                      IconButton(
                        icon: const Icon(Icons.menu, color: AppTheme.accentCyan),
                        onPressed: widget.onMenuTap,
                      ),
                      const SizedBox(width: 8),
                    ],
                    ShaderMask(
                      shaderCallback: (bounds) => AppTheme.cyanToBlue.createShader(bounds),
                      child: Text(
                        'VM',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'SpaceGrotesk',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                // Center Title
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        isMobile 
                          ? 'Vachaspati Mishra' 
                          : 'Vachaspati Mishra ( Flutter Developer )',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.accentCyan,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),

                // Resume Button
                InkWell(
                  onTap: () => AppHelpers.launchURL(AppConstants.resumeUrl),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppTheme.cyanToBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Resume',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
