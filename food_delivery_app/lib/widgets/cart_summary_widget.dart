import 'package:flutter/material.dart';

class CartSummaryWidget extends StatelessWidget {
  final int purchaseTotal;
  final int vat;
  final int subTotal;

  const CartSummaryWidget({
    Key? key,
    required this.purchaseTotal,
    required this.vat,
    required this.subTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Purchase Total: ₦$purchaseTotal"),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Voucher Code?"),
              SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text("Vat 5%: ₦$vat"),
          const SizedBox(height: 8),
          Text("Sub Total: ₦$subTotal", style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
