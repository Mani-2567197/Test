import 'package:car_app_manikanta_bizt_1039/features/bookings/viewmodel/booking_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/utils/loader_utils.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/booking_hository_car_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookinScreenState createState() => _BookinScreenState();
}

class _BookinScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    final bookingmodel = Provider.of<BookingViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookings "),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: bookingmodel.bookingslist.length,
        itemBuilder: (context, index) {
          return BookingHositoryCarWidget(
              bookingsData: bookingmodel.bookingslist[index]);
        },
      )),
    );
  }

  @override
  void initState() {
    getBookingHistory();
    super.initState();
  }

  getBookingHistory() {
    final bookingViewModel =
        Provider.of<BookingViewModel>(context, listen: false);
    LoaderWidget.showLoader();
    bookingViewModel.getBookingHistory();
    LoaderWidget.hideLoader();
  }
}
