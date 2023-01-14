// ignore_for_file: file_names, prefer_collection_literals

class CreateTechnicalServiceDemandRequestResult {
  bool? isSuccess;
  String? message;

  CreateTechnicalServiceDemandRequestResult({this.isSuccess, this.message});

  CreateTechnicalServiceDemandRequestResult.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson(CreateTechnicalServiceDemandRequestResult request) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = isSuccess;
    data['message'] = message;
    return data;
  }
}