// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:pro_tekno1/constants/generalToken.dart';
import 'package:pro_tekno1/models/responseModels/humanResourceResponses/GetHumanResourceResponse.dart';
import 'package:pro_tekno1/models/responseModels/identityGuideResponses/GetIdentityGuideResponse.dart';
import 'package:pro_tekno1/models/responseModels/introResponses/GetIntroResponse.dart';
import 'dart:async';
import 'dart:convert';

import 'package:pro_tekno1/models/responseModels/kvkkResponses/GetKvkkResponse.dart';
import 'package:pro_tekno1/models/responseModels/sustainabilityResponses/GetSustainabilityResponse.dart';

class CommonService {
  static Future<GetHumanResourceResponse> getHumanResource() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Common/GetHumanResorce'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetHumanResourceResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetIdentityGuideResponse> getIdentityGuide() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Common/GetIdentityGuide'),
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

  static Future<GetIntroResponse> getIntro() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http
        .get(Uri.parse('https://localhost:7238/Common/GetIntro'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
     GetIntroResponse model=GetIntroResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return model;
    }
    throw Exception("Veri yok");
  }

  static Future<GetKvkkResponse> getKvkk() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http
        .get(Uri.parse('https://localhost:7238/Common/GetKvkk'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return GetKvkkResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetSustainabilityResponse> getSustainability() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Common/GetSustainability'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetSustainabilityResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}
