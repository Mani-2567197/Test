import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/button_widget.dart';
import 'package:food_delivery_app/widgets/cart_item_widget.dart';
import 'package:food_delivery_app/widgets/cart_summary_widget.dart';
import 'package:food_delivery_app/widgets/cart_title_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartScreenState();
}

class _CartScreenState extends State<Cart> {
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'Spaghetti Rigatoni', 'quantity': 1, 'price': 2000},
    {'name': 'Peppered Stew', 'quantity': 5, 'price': 5700},
  ];

  int purchaseTotal =0;

  int get vat => (purchaseTotal * 0.05).toInt();

  int get subTotal => purchaseTotal + vat;

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CartTitleWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItemWidget(
                    name: item['name'],
                    quantity: item['quantity'],
                    price: item['price'],
                    onIncrease: () => increaseQuantity(index),
                    onDecrease: () => decreaseQuantity(index),
                    onRemove: () => removeItem(index),
                  );
                },
              ),
            ),
            CartSummaryWidget(
              purchaseTotal: purchaseTotal,
              vat: vat,
              subTotal: subTotal,
            ),
            ButtonWidget(onPressed: (){

            },buttonTitle: "Checkout",
            buttonBgColor: Colors.deepOrangeAccent,
            buttonTextColor:Colors.white,
            buttonradius: 30,
            buttonWidth: 113,
            buttonheight: 52,)
          ],
        ),
      ),
    );
  }
}
