import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/data/models/merchandise_model.dart';
import 'package:todolist/data/services/base_api_service.dart';

class MerchandiseApiService extends BaseAPIService {
  Future<List<MerchantModel>> fetchRecommends() async {
    final response = await http.get(
      Uri.parse("https://www.datacenter.com/merchandises"),
      headers: getDefaultHeader(),
    );
    try {
      responseValidation(response);
      List<dynamic> jsonModel = json.decode(response.body);
      List<MerchantModel> responseItems =
          jsonModel.map((data) => MerchantModel.fromJson(data)).toList();
      return responseItems;
    } catch (e) {
      return Future.error(e);
    }
  }
}
