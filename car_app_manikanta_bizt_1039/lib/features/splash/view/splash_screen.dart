import 'package:car_app_manikanta_bizt_1039/features/splash/viewmodel/splash_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/routes/routes_constants.dart';
import 'package:car_app_manikanta_bizt_1039/services/navigation_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/local_storage_constaints.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LogoWidget(
          width: 300,
          height: 300,
        ),
      ),
    );
  }

  @override
  void initState() {
    gettingUserSession();
    super.initState();
  }

  gettingUserSession() async {
    await Future.delayed(const Duration(seconds: splashDuration));
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final userID = sp.getString(LocalStorageConstants.userId) ?? "";
    if (userID.isEmpty) {
      NavigationServices().replaceAll(RoutesConstants.loginScreen);
    } else {
      NavigationServices().replaceAll(RoutesConstants.homeScreen);
    }
  }
}
