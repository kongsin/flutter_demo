import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/data/models/user_model.dart';
import 'package:todolist/data/services/base_api_service.dart';

class UserAPIService extends BaseAPIService {

  Future<UserModel> fetchUserData(String userid) async {
     final response = await http.get(Uri.parse("https://www.datacenter.com/user/$userid"), headers: getDefaultHeader());
     try {
       responseValidation(response);
       return UserModel.fromJson(json.decode(response.body));
     } catch (e) {
       return Future.error(e);
     }
  }

}