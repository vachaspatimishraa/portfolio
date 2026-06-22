// lib/config/routes.dart

import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/projects_grid_screen.dart';

/// App route paths
class AppRoutes {
  /// Private constructor to prevent instantiation
  AppRoutes._();

  /// Home route
  static const String home = '/';

  /// Projects detailed view route
  static const String projects = '/projects';

  /// About/Skills route
  static const String about = '/about';

  /// Contact route
  static const String contact = '/contact';

  /// 404 Not Found route
  static const String notFound = '/not-found';

  /// Get all route names
  static List<String> getAllRoutes() {
    return [
      home,
      projects,
      about,
      contact,
      notFound,
    ];
  }

  /// Check if route exists
  static bool routeExists(String routeName) {
    return getAllRoutes().contains(routeName);
  }
}

/// Named route arguments
class RouteArguments {
  final String projectId;
  final String? scrollTo;

  RouteArguments({
    required this.projectId,
    this.scrollTo,
  });
}

/// Route generator for named routes
class AppNavigator {
  /// Private constructor to prevent instantiation
  AppNavigator._();

  /// Generate routes based on route name
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case AppRoutes.projects:
        return MaterialPageRoute(
          builder: (_) => const ProjectsGridScreen(),
          settings: settings,
        );

      case AppRoutes.about:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(), // Replace with AboutScreen
          settings: settings,
        );

      case AppRoutes.contact:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(), // Replace with ContactScreen
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('404 - Page Not Found'),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(_, AppRoutes.home),
                    child: const Text('Go Home'),
                  ),
                ],
              ),
            ),
          ),
          settings: settings,
        );
    }
  }

  /// Push named route
  static Future<dynamic> pushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Push replacement route
  static Future<dynamic> pushReplacementNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(context).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Push and remove until
  static Future<dynamic> pushNamedAndRemoveUntil(
    BuildContext context,
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  /// Pop current route
  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop(result);
  }

  /// Pop until route
  static void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.of(context).popUntil(predicate);
  }

  /// Pop to home
  static void popToHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  /// Check if can pop
  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }

  /// Get current route name
  static String? getCurrentRoute(BuildContext context) {
    String? currentRoute;
    Navigator.of(context).popUntil((route) {
      currentRoute = route.settings.name;
      return true;
    });
    return currentRoute;
  }
}

/// Page transitions
class PageTransitions {
  /// Private constructor to prevent instantiation
  PageTransitions._();

  /// Fade transition
  static PageRoute<T> fadeTransition<T>(
    Widget page, {
    RouteSettings? settings,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: duration,
      settings: settings,
    );
  }

  /// Slide transition (left to right)
  static PageRoute<T> slideTransition<T>(
    Widget page, {
    RouteSettings? settings,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      transitionDuration: duration,
      settings: settings,
    );
  }

  /// Scale transition
  static PageRoute<T> scaleTransition<T>(
    Widget page, {
    RouteSettings? settings,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(scale: animation, child: child);
      },
      transitionDuration: duration,
      settings: settings,
    );
  }

  /// Rotation transition
  static PageRoute<T> rotationTransition<T>(
    Widget page, {
    RouteSettings? settings,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(turns: animation, child: child);
      },
      transitionDuration: duration,
      settings: settings,
    );
  }

  /// Size transition
  static PageRoute<T> sizeTransition<T>(
    Widget page, {
    RouteSettings? settings,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SizeTransition(
          sizeFactor: animation,
          axisAlignment: 0.0,
          child: child,
        );
      },
      transitionDuration: duration,
      settings: settings,
    );
  }
}

/// Utility for dialog navigation
class DialogNavigator {
  /// Private constructor to prevent instantiation
  DialogNavigator._();

  /// Show simple alert dialog
  static Future<void> showAlert(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  /// Show confirmation dialog
  static Future<bool> showConfirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }

  /// Show bottom sheet
  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required Widget Function(BuildContext) builder,
    bool isDismissible = true,
    bool enableDrag = true,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// Show fullscreen dialog
  static Future<T?> showFullscreenDialog<T>(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
  }) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => Dialog.fullscreen(child: child),
    );
  }
}
