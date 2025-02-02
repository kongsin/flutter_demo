import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/data/models/recommend_model.dart';
import 'package:todolist/data/services/base_api_service.dart';

class RecommendAPIService extends BaseAPIService {
  Future<List<RecommendModel>> fetchRecommends() async {
    final response = await http.get(
      Uri.parse("https://www.datacenter.com/recommends"),
      headers: getDefaultHeader(),
    );
    try {
      responseValidation(response);
      List<dynamic> jsonModel = json.decode(response.body);
      List<RecommendModel> responseItems =
          jsonModel.map((data) => RecommendModel.fromJson(data)).toList();
      return responseItems;
    } catch (e) {
      return Future.error(e);
    }
  }
}
