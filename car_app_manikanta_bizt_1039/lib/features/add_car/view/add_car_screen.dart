import 'dart:io';

import 'package:car_app_manikanta_bizt_1039/features/add_car/model/add_cars_req.dart';
import 'package:car_app_manikanta_bizt_1039/features/add_car/viewmodel/add_car_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/services/navigation_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/loader_utils.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/button_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/dropdown_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/input_text_field_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/text_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({ Key? key }) : super(key: key);

  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
   final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _brandTextController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _descriptionTextController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AddCarViewModel addcarvm=  Provider.of<AddCarViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Add Car"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextWidget(fieldname: "Car Name"),
              InputTextFieldWidget(
                  hintText: "Enter Name of the Car",
                  textEditingController: _nameTextController),
              const SizedBox(
                height: 10,
              ),
              TextWidget(fieldname: "Car Brand"),
              InputTextFieldWidget(
                  hintText: "Enter Brand of the Car",
                  textEditingController: _brandTextController),
              const SizedBox(
                height: 10,
              ),
              DropdownWidget<int>(
                items: addcarvm.yearsList,
                defaultValue:
                    addcarvm.selectedYear ?? addcarvm.yearsList.first,
                selectedValue: (year) {
                  addcarvm.setSelectedYear(year);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownWidget<String>(
                items: addcarvm.transmissionList,
                defaultValue: addcarvm.selectedTransmission ??
                    addcarvm.transmissionList.first,
                selectedValue: (transmission) {
                  addcarvm.setSelectedTransmission(transmission);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownWidget<String>(
                items: addcarvm.fuelTypeList,
                defaultValue:
                    addcarvm.selectedFuelType ?? addcarvm.fuelTypeList.first,
                selectedValue: (fuelType) {
                  addcarvm.setSelectedFuelType(fuelType);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              InputTextFieldWidget(
                  hintText: "Enter Price of the Car",
                  textEditingController: _priceTextController),
              const SizedBox(
                height: 10,
              ),
              InputTextFieldWidget(
                  hintText: "Enter Description of the Car",
                  textEditingController: _descriptionTextController),
              const SizedBox(
                height: 10,
              ),
              InputTextFieldWidget(
                  maxLines: 5,
                  hintText: "Enter Addres of the car",
                  textEditingController: _addressController),
              const SizedBox(
                height: 10,
              ),
              imageSelectionWidget(addcarvm),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                  buttonWidth: 300,
                  buttonTitle: "Add Car",
                  onPressed: () {
                    addCarToServer(addcarvm);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget imageSelectionWidget(AddCarViewModel addcarvm) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          child: ButtonWidget(
              buttonTitle: "Take Picture",
              onPressed: () {
                //Show the Bottom sheet with two options 1. Camera 2. Gallery
                showBottomSheet(addcarvm);
              }),
        ),
        const SizedBox(
          height: 10,
        ),
        addcarvm.selectedImage == null
            ? const SizedBox()
            : Image.file(File(addcarvm.selectedImage?.path ?? ""))
       
      ],
      
    );
  }
    void showBottomSheet(AddCarViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  // Open the camera
                  takePicture(ImageSource.camera, viewModel);
                },
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
              ),
              ListTile(
                onTap: () {
                  // Open the gallery
                  takePicture(ImageSource.gallery, viewModel);
                },
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }
  takePicture(ImageSource soure, AddCarViewModel viewModel) async {
    Navigator.pop(context);
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: soure, imageQuality: 20);
    viewModel.setSelectedImage(file);
  }

  void addCarToServer(AddCarViewModel model) async {
    final AddCarsReq addCarRequestModel = AddCarsReq(
        name: _nameTextController.text,
        brand: _brandTextController.text,
        year: "${model.selectedYear ?? 0}",
        fuelType: model.selectedFuelType ?? "",
        transmission: model.selectedTransmission ?? "",
        address: _addressController.text,
        pricePerDay: _priceTextController.text,
        description: _descriptionTextController.text,
        imagePath:
            await MultipartFile.fromFile(model.selectedImage?.path ?? ""));
    LoaderWidget.showLoader();
    final response = await model.addCar(addCarRequestModel);
    LoaderWidget.hideLoader();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.message ?? "")));
    NavigationServices().goBack(); 
  }
}