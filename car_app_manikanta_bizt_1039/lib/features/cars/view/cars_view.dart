import 'package:car_app_manikanta_bizt_1039/features/cars/viewmodel/cars_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/routes/routes_constants.dart';
import 'package:car_app_manikanta_bizt_1039/services/navigation_services.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/cars_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarsView extends StatefulWidget {
  const CarsView({Key? key}) : super(key: key);

  @override
  _CarsViewState createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<CarsViewModel>(context);
    return Scaffold(
     backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Cars List"),
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child:const Icon(Icons.add),
            onPressed: () async {
              final returnData =await NavigationServices().navigateTo(RoutesConstants.addCar);
            }),
       body: ListView.builder(
          itemBuilder: (context, index) {
            final carData = cars.cars[index];
            return CarsCardWidget(
              carData: carData,
              
            );
          },
          itemCount: cars.cars.length,
        ) 

    );
  }

  @override
  void initState() {
    fetchCars();
    super.initState();
  }

  fetchCars() async {
    final carsViewModel = Provider.of<CarsViewModel>(context, listen: false);
    carsViewModel.getCars();
  }
}
