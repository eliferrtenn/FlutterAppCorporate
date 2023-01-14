// ignore_for_file: file_names, non_constant_identifier_names
import 'package:http/http.dart' as http;
import 'package:pro_tekno1/constants/generalToken.dart';
import 'dart:async';
import 'dart:convert';

import '../../models/ResponseModels/videosResponses/GetVideoResponse.dart';
import '../../models/ResponseModels/videosResponses/ListvideoResponse.dart';

class VideoService {
  static Future<ListVideoResponse> GettVideos() async {
        GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Videos/GetAll'),
              headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return ListVideoResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetVideoResponse> GetVideo(int id) async {
    var response = await http.get(
        Uri.parse('https://localhost:7238/Videos/GetVideo?videoID=$id'));
    if (response.statusCode == 200) {
      return GetVideoResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}