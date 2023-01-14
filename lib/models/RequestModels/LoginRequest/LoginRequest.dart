// ignore_for_file: file_names, prefer_collection_literals

class LoginRequest{
 String? mobilePhone;

   LoginRequest(
      {this.mobilePhone}
   );

  LoginRequest.fromJson(Map<String, dynamic> json) {
    mobilePhone = json['mobilePhone'];
  }

  Map<String, dynamic> toJson(LoginRequest instance) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobilePhone'] = instance.mobilePhone;
    return data;
  }
}