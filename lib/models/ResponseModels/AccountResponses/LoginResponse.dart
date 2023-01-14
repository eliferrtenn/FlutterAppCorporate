// ignore_for_file: file_names, prefer_collection_literals
class LoginResponse {
  Data? data;
  bool? isSuccess;
  String? message;

  LoginResponse({this.data, this.isSuccess, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['isSuccess'] = isSuccess;
    data['message'] = message;
    return data;
  }
}

class Data {
  bool? isNewUser;
  String? token;

  Data({this.isNewUser, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    isNewUser = json['isNewUser'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isNewUser'] = isNewUser;
    data['token'] = token;
    return data;
  }
}

