// ignore_for_file: prefer_collection_literals, file_names

class ListProjectResponse {
  List<Data>? data;
  bool? isSuccess;
  String? message;

  ListProjectResponse({this.data, this.isSuccess, this.message});

  ListProjectResponse.fromJson(Map<String, dynamic> json) {
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
  int? statusID;
  String? statusName;
  String? title;
  String? subTitle;
  String? description;
  String? thumbUrl;
  String? fileUrl;
  String? projectDate;
  String? deliveryDate;
  int? apartmentCount;
  int? squareMeter;
  String? longitude;
  String? latitude;

  Data(
      {this.id,
      this.statusID,
      this.statusName,
      this.title,
      this.subTitle,
      this.description,
      this.thumbUrl,
      this.fileUrl,
      this.projectDate,
      this.deliveryDate,
      this.apartmentCount,
      this.squareMeter,
      this.longitude,
      this.latitude});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusID = json['statusID'];
    statusName = json['statusName'];
    title = json['title'];
    subTitle = json['subTitle'];
    description = json['description'];
    thumbUrl = json['thumbUrl'];
    fileUrl = json['fileUrl'];
    projectDate = json['projectDate'];
    deliveryDate = json['deliveryDate'];
    apartmentCount = json['apartmentCount'];
    squareMeter = json['squareMeter'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['statusID'] = statusID;
    data['statusName'] = statusName;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['description'] = description;
    data['thumbUrl'] = thumbUrl;
    data['fileUrl'] = fileUrl;
    data['projectDate'] = projectDate;
    data['deliveryDate'] = deliveryDate;
    data['apartmentCount'] = apartmentCount;
    data['squareMeter'] = squareMeter;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}

