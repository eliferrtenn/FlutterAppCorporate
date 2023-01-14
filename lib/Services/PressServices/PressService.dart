// ignore_for_file: file_names, non_constant_identifier_names
import 'package:http/http.dart' as http;
import 'package:pro_tekno1/constants/generalToken.dart';
import 'dart:async';
import 'dart:convert';
import 'package:pro_tekno1/models/responseModels/pressResponses/GetPressResponse.dart';
import 'package:pro_tekno1/models/responseModels/pressResponses/ListPressResponse.dart';

class PressService {
  static Future<ListPressResponse> GetPresses() async {
         GeneralToken generalToken = GeneralToken();
     String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Press/GetAll'),
              headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return ListPressResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetPressResponse> GetPress(int id) async {
             GeneralToken generalToken = GeneralToken();
     String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Press/GetPress?pressID=$id'),
                 headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return GetPressResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}