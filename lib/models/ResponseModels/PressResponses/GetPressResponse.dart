// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null


class GetPressResponse {
  Data? data;
  bool? isSuccess;
  Null? message;

  GetPressResponse({this.data, this.isSuccess, this.message});

  GetPressResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? photoUrl;
  String? createdDate;
  bool? isEnabled;

  Data({this.id, this.photoUrl, this.createdDate, this.isEnabled});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photoUrl = json['photoUrl'];
    createdDate = json['createdDate'];
    isEnabled = json['isEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['photoUrl'] = photoUrl;
    data['createdDate'] = createdDate;
    data['isEnabled'] = isEnabled;
    return data;
  }
}

