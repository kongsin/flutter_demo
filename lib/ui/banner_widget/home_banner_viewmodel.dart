import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/domain/usecases/get_banner_use_case.dart';

class HomeBannerViewModel extends StateNotifier<AsyncValue<List<BannerModel>>> {
  GetBannerUseCase _bannerUserCase;

  HomeBannerViewModel(this._bannerUserCase) : super(AsyncLoading()) {
    fetchBanners();
  }

  void fetchBanners() {
    Future<List<BannerModel>> response = _bannerUserCase.execute();
    response.then(
      (banner) {
        state = AsyncData(banner);
      },
      onError: (error) {
        state = AsyncError(error, StackTrace.empty);
      },
    );
  }
}
