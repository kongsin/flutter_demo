import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/data/models/recommend_model.dart';
import 'package:todolist/data/services/recommend_api_service.dart';
import 'package:todolist/domain/repositories/categories_repository.dart';
import 'package:todolist/domain/repositories/recommend_repository.dart';

import '../services/category_api_service.dart';

class RecommendRepositoriesImpl extends RecommendRepository {

  RecommendAPIService service;
  RecommendRepositoriesImpl(this.service);

  @override
  Future<List<RecommendModel>> fetchRecommends() async {
    return await service.fetchRecommends();
  }

}