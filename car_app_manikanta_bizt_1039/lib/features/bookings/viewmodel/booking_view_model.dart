import 'package:car_app_manikanta_bizt_1039/features/bookings/model/booking_history_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/bookings/model/booking_request_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/bookings/model/booking_response_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/bookings/repository/booking_repo.dart';
import 'package:flutter/material.dart';

class BookingViewModel extends ChangeNotifier {
  final BookingRepo repo;
  List<Bookings> bookingslist = [];
  BookingViewModel({required this.repo});
  Future<BookingResponseModel> createCarBooking(BookingRequestModel brm) async {
    try {
      final response = await repo.carbooking(brm.toJson());
      final bookingResponseModel = BookingResponseModel.fromJson(response.data);
      return bookingResponseModel;
    } catch (e) {
      return BookingResponseModel(message: e.toString());
    }
  }
   Future<void> getBookingHistory() async {
    try {
      final response = await repo.bookingHistory();
      final bookingHistoryResponseModel =
          BookingHistoryResponseModel.fromJson(response.data);
      bookingslist = bookingHistoryResponseModel.bookings ?? [];
      notifyListeners();
    } catch (e) {
      bookingslist = [];
      notifyListeners();
    }
  }
}
