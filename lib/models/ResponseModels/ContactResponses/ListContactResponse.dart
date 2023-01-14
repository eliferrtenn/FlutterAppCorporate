// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null


class ListContactResponse {
  List<Data>? data;
  bool? isSuccess;
  Null? message;

  ListContactResponse({this.data, this.isSuccess, this.message});

  ListContactResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isSuccess'] = isSuccess;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? location;
  String? mobilePhone;
  String? landPhone;
  String? email;
  String? longitude;
  String? latitude;
  Null? instagramUrl;
  Null? facebookUrl;

  Data(
      {this.id,
      this.title,
      this.location,
      this.mobilePhone,
      this.landPhone,
      this.email,
      this.longitude,
      this.latitude,
      this.instagramUrl,
      this.facebookUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    location = json['location'];
    mobilePhone = json['mobilePhone'];
    landPhone = json['landPhone'];
    email = json['email'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    instagramUrl = json['instagramUrl'];
    facebookUrl = json['facebookUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['location'] = location;
    data['mobilePhone'] = mobilePhone;
    data['landPhone'] = landPhone;
    data['email'] = email;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['instagramUrl'] = instagramUrl;
    data['facebookUrl'] = facebookUrl;
    return data;
  }
}

