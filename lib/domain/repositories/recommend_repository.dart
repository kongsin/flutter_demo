
import 'package:todolist/data/models/recommend_model.dart';

abstract class RecommendRepository {
  Future<List<RecommendModel>> fetchRecommends();
}