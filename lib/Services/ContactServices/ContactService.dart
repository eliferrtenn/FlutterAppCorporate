// ignore_for_file: file_names, non_constant_identifier_names
import 'package:http/http.dart' as http;
import 'package:pro_tekno1/models/responseModels/contactResponses/GetContactResponse.dart';
import 'dart:async';
import 'dart:convert';
import 'package:pro_tekno1/models/responseModels/contactResponses/ListContactResponse.dart';

import '../../constants/generalToken.dart';

class ContactService {
  static Future<ListContactResponse> GetContacts() async {
        GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Contact/GetAll'),
             headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return ListContactResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetContactResponse> GetContact(int id) async {
        GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Contact/GetContact?contactId=$id'),            
             headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetContactResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }



}
