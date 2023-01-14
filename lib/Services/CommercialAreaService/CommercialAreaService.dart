// ignore_for_file: file_names, non_constant_identifier_names
import 'package:http/http.dart' as http;
import 'package:pro_tekno1/models/responseModels/commercialAreaResponses/GetCommercialAreaResponse.dart';
import 'dart:async';
import 'dart:convert';

import 'package:pro_tekno1/models/responseModels/commercialAreaResponses/ListCommercialAreaResponse.dart';

import '../../constants/generalToken.dart';

class CommercialAreaService {
  static Future<ListCommercialAreaResponse> GetCommercialAreas() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/CommercialAreas/GetAll'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return ListCommercialAreaResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetCommercialAreaResponse> GetCommercialArea(int id) async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse(
            'https://localhost:7238/CommercialAreas/GetCommercialArea?CommercialAreaID=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetCommercialAreaResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}
