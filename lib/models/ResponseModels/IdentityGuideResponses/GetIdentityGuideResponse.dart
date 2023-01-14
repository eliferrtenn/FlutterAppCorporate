// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null

class GetIdentityGuideResponse {
  List<Data>? data;
  bool? isSuccess;
  String? message;

  GetIdentityGuideResponse({this.data, this.isSuccess, this.message});

  GetIdentityGuideResponse.fromJson(Map<String, dynamic> json) {
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
  String? photoUrl;
  String? fileUrl;

  Data({this.id, this.title, this.photoUrl, this.fileUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    photoUrl = json['photoUrl'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['photoUrl'] = photoUrl;
    data['fileUrl'] = fileUrl;
    return data;
  }
}