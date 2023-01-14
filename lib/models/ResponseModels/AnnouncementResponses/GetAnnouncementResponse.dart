// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null
class GetAnnouncementResponse {
  Data? data;
  bool? isSuccess;
  String? message;

  GetAnnouncementResponse({this.data, this.isSuccess, this.message});

  GetAnnouncementResponse.fromJson(Map<String, dynamic> json) {
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
  String? thumbUrl;
  List<AnnouncementPhotos>? announcementPhotos;

  Data({this.id, this.title, this.description, this.thumbUrl,this.announcementPhotos});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    thumbUrl = json['thumbUrl'];
    if (json['announcementPhotos'] != null) {
      announcementPhotos = <AnnouncementPhotos>[];
      json['announcementPhotos'].forEach((v) {
        announcementPhotos!.add(AnnouncementPhotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['thumbUrl'] = thumbUrl;
    if (announcementPhotos != null) {
      data['announcementPhotos'] =
          announcementPhotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnnouncementPhotos {
  int? id;
  String? photoUrl;

  AnnouncementPhotos({this.id, this.photoUrl});

  AnnouncementPhotos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['photoUrl'] = photoUrl;
    return data;
  }
}

