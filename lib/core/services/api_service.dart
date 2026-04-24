import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';

class ApiService {
  Future<List<dynamic>> fetchArticles() async {
    final response = await http.get(Uri.parse(ApiConstants.baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['articles'];
    } else {
      throw Exception('Failed');
    }
  }
}
