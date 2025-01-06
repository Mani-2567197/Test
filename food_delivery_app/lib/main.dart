import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery_app/features/new_password/view/newpassword.dart';
import 'package:food_delivery_app/features/sign_in/view/sign_in.dart';
import 'package:food_delivery_app/features/welcome/view/welcome.dart';
import 'package:food_delivery_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  loader();
  runApp(const MyApp());
}

void loader() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       Provider(create: (context) => Welcome()),
       Provider(create: (context) => SignIn()),
       Provider(create: (context) => Newpassword()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
           builder: EasyLoading.init(),
      ),
    );
  }
}
