import 'package:car_app_manikanta_bizt_1039/features/cars/model/cars_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/cars/repository/car_repository.dart';
import 'package:car_app_manikanta_bizt_1039/utils/loader_utils.dart';
import 'package:flutter/material.dart';

class CarsViewModel extends ChangeNotifier {
  List<Cars> cars = [];
  CarRepository repo;
  CarsViewModel({required this.repo});
  Future<void> getCars() async {
    try {
      LoaderWidget.showLoader();
      final response = await repo.getallCars();
      LoaderWidget.hideLoader();
      if (response.statusCode == 200) {
        final carsModel = CarsModelData.fromJson(response.data);
        cars = carsModel.cars ?? [];
      }
    } catch (e) {
      LoaderWidget.hideLoader();
      cars = [];
    } finally {
      notifyListeners();
    }
  }
}