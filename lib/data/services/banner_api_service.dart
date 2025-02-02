import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/data/services/base_api_service.dart';

class BannerAPIService extends BaseAPIService {
  Future<List<BannerModel>> fetchBanners() async {
    final response = await http.get(
      Uri.parse("https://www.datacenter.com/banners"),
      headers: getDefaultHeader(),
    );
    try {
      responseValidation(response);
      List<dynamic> jsonModel = json.decode(response.body);
      List<BannerModel> responseItems =
          jsonModel.map((data) => BannerModel.fromJson(data)).toList();
      return responseItems;
    } catch (e) {
      return Future.error(e);
    }
  }
}
