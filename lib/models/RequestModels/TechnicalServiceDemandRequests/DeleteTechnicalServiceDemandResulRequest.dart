// ignore_for_file: file_names, prefer_collection_literals

class DeleteTechnicalServiceDemandRequestResult {
  bool? isSuccess;
  String? message;

  DeleteTechnicalServiceDemandRequestResult({this.isSuccess, this.message});

  DeleteTechnicalServiceDemandRequestResult.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson(DeleteTechnicalServiceDemandRequestResult request) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = isSuccess;
    data['message'] = message;
    return data;
  }
}