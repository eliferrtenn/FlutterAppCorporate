// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null


class GetHistoryResponse {
  Data? data;
  bool? isSuccess;
  Null? message;

  GetHistoryResponse({this.data, this.isSuccess, this.message});

  GetHistoryResponse.fromJson(Map<String, dynamic> json) {
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
  String? startDate;
  String? endDate;
  Null? photoUrl;

  Data({this.id, this.title, this.startDate, this.endDate, this.photoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['photoUrl'] = photoUrl;
    return data;
  }
}

