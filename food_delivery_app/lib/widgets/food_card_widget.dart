import 'package:flutter/material.dart';

class FoodCardWidget extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final double rating;
  final String price;
  final String tag;
  final String ?ratingnum;

  const FoodCardWidget({
    super.key, 
    required this.title,
     this.imageUrl,
    required this.rating,
    required this.price,
    this.tag = '',
    this.ratingnum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(imageUrl ?? "", height: 200, fit: BoxFit.cover),
                if (tag.isNotEmpty)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text('$rating ($ratingnum)'),
                      SizedBox(width: 16),
                      Text('Starts at N$price'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
