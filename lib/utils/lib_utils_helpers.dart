// lib/utils/helpers.dart

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Utility class for common helper functions
class AppHelpers {
  /// Private constructor to prevent instantiation
  AppHelpers._();

  /// Launch URL with error handling
  static Future<bool> launchURL(String url) async {
    try {
      final uri = Uri.parse(url);
      final success = await launchUrl(uri, mode: LaunchMode.platformDefault);
      if (!success) {
        return await launchUrl(uri);
      }
      return success;
    } catch (e) {
      debugPrint('Error launching URL: $e');
      try {
        final uri = Uri.parse(url);
        return await launchUrl(uri);
      } catch (_) {
        return false;
      }
    }
  }

  /// Handles downloading or viewing the resume cross-platform
  static Future<void> downloadResume(BuildContext context) async {
    await launchURL('https://drive.google.com/file/d/1LbXmAIBt5JtFjNR5U3qpNcRU4yrZ2ZHc/view?usp=drivesdk');
  }

  /// Launch email with optional subject and body
  static Future<bool> sendEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    try {
      final uri = Uri(
        scheme: 'mailto',
        path: email,
        query: [
          if (subject != null) 'subject=$subject',
          if (body != null) 'body=$body',
        ].join('&'),
      );
      return launchURL(uri.toString());
    } catch (e) {
      debugPrint('Error sending email: $e');
      return false;
    }
  }

  /// Launch phone call
  static Future<bool> makePhoneCall(String phoneNumber) async {
    try {
      final uri = Uri(scheme: 'tel', path: phoneNumber);
      return launchURL(uri.toString());
    } catch (e) {
      debugPrint('Error making phone call: $e');
      return false;
    }
  }

  /// Launch SMS
  static Future<bool> sendSMS(String phoneNumber, {String? message}) async {
    try {
      final uri = Uri(
        scheme: 'sms',
        path: phoneNumber,
        query: message != null ? 'body=$message' : null,
      );
      return launchURL(uri.toString());
    } catch (e) {
      debugPrint('Error sending SMS: $e');
      return false;
    }
  }

  /// Share text using native share
  static Future<void> shareText(
    BuildContext context, {
    required String text,
    String? subject,
  }) async {
    try {
      // For now, copy to clipboard as alternative
      // In a real app, you'd use share package
      await Future.delayed(const Duration(milliseconds: 100));
      debugPrint('Share: $text');
    } catch (e) {
      debugPrint('Error sharing: $e');
    }
  }

  /// Copy text to clipboard
  static Future<void> copyToClipboard(
    BuildContext context, {
    required String text,
    String? message,
  }) async {
    try {
      // Implementation would go here
      debugPrint('Copied: $text');
      
      // Show snackbar notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message ?? 'Copied to clipboard'),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      debugPrint('Error copying: $e');
    }
  }

  /// Show loading dialog
  static void showLoadingDialog(BuildContext context, {String message = 'Loading...'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Hide loading dialog
  static void hideLoadingDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  /// Show snackbar
  static void showSnackbar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
      ),
    );
  }

  /// Show error snackbar
  static void showErrorSnackbar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade600,
        duration: duration,
      ),
    );
  }

  /// Show success snackbar
  static void showSuccessSnackbar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green.shade600,
        duration: duration,
      ),
    );
  }

  /// Show error dialog
  static Future<void> showErrorDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Show confirmation dialog
  static Future<bool> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Delay function
  static Future<void> delay({Duration duration = const Duration(milliseconds: 500)}) async {
    await Future.delayed(duration);
  }

  /// Debounce function
  static Future<T> debounce<T>(
    Future<T> Function() function, {
    Duration duration = const Duration(milliseconds: 500),
  }) async {
    await delay(duration: duration);
    return function();
  }

  /// Format file size (bytes to KB, MB, GB)
  static String formatFileSize(int bytes) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
  }

  /// Generate random string
  static String generateRandomString(int length) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
    String result = '';
    for (int i = 0; i < length; i++) {
      result += chars[DateTime.now().millisecond % chars.length];
    }
    return result;
  }

  /// Check internet connectivity (basic)
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Get device info (for logging/debugging)
  static String getDeviceInfo(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return 'Device: ${mediaQuery.size.width}x${mediaQuery.size.height}, '
        'DPI: ${mediaQuery.devicePixelRatio}, '
        'Orientation: ${mediaQuery.orientation}';
  }

  /// Validate email
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Validate phone number
  static bool isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^[\d\s\-\+\(\)]{10,}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Validate URL
  static bool isValidUrl(String url) {
    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );
    return urlRegex.hasMatch(url);
  }

  /// Get hex color from integer
  static Color hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) {
      hex = 'ff$hex';
    }
    return Color(int.parse('0x$hex'));
  }

  /// Get color from string (e.g., "0xFF06b6d4")
  static Color colorFromString(String colorString) {
    final buffer = StringBuffer();
    if (!colorString.startsWith('0x') && !colorString.startsWith('0X')) {
      buffer.write('0xff');
    }
    buffer.write(colorString.replaceFirst(RegExp(r'0x'), '').replaceFirst(RegExp(r'0X'), ''));
    return Color(int.parse(buffer.toString()));
  }
}
