// ignore_for_file: prefer_collection_literals, file_names

class DeleteTechnicalServiceDemandRequest {
  int? id;


  DeleteTechnicalServiceDemandRequest(
      {
      this.id,
});

  DeleteTechnicalServiceDemandRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson(DeleteTechnicalServiceDemandRequest request) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    return data;
  }
}
