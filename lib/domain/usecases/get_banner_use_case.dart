import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/domain/repositories/banner_repository.dart';
import 'package:todolist/domain/usecases/base_use_case.dart';

class GetBannerUseCase extends BaseUseCase<List<BannerModel>> {
  BannerRepository bannerRepository;

  GetBannerUseCase(this.bannerRepository);

  @override
  Future<List<BannerModel>> execute() async {
    return await bannerRepository.fetchBanners();
  }

}