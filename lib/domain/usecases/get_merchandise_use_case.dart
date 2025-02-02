import 'package:todolist/data/models/merchandise_model.dart';
import 'package:todolist/domain/repositories/merchandise_repository.dart';
import 'package:todolist/domain/usecases/base_use_case.dart';

class GetMerchandiseUseCase extends BaseUseCase<List<MerchantModel>> {
  MerchandiseRepository repository;
  GetMerchandiseUseCase(this.repository);

  @override
  Future<List<MerchantModel>> execute() async {
    List<MerchantModel> response = await repository.fetchMerchandise();
    return Future.value(response);
  }
}
