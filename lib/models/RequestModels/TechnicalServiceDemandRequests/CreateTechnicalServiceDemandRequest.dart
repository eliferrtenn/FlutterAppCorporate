// ignore_for_file: file_names, prefer_collection_literals
import 'package:intl/intl.dart';
 final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
class CreateTechnicalServiceDemandRequest {
  String? demandType;
  String? title;
  String? description;
  String? demandUrgencyStatus;
  String? siteName;
  String? apartmentName;
  String? apartmentFloor;
  String? apartmentNo;
  String? contactInform;
  String? createDayDemand=formatted;
  bool? isEnabled=true;
  bool? isDeleted=false;

  CreateTechnicalServiceDemandRequest(
      {
      this.demandType,
      this.title,
      this.description,
      this.demandUrgencyStatus,
      this.siteName,
      this.apartmentName,
      this.apartmentFloor,
      this.apartmentNo,
      this.contactInform,
      this.createDayDemand,
      this.isEnabled,
      this.isDeleted});

  CreateTechnicalServiceDemandRequest.fromJson(Map<String, dynamic> json) {
    demandType = json['demandType'];
    title = json['title'];
    description = json['description'];
    demandUrgencyStatus = json['demandUrgencyStatus'];
    siteName = json['siteName'];
    apartmentName = json['apartmentName'];
    apartmentFloor = json['apartmentFloor'];
    apartmentNo = json['apartmentNo'];
    contactInform = json['contactInform'];
    createDayDemand = json['createDayDemand'];
    isEnabled = json['isEnabled'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson(CreateTechnicalServiceDemandRequest request) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['demandType'] = demandType;
    data['title'] = title;
    data['description'] = description;
    data['demandUrgencyStatus'] = demandUrgencyStatus;
    data['siteName'] = siteName;
    data['apartmentName'] = apartmentName;
    data['apartmentFloor'] = apartmentFloor;
    data['apartmentNo'] = apartmentNo;
    data['contactInform'] = contactInform;
    data['createDayDemand'] = createDayDemand;
    data['isEnabled'] = isEnabled;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
