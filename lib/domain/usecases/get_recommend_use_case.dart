import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/data/models/recommend_model.dart';
import 'package:todolist/domain/repositories/categories_repository.dart';
import 'package:todolist/domain/repositories/recommend_repository.dart';
import 'package:todolist/domain/usecases/base_use_case.dart';

class GetRecommendUseCase extends BaseUseCase<List<RecommendModel>> {

  RecommendRepository repository;
  GetRecommendUseCase(this.repository);

  @override
  Future<List<RecommendModel>> execute() async {
    List<RecommendModel> response = await repository.fetchRecommends();
    return Future.value(response);
  }

}