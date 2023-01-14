// ignore_for_file: unnecessary_this, prefer_collection_literals, file_names

class UpdateMemberRequest {
  String? firstName;
  String? lastName;
  String? email;

  UpdateMemberRequest({this.firstName, this.lastName, this.email});

  UpdateMemberRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson(UpdateMemberRequest request) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}
