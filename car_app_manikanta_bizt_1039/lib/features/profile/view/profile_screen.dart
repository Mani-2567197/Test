import 'package:car_app_manikanta_bizt_1039/routes/routes_constants.dart';
import 'package:car_app_manikanta_bizt_1039/services/api_services.dart';
import 'package:car_app_manikanta_bizt_1039/services/navigation_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/images_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userId;
  String? name;
  String? email;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  void loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('userId');
      name = prefs.getString('name');
      email = prefs.getString('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(ImagesConstants.profile),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 20),
            Text('Name : ${name ?? "Not Available"}',style: TextStyle(fontSize: 20),),
            SizedBox(height: 5),
            Text('Email : ${email ?? "Not Available"}',style: TextStyle(fontSize: 20)),
            IconButton(
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear(); 
                NavigationServices().replaceAll(
                    RoutesConstants.loginScreen);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
  
}