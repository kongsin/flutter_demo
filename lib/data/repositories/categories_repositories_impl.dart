import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/domain/repositories/categories_repository.dart';

import '../services/category_api_service.dart';

class CategoriesRepositoriesImpl extends CategoriesRepository {

  CategoryAPIService _service;
  CategoriesRepositoriesImpl(this._service);

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    return await _service.fetchCategories();
  }

}