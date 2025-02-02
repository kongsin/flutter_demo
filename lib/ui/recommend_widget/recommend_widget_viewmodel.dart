import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/recommend_model.dart';
import 'package:todolist/domain/usecases/get_recommend_use_case.dart';

class RecommendWidgetViewModel extends StateNotifier<AsyncValue<List<RecommendModel>>> {

  GetRecommendUseCase _recommendUseCase;

  RecommendWidgetViewModel(this._recommendUseCase): super(AsyncLoading()) {
     fetchRecommend();
  }

  void fetchRecommend() {
      Future<List<RecommendModel>> response = _recommendUseCase.execute();
      response.then((recommend){
        state = AsyncData(recommend);
      }, onError: (e) {
        state = AsyncError(e, StackTrace.empty);
      });
  }

}