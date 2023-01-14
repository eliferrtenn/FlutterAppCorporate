// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null

class GetBlogResponse {
  Data? data;
  bool? isSuccess;
  Null? message;

  GetBlogResponse({this.data, this.isSuccess, this.message});

  GetBlogResponse.fromJson(Map<String, dynamic> json) {
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
  String? blogDate;
  String? instagramUrl;
  String? photoUrl;

  Data({this.id, this.title, this.blogDate, this.instagramUrl, this.photoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    blogDate = json['blogDate'];
    instagramUrl = json['instagramUrl'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['blogDate'] = blogDate;
    data['instagramUrl'] = instagramUrl;
    data['photoUrl'] = photoUrl;
    return data;
  }
}