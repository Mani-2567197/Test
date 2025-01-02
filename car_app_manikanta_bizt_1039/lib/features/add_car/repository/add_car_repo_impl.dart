
import 'package:car_app_manikanta_bizt_1039/features/add_car/repository/add_car_repo.dart';
import 'package:car_app_manikanta_bizt_1039/services/api_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/local_storage_constaints.dart';
import 'package:car_app_manikanta_bizt_1039/utils/server_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCarRepoImpl extends AddCarRepo
{
  final ApiServices _apiServices = ApiServices();
  
  @override
  Future addCarDetails(data) async {
   final SharedPreferences sp = await SharedPreferences.getInstance();
    final userID = sp.getString(LocalStorageConstants.userId) ?? "";
    final response = await _apiServices.postCallWithFormData(
        ServerConstants.addCar + userID, data);
    return response;
  }
  
}