
// ignore_for_file: prefer_collection_literals, file_names

class LoginSmsVerificationRequest {
 String? mobilePhone;
 String? smsCode;

   LoginSmsVerificationRequest(
      {this.mobilePhone,this.smsCode}
   );

  LoginSmsVerificationRequest.fromJson(Map<String, dynamic> json) {
    mobilePhone = json['mobilePhone'];
    smsCode = json['smsCode'];
  }

  Map<String, dynamic> toJson(LoginSmsVerificationRequest instance) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobilePhone'] = instance.mobilePhone;
    data['smsCode'] = instance.smsCode;
    return data;
  }
}