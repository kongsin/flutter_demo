import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/data/models/user_model.dart';
import 'package:todolist/data/services/base_api_service.dart';

class BannerAPIService extends BaseAPIService {

  Future<List<BannerModel>> fetchBanners() async {
     final response = await http.get(Uri.parse("https://www.datacenter.com/banners"), headers: getDefaultHeader());
     try {
       responseValidation(response);
       return Future.value(jsonDecode(response.body));
     } catch (e) {
       return Future.error(e);
     }
  }

}