import 'package:car_app_manikanta_bizt_1039/features/add_car/model/add_cars_req.dart';
import 'package:car_app_manikanta_bizt_1039/features/add_car/model/add_cars_response.dart';
import 'package:car_app_manikanta_bizt_1039/features/add_car/repository/add_car_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCarViewModel extends ChangeNotifier {

  AddCarRepo rep;
  final List<int> yearsList = List.generate(
    DateTime.now().year - 1901 + 1,
    (index) => 1901 + index,
  );

  List<String> transmissionList = [
    'Manual Transmission',
    'Automatic Transmission',
    'Continuously Variable Transmission (CVT)',
    'Dual-Clutch Transmission (DCT)',
    'Semi-Automatic Transmission',
    'Tiptronic Transmission',
    'Direct Shift Gearbox (DSG)',
    'Electric Vehicle Transmission (EVT)',
  ];
  List<String> fuelTypeList = [
    'Petrol',
    'Diesel',
    'Electric',
    'Hybrid (Petrol + Electric)',
    'Plug-in Hybrid (PHEV)',
    'CNG (Compressed Natural Gas)',
    'LPG (Liquefied Petroleum Gas)',
    'Hydrogen (Fuel Cell)',
    'Ethanol (Flex Fuel)',
    'Biodiesel',
  ];

  String? selectedTransmission;
  String? selectedFuelType;
  int? selectedYear;
  XFile? selectedImage;

  AddCarViewModel({required this.rep});

  void setSelectedTransmission(String? value) {
    selectedTransmission = value;
    notifyListeners();
  }

  void setSelectedFuelType(String? value) {
    selectedFuelType = value;
    notifyListeners();
  }

  void setSelectedYear(int? value) {
    selectedYear = value;
    notifyListeners();
  }

  void setSelectedImage(XFile? value) {
    selectedImage = value;
    notifyListeners();
  }

  Future<AddCarsResponse> addCar(AddCarsReq req) async {
    try {
      final response = await rep.addCarDetails(req.toJson());
      final responseModel = AddCarsResponse.fromJson(response.data);
      return responseModel;
    } catch (e) {
      return AddCarsResponse(message: e.toString());
    }
  }
}