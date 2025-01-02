class SignUpResponseModel {
  String? message;
  bool? error;

  SignUpResponseModel({this.message, this.error});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['message'] = message;
    data['error'] = error;
    return data;
  }
}
