// ignore_for_file: file_names, prefer_collection_literals

class EditTechnicalServiceDemandRequestResult {
  bool? isSuccess;
  String? message;

  EditTechnicalServiceDemandRequestResult({this.isSuccess, this.message});

  EditTechnicalServiceDemandRequestResult.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson(EditTechnicalServiceDemandRequestResult request) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = isSuccess;
    data['message'] = message;
    return data;
  }
}