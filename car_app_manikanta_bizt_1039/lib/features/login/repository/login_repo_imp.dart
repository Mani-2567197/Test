import 'package:car_app_manikanta_bizt_1039/features/login/repository/login_repo.dart';
import 'package:car_app_manikanta_bizt_1039/services/api_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/server_constants.dart';

class LoginRepoImp extends LoginRepo {
  final _apiServices = ApiServices();
  @override
  Future signIn(payload) {
    return _apiServices.postCall(ServerConstants.signIn, payload);
  }
}
