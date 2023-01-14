// ignore_for_file: file_names, non_constant_identifier_names
import 'package:http/http.dart' as http;
import 'package:pro_tekno1/models/responseModels/announcementResponses/GetAnnouncementResponse.dart';
import 'package:pro_tekno1/models/responseModels/announcementResponses/ListAnnouncementResponse.dart';
import 'dart:async';
import 'dart:convert';

import '../../constants/generalToken.dart';

class AnnouncementService {
  static Future<ListAnnouncementResponse> GetAnnouncements() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http
        .get(Uri.parse('https://localhost:7238/Announcement/GetAll'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return ListAnnouncementResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetAnnouncementResponse> GetAnnouncement(int id) async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse(
            'https://localhost:7238/Announcement/GetAnnouncement?announcementID=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetAnnouncementResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}
