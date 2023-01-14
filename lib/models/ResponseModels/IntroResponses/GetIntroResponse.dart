// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null

class GetIntroResponse {
  Data? data;
  bool? isSuccess;
  Null? message;

  GetIntroResponse({this.data, this.isSuccess, this.message});

  GetIntroResponse.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? description;
  String? photoUrl;
  double? squareMeter;
  int? yearCount;
  double? commercialAreaCount;


  Data({this.id, this.title, this.description, this.photoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    photoUrl = json['photoUrl'];
    squareMeter = json['squareMeter'];
    yearCount = json['yearCount'];
    commercialAreaCount = json['commercialAreaCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['photoUrl'] = photoUrl;
    data['squareMeter'] = squareMeter;
    data['yearCount'] = yearCount;
    data['commercialAreaCount'] = commercialAreaCount;
    return data;
  }
}

