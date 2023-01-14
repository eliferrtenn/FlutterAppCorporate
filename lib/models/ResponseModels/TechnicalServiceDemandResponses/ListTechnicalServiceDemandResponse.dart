// ignore_for_file: file_names, prefer_collection_literals

class ListTechnicalServiceDemandResponse {
  List<Data>? data;
  bool? isSuccess;
  String? message;

  ListTechnicalServiceDemandResponse({this.data, this.isSuccess, this.message});

  ListTechnicalServiceDemandResponse.fromJson(Map<String, dynamic> json) {
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
  int? memberID;
  String? demandType;
  String? title;
  String? description;
  String? demandUrgencyStatus;
  String? siteName;
  String? apartmentName;
  String? apartmentFloor;
  String? apartmentNo;
  String? contactInform;
  String? fullName;
  String? mobilePhone;
  String? createDayDemand;
  String? solutionDayDemand;

  Data(
      {this.id,
      this.memberID,
      this.demandType,
      this.title,
      this.description,
      this.demandUrgencyStatus,
      this.siteName,
      this.apartmentName,
      this.apartmentFloor,
      this.apartmentNo,
      this.contactInform,
      this.fullName,
      this.mobilePhone,
      this.createDayDemand,
      this.solutionDayDemand});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberID = json['memberID'];
    demandType = json['demandType'];
    title = json['title'];
    description = json['description'];
    demandUrgencyStatus = json['demandUrgencyStatus'];
    siteName = json['siteName'];
    apartmentName = json['apartmentName'];
    apartmentFloor = json['apartmentFloor'];
    apartmentNo = json['apartmentNo'];
    contactInform = json['contactInform'];
    fullName = json['fullName'];
    mobilePhone = json['mobilePhone'];
    createDayDemand = json['createDayDemand'];
    solutionDayDemand = json['solutionDayDemand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['memberID'] = memberID;
    data['demandType'] = demandType;
    data['title'] = title;
    data['description'] = description;
    data['demandUrgencyStatus'] = demandUrgencyStatus;
    data['siteName'] = siteName;
    data['apartmentName'] = apartmentName;
    data['apartmentFloor'] = apartmentFloor;
    data['apartmentNo'] = apartmentNo;
    data['contactInform'] = contactInform;
    data['fullName'] = fullName;
    data['mobilePhone'] = mobilePhone;
    data['createDayDemand'] = createDayDemand;
    data['solutionDayDemand'] = solutionDayDemand;
    return data;
  }
}
