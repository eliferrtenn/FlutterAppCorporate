// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pro_tekno1/models/RequestModels/MemberRequests/UpdateMemberRequestResult.dart';
import 'package:pro_tekno1/models/ResponseModels/MemberResponses/GetMemberResponse.dart';

import '../../constants/generalToken.dart';
import '../../models/RequestModels/MemberRequests/UpdateMemberRequest.dart';

class MemberService{
      static Future<GetMemberResponse> GetMember() async {
     GeneralToken generalToken = GeneralToken();
     String? token = await generalToken.getToken();
    var response = await http.get(
      Uri.parse('https://localhost:7238/Member/GetMember'),
      headers: {"Content-Type": "application/json-patch+json",
            'Accept': 'application/json',
      'Authorization': 'Bearer $token',},
    );
    GetMemberResponse deneme =  GetMemberResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return deneme;
    }
    throw Exception("Veri yok");
  }

  static Future<UpdateMemberRequestResult> UpdateMember(UpdateMemberRequest request) async {
     GeneralToken generalToken = GeneralToken();
     String? token = await generalToken.getToken();
    var Request = request.toJson(request);
    var requestBody = json.encode(Request);
    var response = await http.post(
      Uri.parse('https://localhost:7238/Member/UpdateMember'),
      headers: {"Content-Type": "application/json-patch+json",
            'Accept': 'application/json',
      'Authorization': 'Bearer $token',},
      body:requestBody,
    );
    if (response.statusCode == 200) {
      return UpdateMemberRequestResult.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}