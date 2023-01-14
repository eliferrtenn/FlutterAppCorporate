// ignore_for_file: file_names, non_constant_identifier_names
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:pro_tekno1/models/responseModels/historyResponses/GetHistoryResponse.dart';
import 'package:pro_tekno1/models/responseModels/historyResponses/ListHistoryResponse.dart';

import '../../constants/generalToken.dart';

class HistoryService {
  static Future<ListHistoryResponse> GetHistories() async {
     GeneralToken generalToken = GeneralToken();
     String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/History/GetAll'),
                  headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return ListHistoryResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetHistoryResponse> GetHistory(int id) async {
    var response = await http.get(
        Uri.parse('https://localhost:7238/History/GetHistory?historyID=$id'));
    if (response.statusCode == 200) {
      return GetHistoryResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }



}
