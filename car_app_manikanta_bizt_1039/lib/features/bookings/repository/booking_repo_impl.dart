import 'package:car_app_manikanta_bizt_1039/features/bookings/repository/booking_repo.dart';
import 'package:car_app_manikanta_bizt_1039/services/api_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/local_storage_constaints.dart';
import 'package:car_app_manikanta_bizt_1039/utils/server_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingRepoImpl extends BookingRepo {
 final ApiServices _apiServices = ApiServices();
  @override
  Future<dynamic> carbooking(dynamic data) async {
    return await _apiServices.postCall(ServerConstants.bookACar, data);
  }
  
  @override
  Future<dynamic> bookingHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString(LocalStorageConstants.userId) ?? "";
    return await _apiServices.getCall(ServerConstants.getBookedCars + userID);
  }
}