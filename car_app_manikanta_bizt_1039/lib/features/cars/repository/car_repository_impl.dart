import 'package:car_app_manikanta_bizt_1039/features/cars/repository/car_repository.dart';
import 'package:car_app_manikanta_bizt_1039/services/api_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/server_constants.dart';

class CarRepositoryImpl extends CarRepository {
  final ApiServices _apiServices = ApiServices();
  @override
  Future addCars(data) {
    throw UnimplementedError();
  }

  @override
  Future getallCars() {
    return _apiServices.getCall(ServerConstants.getAllCars);
  }
}
