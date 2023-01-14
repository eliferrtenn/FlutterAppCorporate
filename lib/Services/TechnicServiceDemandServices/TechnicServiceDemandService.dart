// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:pro_tekno1/models/RequestModels/TechnicalServiceDemandRequests/CreateTechnicalServiceDemandRequest.dart';
import 'package:pro_tekno1/models/RequestModels/TechnicalServiceDemandRequests/CreateTechnicalServiceDemandRequestResult.dart';
import 'package:pro_tekno1/models/RequestModels/TechnicalServiceDemandRequests/EditTechnicalServiceDemandRequest.dart';
import 'package:pro_tekno1/models/ResponseModels/TechnicalServiceDemandResponses/GetTechnicalServiceDemandResponse.dart';
import 'package:pro_tekno1/models/ResponseModels/TechnicalServiceDemandResponses/ListTechnicalServiceDemandResponse.dart';
import 'package:http/http.dart' as http;

import '../../constants/generalToken.dart';
import '../../models/RequestModels/TechnicalServiceDemandRequests/DeleteTechnicalServiceDemandRequest.dart';
import '../../models/RequestModels/TechnicalServiceDemandRequests/DeleteTechnicalServiceDemandResulRequest.dart';
import '../../models/RequestModels/TechnicalServiceDemandRequests/EditTechnicalServiceDemandResultRequest.dart';

class TechnicServiceDemandService {
  static Future<ListTechnicalServiceDemandResponse>
      ListTechnicDemandServices() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/TechnicalServiceDemand/GetAll'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return ListTechnicalServiceDemandResponse.fromJson(
          jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetTechnicalServiceDemandResponse> GetTechnicDemandService(
      int id) async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse(
            'https://localhost:7238/TechnicalServiceDemand/GetTechnicServiceDemand?TechnicalServiceID=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetTechnicalServiceDemandResponse.fromJson(
          jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<CreateTechnicalServiceDemandRequestResult>
      CreateTechnicalServiceDemand(
          CreateTechnicalServiceDemandRequest request) async {
    request.isDeleted = false;
    request.isEnabled = true;
    request.createDayDemand = DateTime.now().toString();
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var Request = request.toJson(request);
    var requestBody = json.encode(Request);
    var response = await http.post(
      Uri.parse('https://localhost:7238/TechnicalServiceDemand/Create'),
      headers: {
        "Content-Type": "application/json-patch+json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );
    if (response.statusCode == 200) {
      return CreateTechnicalServiceDemandRequestResult.fromJson(
          jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<EditTechnicalServiceDemandRequestResult>
      EditTechnicalServiceDemand(
          EditTechnicalServiceDemandRequest request) async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var Request = request.toJson(request);
    var requestBody = json.encode(Request);
    var response = await http.post(
      Uri.parse('https://localhost:7238/TechnicalServiceDemand/Edit'),
      headers: {
        "Content-Type": "application/json-patch+json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );
    if (response.statusCode == 200) {
      return EditTechnicalServiceDemandRequestResult.fromJson(
          jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<DeleteTechnicalServiceDemandRequestResult>
      DeleteTechnicalServiceDemand(
          DeleteTechnicalServiceDemandRequest request) async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var Request = request.toJson(request);
    var requestBody = json.encode(Request);
    var response = await http.post(
      Uri.parse('https://localhost:7238/TechnicalServiceDemand/Delete'),
      headers: {
        "Content-Type": "application/json-patch+json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: requestBody,
    );
    if (response.statusCode == 200) {
      return DeleteTechnicalServiceDemandRequestResult
      .fromJson(
          jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}
