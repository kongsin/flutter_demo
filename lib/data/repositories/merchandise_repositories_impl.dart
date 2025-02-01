import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/data/models/merchandise_model.dart';
import 'package:todolist/data/models/recommend_model.dart';
import 'package:todolist/data/services/merchandise_api_service.dart';
import 'package:todolist/data/services/recommend_api_service.dart';
import 'package:todolist/domain/repositories/categories_repository.dart';
import 'package:todolist/domain/repositories/merchandise_repository.dart';
import 'package:todolist/domain/repositories/recommend_repository.dart';

import '../services/category_api_service.dart';

class MerchandiseRepositoriesImpl extends MerchandiseRepository {

  MerchandiseApiService service;
  MerchandiseRepositoriesImpl(this.service);

  @override
  Future<List<MerchantModel>> fetchMerchandise() async {
    return await service.fetchRecommends();
  }

}