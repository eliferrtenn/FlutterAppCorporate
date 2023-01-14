// ignore_for_file: non_constant_identifier_names, file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pro_tekno1/models/ResponseModels/ProjectResponses/GetProjectResponse.dart';
import '../../constants/generalToken.dart';
import '../../models/ResponseModels/ProjectResponses/ListProjectResponse.dart';


class ProjectService{
  static Future<ListProjectResponse> GetProjects(int id) async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Projects/GetAll?projectID=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return ListProjectResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetProjectResponse> GetProject(int id) async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse(
            'https://localhost:7238/Projects/GetProject?projectID=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetProjectResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}