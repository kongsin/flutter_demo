import 'package:todolist/data/models/merchandise_model.dart';
import 'package:todolist/data/services/merchandise_api_service.dart';
import 'package:todolist/domain/repositories/merchandise_repository.dart';

class MerchandiseRepositoriesImpl extends MerchandiseRepository {
  MerchandiseApiService service;
  MerchandiseRepositoriesImpl(this.service);

  @override
  Future<List<MerchantModel>> fetchMerchandise() async {
    return await service.fetchRecommends();
  }
}
