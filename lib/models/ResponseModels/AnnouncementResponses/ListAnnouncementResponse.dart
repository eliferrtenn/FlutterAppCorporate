// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null

class ListAnnouncementResponse {
  List<Data>? data;
  bool? isSuccess;
  Null? message;

  ListAnnouncementResponse({this.data, this.isSuccess, this.message});

  ListAnnouncementResponse.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? thumbUrl;

  Data({this.id, this.title, this.description, this.thumbUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    thumbUrl = json['thumbUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['thumbUrl'] = thumbUrl;
    return data;
  }
}

