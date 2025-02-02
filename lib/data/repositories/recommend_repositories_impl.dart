import 'package:todolist/data/models/recommend_model.dart';
import 'package:todolist/data/services/recommend_api_service.dart';
import 'package:todolist/domain/repositories/recommend_repository.dart';

class RecommendRepositoriesImpl extends RecommendRepository {
  RecommendAPIService service;
  RecommendRepositoriesImpl(this.service);

  @override
  Future<List<RecommendModel>> fetchRecommends() async {
    return await service.fetchRecommends();
  }
}
