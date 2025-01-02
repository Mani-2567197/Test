import 'package:car_app_manikanta_bizt_1039/features/cars/view/cars_view.dart';
import 'package:car_app_manikanta_bizt_1039/features/profile/view/profile_screen.dart';
import 'package:car_app_manikanta_bizt_1039/utils/colors_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = const [
    CarsView(),
    ProfileScreen(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
            children: [
             TabBar(
                indicatorColor: ColorsConstants.primaryColor,
                tabs: const [
                  Tab(icon: Icon(Icons.home), text: 'Home'),
                  Tab(icon: Icon(Icons.person), text: 'Profile'),
                ],
                onTap: (index) {
                  setState(() {
                    currentIndex = index; 
                  });
                },),
              Expanded(
                child: TabBarView(
                  children: screens)
              ),
            ],
          ),
      ),
    );
  }
}
