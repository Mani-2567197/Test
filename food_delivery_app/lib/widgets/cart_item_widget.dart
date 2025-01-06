import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String name;
  final int quantity;
  final int price;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemWidget({
    Key? key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.redAccent),
                onPressed: onDecrease,
              ),
              Text('$quantity', style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.greenAccent),
                onPressed: onIncrease,
              ),
            ],
          ),
          Text('₦$price', style: const TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
