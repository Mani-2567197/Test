import 'package:car_app_manikanta_bizt_1039/features/sign_up/repository/sign_up_repo.dart';
import 'package:car_app_manikanta_bizt_1039/services/api_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/server_constants.dart';

class SignUpRepoImpl extends SignUpRepo {
  final _apiServices = ApiServices();
  @override
  Future signUptheUser(payload) {
    return _apiServices.postCall(ServerConstants.signup, payload);
  }
}
