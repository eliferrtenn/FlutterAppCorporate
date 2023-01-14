// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:pro_tekno1/constants/generalToken.dart';
import 'package:pro_tekno1/models/ResponseModels/IdentityGuideResponses/GetIdentityGuideResponse.dart';
import 'package:http/http.dart' as http;

class IdentityGuideService{
    static Future<GetIdentityGuideResponse> GetIdentityGuide() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/IdentityGuide/GetAll'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetIdentityGuideResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}