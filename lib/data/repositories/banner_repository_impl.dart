import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/data/services/banner_api_service.dart';
import 'package:todolist/domain/repositories/banner_repository.dart';

class BannerRepositoryImpl extends BannerRepository {

  final BannerAPIService service;

  BannerRepositoryImpl(this.service);

  @override
  Future<List<BannerModel>> fetchBanners() async {
    return await service.fetchBanners();
  }

}