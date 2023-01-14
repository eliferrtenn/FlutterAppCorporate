// ignore_for_file: prefer_collection_literals, file_names, unnecessary_question_mark, prefer_void_to_null


class ListHistoryResponse {
  List<Data>? data;
  bool? isSuccess;
  Null? message;

  ListHistoryResponse({this.data, this.isSuccess, this.message});

  ListHistoryResponse.fromJson(Map<String, dynamic> json) {
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
  String? startDate;
  String? endDate;
  String? photoUrl;

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

