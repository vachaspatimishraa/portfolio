// lib/utils/extensions.dart

import 'package:flutter/material.dart';

/// Extensions on BuildContext for responsive design
extension ResponsiveExtension on BuildContext {
  /// Check if screen width is mobile (< 768px)
  bool get isMobile => MediaQuery.of(this).size.width < 768;

  /// Check if screen width is tablet (768px - 1024px)
  bool get isTablet =>
      MediaQuery.of(this).size.width >= 768 &&
      MediaQuery.of(this).size.width < 1024;

  /// Check if screen width is desktop (>= 1024px)
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;

  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get device padding (safe area)
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Get device viewInsets (keyboard height, etc)
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Check if device is in landscape
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Check if device is in portrait
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Get responsive padding based on screen size
  double getResponsivePadding({
    double mobile = 16,
    double tablet = 24,
    double desktop = 48,
  }) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }

  /// Get responsive font size based on screen size
  double getResponsiveFontSize({
    double mobile = 14,
    double tablet = 16,
    double desktop = 18,
  }) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }

  /// Get responsive width
  double getResponsiveWidth({
    double mobile = 1.0,
    double tablet = 0.8,
    double desktop = 0.6,
  }) {
    if (isMobile) return screenWidth * mobile;
    if (isTablet) return screenWidth * tablet;
    return screenWidth * desktop;
  }
}

/// Extensions on String
extension StringExtension on String {
  /// Capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Convert to title case
  String toTitleCase() {
    return split(' ')
        .map((word) => word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  /// Check if string is email
  bool isEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Check if string is URL
  bool isUrl() {
    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );
    return urlRegex.hasMatch(this);
  }

  /// Check if string is phone number
  bool isPhoneNumber() {
    final phoneRegex = RegExp(r'^[\d\s\-\+\(\)]{10,}$');
    return phoneRegex.hasMatch(this);
  }

  /// Truncate string to max length with ellipsis
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength - ellipsis.length) + ellipsis;
  }
}

/// Extensions on DateTime
extension DateTimeExtension on DateTime {
  /// Format date as "Jan 15, 2024"
  String toFormattedString() {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[month - 1]} $day, $year';
  }

  /// Format date as "2024-01-15"
  String toISOString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Get difference in days from now
  int get daysFromNow {
    final now = DateTime.now();
    return difference(now).inDays;
  }

  /// Format as time difference (e.g., "2 days ago")
  String get timeAgo {
    final duration = DateTime.now().difference(this);

    if (duration.inDays > 365) {
      return '${(duration.inDays / 365).floor()} year${(duration.inDays / 365).floor() == 1 ? '' : 's'} ago';
    }
    if (duration.inDays > 30) {
      return '${(duration.inDays / 30).floor()} month${(duration.inDays / 30).floor() == 1 ? '' : 's'} ago';
    }
    if (duration.inDays > 0) {
      return '${duration.inDays} day${duration.inDays == 1 ? '' : 's'} ago';
    }
    if (duration.inHours > 0) {
      return '${duration.inHours} hour${duration.inHours == 1 ? '' : 's'} ago';
    }
    if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minute${duration.inMinutes == 1 ? '' : 's'} ago';
    }
    return 'Just now';
  }
}

/// Extensions on List
extension ListExtension<T> on List<T> {
  /// Get first element or null
  T? get firstOrNull => isEmpty ? null : first;

  /// Get last element or null
  T? get lastOrNull => isEmpty ? null : last;

  /// Get random element
  T? get randomElement => isEmpty ? null : this[(length * (DateTime.now().millisecond % 1000) / 1000).toInt()];

  /// Check if list contains any element matching condition
  bool containsWhere(bool Function(T) test) {
    return any((element) => test(element));
  }

  /// Map list and flatten results
  List<U> flatMap<U>(List<U> Function(T) transform) {
    return expand((element) => transform(element)).toList();
  }

  /// Chunk list into smaller lists
  List<List<T>> chunk(int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be positive');
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  /// Join list elements with separator
  String joinString(String separator) {
    return join(separator);
  }
}

/// Extensions on num (int and double)
extension NumExtension on num {
  /// Convert to percentage string (e.g., 0.75 -> "75%")
  String toPercentageString() {
    return '${(this * 100).toStringAsFixed(0)}%';
  }

  /// Format as currency (USD)
  String toCurrencyString() {
    return '\$${toStringAsFixed(2)}';
  }

  /// Format with thousand separators
  String toFormattedString() {
    return toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (Match match) => ',',
    );
  }

  /// Check if number is positive
  bool get isPositive => this > 0;

  /// Check if number is negative
  bool get isNegative => this < 0;

  /// Check if number is zero
  bool get isZero => this == 0;

  /// Clamp value between min and max
  num clamp(num min, num max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }
}

/// Extensions on Color
extension ColorExtension on Color {
  /// Get lighter version of color
  Color lighter({double amount = 0.1}) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightened = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return lightened.toColor();
  }

  /// Get darker version of color
  Color darker({double amount = 0.1}) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final darkened = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }

  /// Get complementary color
  Color get complementary {
    final hsl = HSLColor.fromColor(this);
    final complementary = hsl.withHue((hsl.hue + 180) % 360);
    return complementary.toColor();
  }

  /// Convert color to hex string
  String toHexString() {
    final argb = toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase();
    return '#$argb';
  }

  /// Check if color is dark
  bool get isDark {
    return computeLuminance() < 0.5;
  }

  /// Check if color is light
  bool get isLight {
    return computeLuminance() >= 0.5;
  }
}

/// Extensions on Duration
extension DurationExtension on Duration {
  /// Format duration as HH:MM:SS
  String toFormattedString() {
    final hours = inHours.toString().padLeft(2, '0');
    final minutes = (inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  /// Format duration as readable string (e.g., "2 hours, 30 minutes")
  String toReadableString() {
    final hours = inHours;
    final minutes = inMinutes % 60;
    final seconds = inSeconds % 60;

    final parts = <String>[];
    if (hours > 0) parts.add('$hours hour${hours == 1 ? '' : 's'}');
    if (minutes > 0) parts.add('$minutes minute${minutes == 1 ? '' : 's'}');
    if (seconds > 0) parts.add('$seconds second${seconds == 1 ? '' : 's'}');

    return parts.join(', ');
  }
}
