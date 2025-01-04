import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/welcome/view/welcome.dart';
import 'package:food_delivery_app/routes/routes_constants.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.welcomeScreen,
      routes: <RouteBase>[
        GoRoute(
          path: RoutesConstants.welcomeScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const Welcome();
          },
        )
      ]);
}
