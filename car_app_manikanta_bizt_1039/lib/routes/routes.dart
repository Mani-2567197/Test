import 'package:car_app_manikanta_bizt_1039/features/add_car/view/add_car_screen.dart';
import 'package:car_app_manikanta_bizt_1039/features/bookings/view/booking_screen.dart';
import 'package:car_app_manikanta_bizt_1039/features/car_details/view/car_details.dart';
import 'package:car_app_manikanta_bizt_1039/features/home/view/home_screen.dart';
import 'package:car_app_manikanta_bizt_1039/features/login/view/login_screen.dart';
import 'package:car_app_manikanta_bizt_1039/features/profile/view/profile_screen.dart';
import 'package:car_app_manikanta_bizt_1039/features/sign_up/view/sign_up_screen.dart';
import 'package:car_app_manikanta_bizt_1039/features/splash/view/splash_screen.dart';
import 'package:car_app_manikanta_bizt_1039/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AppRouter {

static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

static final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.splashScreen,
  routes: <RouteBase>[
    GoRoute(
      path: RoutesConstants.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.loginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.signUpScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.carDetailsScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const CarDetails();
      },
    ),
    GoRoute(
        path: RoutesConstants.bookingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const BookingScreen();
        }),
    GoRoute(
        path: RoutesConstants.addCar,
        builder: (BuildContext context, GoRouterState state) {
          return const AddCarScreen();
        }),
    GoRoute(
        path: RoutesConstants.profileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        })
  ],
  errorBuilder: (BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  }
);
}
