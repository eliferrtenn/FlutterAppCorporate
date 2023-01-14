// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null


class ListVideoResponse {
  List<Data>? data;
  bool? isSuccess;
  String? message;

  ListVideoResponse({this.data, this.isSuccess, this.message});

  ListVideoResponse.fromJson(Map<String, dynamic> json) {
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
  String? photoUrl;
  String? videoUrl;


  Data({this.id, this.title, this.description, this.photoUrl,this.videoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    photoUrl = json['photoUrl'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['photoUrl'] = photoUrl;
    data['videoUrl'] = videoUrl;
    return data;
  }
}

