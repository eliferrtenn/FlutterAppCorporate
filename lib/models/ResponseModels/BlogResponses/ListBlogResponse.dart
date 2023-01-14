// ignore_for_file: unnecessary_question_mark, prefer_void_to_null, file_names, prefer_collection_literals

class ListBlogResponse {
  List<Data>?  data;
  bool? isSuccess;
  Null? message;

  ListBlogResponse({this.data, this.isSuccess, this.message});

  ListBlogResponse.fromJson(Map<String, dynamic> json) {
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