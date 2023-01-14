// ignore_for_file: prefer_collection_literals, file_names, unnecessary_this
class UpdateMemberRequestResult {
  bool? isSuccess;
  String? message;

  UpdateMemberRequestResult({this.isSuccess, this.message});

  UpdateMemberRequestResult.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson(UpdateMemberRequestResult request) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}