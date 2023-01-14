// ignore_for_file: file_names, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:pro_tekno1/models/RequestModels/LoginRequest/LoginRequest.dart';
import 'package:pro_tekno1/models/RequestModels/LoginRequest/LoginSmsVerificationRequest.dart';
import 'package:pro_tekno1/models/ResponseModels/AccountResponses/LoginSmsVerification.dart';
import 'package:pro_tekno1/models/responseModels/accountResponses/LoginResponse.dart';

import 'dart:async';
import 'dart:convert';


class AccountService {
  static Future<LoginResponse> Login(LoginRequest request) async {
    var Request = request.toJson(request);
    var requestBody = json.encode(Request);
    var response = await http.post(
      Uri.parse('https://localhost:7238/Account/Login'),
      headers: {"Content-Type": "application/json-patch+json"},
      body:requestBody,
    );
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<LoginSmsmVerificationResponse> LoginSmsVerification(LoginSmsVerificationRequest request) async {
    var Request = request.toJson(request);
    var requestBody = json.encode(Request);
    var response = await http.post(
      Uri.parse('https://localhost:7238/Account/LoginSmsVerification'),
      headers: {"Content-Type": "application/json-patch+json"},
      body:requestBody,
    );
    if (response.statusCode == 200) {
      return LoginSmsmVerificationResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }


}
