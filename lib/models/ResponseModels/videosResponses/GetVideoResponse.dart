// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null

class GetVideoResponse {
  Data? data;
  bool? isSuccess;
  Null? message;

  GetVideoResponse({this.data, this.isSuccess, this.message});

  GetVideoResponse.fromJson(Map<String, dynamic> json) {
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
  Null? description;
  String? videoUrl;
  String? createdDate;
  bool? isEnabled;

  Data(
      {this.id,
      this.title,
      this.description,
      this.videoUrl,
      this.createdDate,
      this.isEnabled});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    videoUrl = json['videoUrl'];
    createdDate = json['createdDate'];
    isEnabled = json['isEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['videoUrl'] = videoUrl;
    data['createdDate'] = createdDate;
    data['isEnabled'] = isEnabled;
    return data;
  }
}

