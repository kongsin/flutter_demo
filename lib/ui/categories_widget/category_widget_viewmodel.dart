import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/domain/usecases/get_category_use_case.dart';

class CategoryWidgetViewModel extends StateNotifier<AsyncValue<List<CategoryModel>>> {

  GetCategoriesUseCase getCategoriesUseCase;

  CategoryWidgetViewModel(this.getCategoriesUseCase): super(AsyncLoading()) {
    fetchCategories();
  }

  void fetchCategories() {
    Future<List<CategoryModel>> response = getCategoriesUseCase.execute();
    response.then((data) {
      state = AsyncData(data);
    }, onError: (error){
      state = AsyncError(error, StackTrace.empty);
    });
  }

}