// ignore_for_file: file_names, prefer_collection_literals

class GetMemberResponse {
  Data? data;
  bool? isSuccess;
  String? message;

  GetMemberResponse({this.data, this.isSuccess, this.message});

  GetMemberResponse.fromJson(Map<String, dynamic> json) {
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
  String? firstname;
  String? lastname;
  String? email;
  String? profilePhotoUrl;

  Data(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.profilePhotoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    profilePhotoUrl = json['profilePhotoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['profilePhotoUrl'] = profilePhotoUrl;
    return data;
  }
}
