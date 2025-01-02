import 'package:car_app_manikanta_bizt_1039/features/login/model/login_req_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/login/model/login_respo_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/login/repository/login_repo.dart';
import 'package:car_app_manikanta_bizt_1039/utils/local_storage_constaints.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  LoginRepo repo;
  LoginViewModel({required this.repo});

  Future<LoginRespoModel> loginintoApp(LoginReqModel logreq) async {
    try {
      final response = await repo.signIn(logreq.toJson());
      LoginRespoModel logrespo = LoginRespoModel.fromJson(response.data);
      saveLoginCredentials(logrespo);
      return logrespo;
    } catch (e) {
      return LoginRespoModel(error: true);
    }
  }

  saveLoginCredentials(LoginRespoModel logresponse) async {
    if (logresponse.error == false) {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString(
          LocalStorageConstants.userId, logresponse.student?.id ?? "");
      await sp.setString(
          LocalStorageConstants.name, logresponse.student?.name ?? "");
      await sp.setString(
          LocalStorageConstants.emmail, logresponse.student?.email ?? "");
    }
  }
}
