// lib/widgets/common/gradient_button.dart

import 'dart:ui';
import 'package:flutter/material.dart';
import '../../config/theme.dart';

class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final bool hasShadow;
  final double? width;
  final double height;
  final Widget? icon;
  final MainAxisAlignment iconAlignment;

  const GradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.hasShadow = true,
    this.width,
    this.height = 50,
    this.icon,
    this.iconAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: widget.isOutlined ? null : AppTheme.cyanToBlue,
              border: widget.isOutlined 
                ? Border.all(
                    color: _isHovered ? AppTheme.accentCyan : AppTheme.borderColor,
                  )
                : null,
              borderRadius: BorderRadius.circular(12),
              boxShadow: (widget.hasShadow && _isHovered && !widget.isOutlined)
                ? [
                    BoxShadow(
                      color: AppTheme.accentCyan.withValues(alpha: 0.4),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ]
                : null,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onPressed,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: widget.iconAlignment,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null) ...[
                        widget.icon!,
                        const SizedBox(width: 12),
                      ],
                      Text(
                        widget.text,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: widget.isOutlined && !_isHovered
                            ? AppTheme.textPrimary
                            : AppTheme.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// lib/widgets/common/gradient_text.dart

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? baseStyle;
  final Gradient gradient;
  final TextAlign textAlign;

  const GradientText(
    this.text, {
    Key? key,
    this.baseStyle,
    this.gradient = AppTheme.cyanToBlue,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(
        text,
        style: baseStyle ?? Theme.of(context).textTheme.displayLarge,
        textAlign: textAlign,
      ),
    );
  }
}

// lib/widgets/common/animated_background.dart

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    _controller2 = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Static background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primaryDark,
                AppTheme.primaryMedium,
                AppTheme.primaryDark,
              ],
            ),
          ),
        ),

        // Animated blob 1
        Positioned(
          top: 80,
          left: MediaQuery.of(context).size.width * 0.25,
          child: AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Opacity(
                opacity: 0.2,
                child: Transform.translate(
                  offset: Offset(
                    20 * (1 + (_controller1.value - 0.5).abs()),
                    10 * (1 + (_controller1.value - 0.5).abs()),
                  ),
                  child: Container(
                    width: 384,
                    height: 384,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.accentCyan.withValues(alpha: 0.2),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                      child: Container(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Animated blob 2
        Positioned(
          bottom: 80,
          right: MediaQuery.of(context).size.width * 0.25,
          child: AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Opacity(
                opacity: 0.2,
                child: Transform.translate(
                  offset: Offset(
                    -20 * (1 + (_controller2.value - 0.5).abs()),
                    -10 * (1 + (_controller2.value - 0.5).abs()),
                  ),
                  child: Container(
                    width: 384,
                    height: 384,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.accentBlue.withValues(alpha: 0.2),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                      child: Container(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Content
        widget.child,
      ],
    );
  }
}

// lib/widgets/common/section_header.dart

class SectionHeader extends StatelessWidget {
  final String title;
  final String? description;
  final TextAlign align;

  const SectionHeader({
    Key? key,
    required this.title,
    this.description,
    this.align = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align == TextAlign.center 
        ? CrossAxisAlignment.center 
        : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: AppTheme.textPrimary,
          ),
          textAlign: align,
        ),
        if (description != null) ...[
          const SizedBox(height: 12),
          Text(
            description!,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: align,
            maxLines: 3,
          ),
        ],
      ],
    );
  }
}
