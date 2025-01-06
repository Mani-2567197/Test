import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/cart.dart';
import 'package:food_delivery_app/features/forgot_password/forgot_password.dart';
import 'package:food_delivery_app/features/home/view/home_screen.dart';
import 'package:food_delivery_app/features/loyality_poins/view/loyality_points.dart';
import 'package:food_delivery_app/features/menu/view/menu_screen.dart';
import 'package:food_delivery_app/features/new_password/view/newpassword.dart';
import 'package:food_delivery_app/features/sign_in/view/sign_in.dart';
import 'package:food_delivery_app/features/sign_up/view/sign_up.dart';
import 'package:food_delivery_app/features/verification_code/verfication_code.dart';
import 'package:food_delivery_app/features/welcome/view/welcome.dart';
import 'package:food_delivery_app/routes/routes_constants.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.home,
      routes: <RouteBase>[
        GoRoute(
          path: RoutesConstants.welcomeScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const Welcome();
          },
        ),
        GoRoute(
          path: RoutesConstants.forgot,
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPassword();
          },
        ),
        GoRoute(
          path: RoutesConstants.home,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.cart,
          builder: (BuildContext context, GoRouterState state) {
            return const Cart();
          },
        ),
        GoRoute(
          path: RoutesConstants.otp,
          builder: (BuildContext context, GoRouterState state) {
            return const VerficationCode();
          },
        ),
        GoRoute(
          path: RoutesConstants.loginScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SignIn();
          },
        ),
         GoRoute(
          path: RoutesConstants.newpassword,
          builder: (BuildContext context, GoRouterState state) {
            return const Newpassword();
          },
        ),
        GoRoute(
          path: RoutesConstants.signupscreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
         GoRoute(
          path: RoutesConstants.menu,
          builder: (BuildContext context, GoRouterState state) {
            return const MenuScreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.main2,
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),
         GoRoute(
          path: RoutesConstants.loyality,
          builder: (BuildContext context, GoRouterState state) {
            return const LoyalityPoints();
          },
        ),
      ]);
}
