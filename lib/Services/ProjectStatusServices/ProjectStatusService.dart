// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:pro_tekno1/models/ResponseModels/ProjectStatusResponses/ListProjectResponse.dart';
import '../../constants/generalToken.dart';
import 'package:http/http.dart' as http;


class ProjectStatusService{
    static Future<ListProjectStatusResponse> GetProjectStatus() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/ProjectStatus/GetAll'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return ListProjectStatusResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}