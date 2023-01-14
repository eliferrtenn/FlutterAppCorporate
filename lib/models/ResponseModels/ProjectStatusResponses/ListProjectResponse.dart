// ignore_for_file: file_names, prefer_collection_literals

class ListProjectStatusResponse {
  List<Data>? data;
  bool? isSuccess;
  String? message;

  ListProjectStatusResponse({this.data, this.isSuccess, this.message});

  ListProjectStatusResponse.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? photoUrl;

  Data(
      {this.id,
      this.name,
      this.photoUrl,});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['photoUrl'] = photoUrl;
    return data;
  }
}