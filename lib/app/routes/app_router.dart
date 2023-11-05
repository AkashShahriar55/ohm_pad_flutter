import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/landing_screen.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/splash/splash_screen.dart';
import 'package:ohm_pad_flutter/app/routes/app_routes.dart';

abstract class _Path {
  static const String splash = '/splash';
  static const String home = '/landing';
  static const String details = '/details';
  static const String settings = '/settings';
}

final appRouter = GoRouter(
  initialLocation: _Path.splash,
  // observers: [
  //   GoRouterObserver(GoRouterBindings()),
  // ],
  routes: <RouteBase>[
    GoRoute(
      path: _Path.splash,
      name: AppRoutes.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: _Path.home,
      name: AppRoutes.landing,
      builder: (BuildContext context, GoRouterState state) {
        return const LandingScreen();
      },
    ),
    // GoRoute(
    //   path: _Path.details,
    //   name: AppRoutes.details,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const DetailsScreen();
    //   },
    // ),
    // GoRoute(
    //   path: _Path.settings,
    //   name: AppRoutes.settings,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const SettingsScreen();
    //   },
    // ),
  ],
);
