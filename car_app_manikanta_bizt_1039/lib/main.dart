import 'package:car_app_manikanta_bizt_1039/features/add_car/repository/add_car_repo_impl.dart';
import 'package:car_app_manikanta_bizt_1039/features/add_car/viewmodel/add_car_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/bookings/repository/booking_repo_impl.dart';
import 'package:car_app_manikanta_bizt_1039/features/bookings/viewmodel/booking_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/cars/repository/car_repository_impl.dart';
import 'package:car_app_manikanta_bizt_1039/features/cars/viewmodel/cars_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/login/repository/login_repo_imp.dart';
import 'package:car_app_manikanta_bizt_1039/features/login/viewmodel/login_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/sign_up/repository/sign_up_repo_impl.dart';
import 'package:car_app_manikanta_bizt_1039/features/sign_up/viewmodel/sign_up_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        ChangeNotifierProvider(
          create: (_)=> AddCarViewModel(rep:AddCarRepoImpl())),
          ChangeNotifierProvider(
          create: (_)=> LoginViewModel(repo:LoginRepoImp())),
          ChangeNotifierProvider(
          create: (_)=> BookingViewModel(repo:BookingRepoImpl())),
           ChangeNotifierProvider(
          create: (_)=> CarsViewModel(repo:CarRepositoryImpl())),
          ChangeNotifierProvider(
          create: (_)=> SignUpViewModel(repo:SignUpRepoImpl())),
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