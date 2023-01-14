// ignore_for_file: file_names, prefer_collection_literals

class AnnouncementPhoto {
  int? id;
  String? newsID;
  String? photoUrl;
  String? createdDate;
  String? isEnabled;

  AnnouncementPhoto(
      {this.id, this.newsID, this.photoUrl, this.createdDate, this.isEnabled});

  AnnouncementPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newsID = json['newsID'];
    photoUrl = json['photoUrl'];
    createdDate = json['createdDate'];
    isEnabled = json['isEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['newsID'] = newsID;
    data['photoUrl'] = photoUrl;
    data['createdDate'] = createdDate;
    data['isEnabled'] = isEnabled;
    return data;
  }
}

