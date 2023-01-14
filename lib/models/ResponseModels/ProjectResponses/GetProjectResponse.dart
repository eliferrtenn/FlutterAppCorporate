// ignore_for_file: prefer_collection_literals, file_names

class GetProjectResponse {
  Data? data;
  bool? isSuccess;
  String? message;

  GetProjectResponse({this.data, this.isSuccess, this.message});

  GetProjectResponse.fromJson(Map<String, dynamic> json) {
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
  int? statusID;
  String? statusName;
  String? title;
  String? subTitle;
  String? description;
  String? fileUrl;
  String? projectDate;
  String? deliveryDate;
  int? apartmentCount;
  int? squareMeter;
  String? longitude;
  String? latitude;
  List<ProjectPhotos>? projectPhotos;

  Data(
      {this.id,
      this.statusID,
      this.statusName,
      this.title,
      this.subTitle,
      this.description,
      this.fileUrl,
      this.projectDate,
      this.deliveryDate,
      this.apartmentCount,
      this.squareMeter,
      this.longitude,
      this.latitude,
      this.projectPhotos});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusID = json['statusID'];
    statusName = json['statusName'];
    title = json['title'];
    subTitle = json['subTitle'];
    description = json['description'];
    fileUrl = json['fileUrl'];
    projectDate = json['projectDate'];
    deliveryDate = json['deliveryDate'];
    apartmentCount = json['apartmentCount'];
    squareMeter = json['squareMeter'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    if (json['projectPhotos'] != null) {
      projectPhotos = <ProjectPhotos>[];
      json['projectPhotos'].forEach((v) {
        projectPhotos!.add(ProjectPhotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['statusID'] = statusID;
    data['statusName'] = statusName;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['description'] = description;
    data['fileUrl'] = fileUrl;
    data['projectDate'] = projectDate;
    data['deliveryDate'] = deliveryDate;
    data['apartmentCount'] = apartmentCount;
    data['squareMeter'] = squareMeter;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    if (projectPhotos != null) {
      data['projectPhotos'] =
          projectPhotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectPhotos {
  int? id;
  String? photoUrl;

  ProjectPhotos({this.id, this.photoUrl});

  ProjectPhotos.fromJson(Map<String, dynamic> json) {
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

