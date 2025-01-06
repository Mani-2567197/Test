import 'package:flutter/material.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Menu
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            color: Color(0xFFFF5722),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // User Info
                  Text(
                    "Sanita Queen",
                    style:TextStyle(
                       fontSize: 16,
                       color: Color(0xFFFFFFFF),),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                       Icon(Icons.person_outlined,color:Colors.white),
                       const SizedBox(width: 20),
                       Text("Profile",
                       style: TextStyle(
                        color: Colors.white,
                       ),),
                    ],
                  ),
                   const SizedBox(height: 30),
                   Row(
                    children: [
                       Icon(Icons.favorite_border,color:Colors.white,),
                       const SizedBox(width: 20),
                       Text("Wishlist",
                       style: TextStyle(
                        color: Colors.white,
                       ),)
                    ],
                  ),
                   const SizedBox(height: 30),
                   Row(
                    children: [
                       Icon(Icons.loyalty,color:Colors.white),
                       const SizedBox(width: 20),
                       Text("Loyality points",
                       style: TextStyle(
                        color: Colors.white,
                       ),)
                    ],
                  ),
                   const SizedBox(height: 30),
                   Row(
                    children: [
                        Icon(Icons.payment,color:Colors.white),
                       const SizedBox(width: 20),
                       Text("Payments",
                       style: TextStyle(
                        color: Colors.white,
                       ),)
                    ],
                  ),
                   const SizedBox(height: 30),
            
                ],
              ),
            ),
          ),

          // Close Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.black.withValues(), 
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Color(0xFFFF5722)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
