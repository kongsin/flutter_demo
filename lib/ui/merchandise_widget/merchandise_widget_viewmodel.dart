import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/merchandise_model.dart';
import 'package:todolist/domain/usecases/get_merchandise_use_case.dart';

class MerchandiseWidgetViewModel
    extends StateNotifier<AsyncValue<List<MerchantModel>>> {
  GetMerchandiseUseCase _merchandiseUseCase;

  MerchandiseWidgetViewModel(this._merchandiseUseCase) : super(AsyncLoading()) {
    fetchMerchandise();
  }

  void fetchMerchandise() {
    var response = _merchandiseUseCase.execute();
    response.then(
      (merchandises) {
        state = AsyncData(merchandises);
      },
      onError: (e) {
        state = AsyncError(e, StackTrace.empty);
      },
    );
  }

  void loadMoreMerchandise() {
    var response = _merchandiseUseCase.execute();
    response.then(
          (merchandises) {
        state = AsyncData(merchandises);
      },
      onError: (e) {
        state = AsyncError(e, StackTrace.empty);
      },
    );
  }

}
