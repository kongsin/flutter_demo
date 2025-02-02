import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/domain/repositories/categories_repository.dart';
import 'package:todolist/domain/usecases/base_use_case.dart';

class GetCategoriesUseCase extends BaseUseCase<List<CategoryModel>> {

  CategoriesRepository _repository;
  GetCategoriesUseCase(this._repository);

  @override
  Future<List<CategoryModel>> execute() async {
    List<CategoryModel> response = await _repository.fetchCategories();
    return Future.value(response);
  }

}