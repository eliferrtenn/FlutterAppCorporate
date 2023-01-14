// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pro_tekno1/models/ResponseModels/BlogResponses/GetBlogResponse.dart';

import '../../constants/generalToken.dart';
import '../../models/ResponseModels/BlogResponses/ListBlogResponse.dart';

class BlogService{
  static Future<ListBlogResponse> GetBlogs() async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse('https://localhost:7238/Blog/GetAll'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return ListBlogResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }

  static Future<GetBlogResponse> GetBlog(int id) async {
    GeneralToken generalToken = GeneralToken();
    String? token = await generalToken.getToken();
    var response = await http.get(
        Uri.parse(
            'https://localhost:7238/Blog/GetBlog?blogID=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return GetBlogResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception("Veri yok");
  }
}