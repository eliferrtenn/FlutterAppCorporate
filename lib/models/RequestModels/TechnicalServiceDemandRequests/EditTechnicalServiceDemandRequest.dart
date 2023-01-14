// ignore_for_file: file_names, prefer_collection_literals

class EditTechnicalServiceDemandRequest {
  int? id;
  String? demandType;
  String? title;
  String? description;
  String? demandUrgencyStatus;
  String? siteName;
  String? apartmentName;
  String? apartmentFloor;
  String? apartmentNo;
  String? contactInform;

  EditTechnicalServiceDemandRequest(
      {
      this.id,
      this.demandType,
      this.title,
      this.description,
      this.demandUrgencyStatus,
      this.siteName,
      this.apartmentName,
      this.apartmentFloor,
      this.apartmentNo,
      this.contactInform,
});

  EditTechnicalServiceDemandRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    demandType = json['demandType'];
    title = json['title'];
    description = json['description'];
    demandUrgencyStatus = json['demandUrgencyStatus'];
    siteName = json['siteName'];
    apartmentName = json['apartmentName'];
    apartmentFloor = json['apartmentFloor'];
    apartmentNo = json['apartmentNo'];
    contactInform = json['contactInform'];
  }

  Map<String, dynamic> toJson(EditTechnicalServiceDemandRequest request) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['demandType'] = demandType;
    data['title'] = title;
    data['description'] = description;
    data['demandUrgencyStatus'] = demandUrgencyStatus;
    data['siteName'] = siteName;
    data['apartmentName'] = apartmentName;
    data['apartmentFloor'] = apartmentFloor;
    data['apartmentNo'] = apartmentNo;
    data['contactInform'] = contactInform;
    return data;
  }
}
