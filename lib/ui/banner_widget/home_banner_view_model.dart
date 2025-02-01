import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/domain/usecases/get_banner_use_case.dart';

class HomeBannerViewModel extends StateNotifier<AsyncValue<List<BannerModel>>> {
  GetBannerUseCase bannerUserCase;

  HomeBannerViewModel(this.bannerUserCase) : super(AsyncLoading()) {
    fetchBanners();
  }

  void fetchBanners() async {
    Future<List<BannerModel>> response = bannerUserCase.execute();
    response.then(
      (banner) {
        state = AsyncValue.data(banner);
      },
      onError: (error) {
        state = AsyncError(error, StackTrace.empty);
      },
    );
  }
}
