import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/routes_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: double.infinity,
        backgroundColor: Color.fromARGB(255, 255, 120, 91),
       elevation: 0,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Column(
            children: [
              Row(
                children: [
                 IconButton(
          icon: Icon(Icons.menu,color: Colors.white,),
          onPressed: () {
           Navigator.pushNamed(context,RoutesConstants.menu);
          },
        ),
                 SizedBox(width: 400),
                  Icon(Icons.shopping_cart,color: Colors.white,),
                ],
              ),
              Column(
                  children: [
                    Text(
                          'Welcome',
                          style: TextStyle(color: Colors.white,
                        ),),
                   Text(
                     'Homemade meals prepared with love. Richest ingredients.',
                    style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                      )),
                        TextField(
                decoration: InputDecoration(
                  hintText: 'Search Menu',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
               ],
              )
            ],
          ),
        ],
        )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
