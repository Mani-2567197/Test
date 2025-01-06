import 'package:flutter/material.dart';

class FoodDetailsWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double rating;
  final int reviewsCount;
  final List<Map<String, String>> ingredients;
  final List<String> additions;
  final double price;

  const FoodDetailsWidget({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.rating,
    required this.reviewsCount,
    required this.ingredients,
    required this.additions,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "$rating",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "($reviewsCount reviews)",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          // Description
          Text(
            "Description",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          // Ingredients
          Text(
            "Ingredients",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ingredients
                .map((ingredient) => Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            ingredient['image']!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ingredient['name']!,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ))
                .toList(),
          ),
          SizedBox(height: 16),
          // Additions
          Text(
            "Additions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            items: additions
                .map((addition) => DropdownMenuItem(
                      value: addition,
                      child: Text(addition),
                    ))
                .toList(),
            onChanged: (value) {},
            hint: Text("Select Additions"),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₦${price.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    "1",
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {},
              child: Icon(Icons.shopping_cart)
            ),
          ),
        ],
      ),
    );
  }
}
