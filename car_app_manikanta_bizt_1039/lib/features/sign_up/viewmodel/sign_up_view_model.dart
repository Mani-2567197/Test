import 'package:car_app_manikanta_bizt_1039/features/sign_up/model/sign_up_request_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/sign_up/repository/sign_up_repo.dart';
import 'package:flutter/material.dart';

import '../model/sign_up_resoonse_model.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpRepo repo;
  SignUpViewModel({required this.repo});

   Future<SignUpResponseModel> signUpTheUser(SignUpRequestModel model) async {
    try {
      final response = await repo.signUptheUser(model.toJson());
      SignUpResponseModel srm =
          SignUpResponseModel.fromJson(response.data);
      return srm;
    } catch (e) {
      return SignUpResponseModel(error: true,message: "Something went Wrong!!");
    }
  }
}
