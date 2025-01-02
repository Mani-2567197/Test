import 'package:car_app_manikanta_bizt_1039/features/cars/model/cars_model.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/button_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/cache_network_image_widget.dart';
import 'package:flutter/material.dart';

class CarsCardWidget extends StatelessWidget {
  const CarsCardWidget(
      {super.key, required this.carData});
  final Cars carData;
 

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carData.name ?? "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      carData.transmission ?? "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      carData.fuelType ?? "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      " ${carData.pricePerDay} / day",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network( carData.image ?? ""),
          ),
          ButtonWidget(buttonTitle: "Book Now", onPressed: (){})

          
        ],
      ),
    );
  }
}
