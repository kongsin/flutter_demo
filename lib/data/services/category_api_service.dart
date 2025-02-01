import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/data/services/base_api_service.dart';

class CategoryAPIService extends BaseAPIService {

  Future<List<CategoryModel>> fetchCategories() async {
    var response = await http.get(Uri.parse("https://www.datacenter.com/categories"), headers: getDefaultHeader());
    try {
      responseValidation(response);
      List<dynamic> jsonData = json.decode(response.body);
      List<CategoryModel> jsonResponse = jsonData.map((data) => CategoryModel.fromJson(data)).toList();
      return Future.value(jsonResponse);
    } catch (e) {
      return Future.error(e);
    }
  }

}