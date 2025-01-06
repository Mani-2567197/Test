import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/image_constants.dart';
import 'package:food_delivery_app/widgets/logo_widget.dart';

class LoyalityPoints extends StatefulWidget {
  const LoyalityPoints({Key? key}) : super(key: key);

  @override
  State<LoyalityPoints> createState() => _LoyaltyPointsScreenState();
}

class _LoyaltyPointsScreenState extends State<LoyalityPoints> {
  int points = 509; // Example points

  void convertPoints() {
    if (points >= 1000) {
      setState(() {
        points -= 1000; // Deduct points after conversion
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Points converted successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Not enough points to convert.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Loyalty Points",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1.0,
                  indent: 30,
                  endIndent: 30,
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Row(
                      children: [
                           LogoWidget(width:168 , height:168, left: 15, image:ImageConstants.loyality),
                           const SizedBox(width: 16),
                            Text(
                      "Sanita Queen",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      ),
                    ),
                  ],
                    )
                  ],
                ),
                const SizedBox(height: 24),

                // Points Display
                Text(
                  "$points Points",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Subtitle
                const Text(
                  "Convert Points to Purchase Voucher Code.\n\n"
                  "You need up to 1000 points to get 1000 OFF your order.\n"
                  "Order today to get more points.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: convertPoints,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "Convert",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    
    );
  }
}
