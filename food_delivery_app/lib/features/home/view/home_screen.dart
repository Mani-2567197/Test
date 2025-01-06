import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/cart.dart';
import 'package:food_delivery_app/features/loyality_poins/view/loyality_points.dart';
import 'package:food_delivery_app/utils/image_constants.dart';
import 'package:food_delivery_app/widgets/custom_app_bar.dart';
import 'package:food_delivery_app/widgets/food_card_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {
   List<Widget> screens = const [
    HomeScreen(),
    LoyalityPoints(),
    Cart(),
    
  ];
  int _selectedindex = 0;
  void ontap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFDFD),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodCardWidget(
              title: 'Main Dishes',
              imageUrl:ImageConstants.mainpage2,
              rating: 4.9,
              ratingnum: "355 ratings",
              price: '2500',
              tag: 'FREE DRINK',
            ),
            FoodCardWidget(
              title: 'Best Sellers',
              imageUrl: ImageConstants.empty,
              rating: 4.8,
               ratingnum: "105 ratings",
              price: '2000',
            ),
             FoodCardWidget(
              title: 'Discounted Offers',
              imageUrl: ImageConstants.empty,
              rating: 4.6,
               ratingnum: "500 ratings",
              price: '500',
            ),
             FoodCardWidget(
              title: 'Meal Plans',
              imageUrl: ImageConstants.empty,
              rating: 5.0,
               ratingnum: "203 ratings",
              price: '30000',
            ),
            IconButton(
          icon: Icon(Icons.arrow_upward_outlined,color: Colors.black,),
          onPressed: () {
            
          },
        ),],  
      ),
     ), 
    );
  }
  
  
}
