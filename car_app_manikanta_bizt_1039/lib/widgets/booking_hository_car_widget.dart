import 'package:car_app_manikanta_bizt_1039/features/bookings/model/booking_history_model.dart';
import 'package:flutter/material.dart';

class BookingHositoryCarWidget extends StatelessWidget {
  const BookingHositoryCarWidget({super.key, required this.bookingsData});
  final Bookings bookingsData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(bookingsData.carId?.name ?? ""),
          Text(bookingsData.startDate ?? ""),
          Text(bookingsData.endDate ?? ""),
          Text("${bookingsData.carId?.pricePerDay ?? 0}"),
        ],
      ),
    );
  }
}
