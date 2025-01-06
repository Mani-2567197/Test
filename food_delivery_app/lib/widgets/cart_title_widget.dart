import 'package:flutter/material.dart';

class CartTitleWidget extends StatelessWidget {
  const CartTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Text(
                "Your Shopping Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 48), // Placeholder for alignment
            ],
          ),
        ),
        Divider(color: Colors.grey.shade300, thickness: 1),
      ],
    );
  }
}
