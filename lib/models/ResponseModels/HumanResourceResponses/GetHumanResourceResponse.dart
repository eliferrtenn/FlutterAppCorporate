// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null

class GetHumanResourceResponse {
  Data? data;
  bool? isSuccess;
  Null? message;

  GetHumanResourceResponse({this.data, this.isSuccess, this.message});

  GetHumanResourceResponse.fromJson(Map<String, dynamic> json) {
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

  Data({this.id, this.title, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

