// ignore_for_file: file_names, unnecessary_question_mark, prefer_collection_literals, prefer_void_to_null

class LoginSmsmVerificationResponse {
  Data? data;
  bool? isSuccess;
  String? message;

  LoginSmsmVerificationResponse({this.data, this.isSuccess, this.message});

  LoginSmsmVerificationResponse.fromJson(Map<String, dynamic> json) {
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
  String? accessToken;
  String? expiration;
  String? refreshToken;

  Data({this.accessToken, this.expiration, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiration = json['expiration'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['accessToken'] = accessToken;
    data['expiration'] = expiration;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
