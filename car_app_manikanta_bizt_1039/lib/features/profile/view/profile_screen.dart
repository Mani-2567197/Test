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
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name : ${name ?? "Not Available"}',style: TextStyle(fontSize: 20),),
            SizedBox(height: 5),
            Text('Email : ${email ?? "Not Available"}',style: TextStyle(fontSize: 20)),
            
          ],
        ),
      ),
    );
  }
  
}