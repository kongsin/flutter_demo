import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/domain/repositories/categories_repository.dart';
import 'package:todolist/domain/usecases/base_use_case.dart';

class GetCategoriesUseCase extends BaseUseCase<List<CategoryModel>> {

  CategoriesRepository repository;
  GetCategoriesUseCase(this.repository);

  @override
  Future<List<CategoryModel>> execute() async {
    List<CategoryModel> response = await repository.fetchCategories();
    return Future.value(response);
  }

}