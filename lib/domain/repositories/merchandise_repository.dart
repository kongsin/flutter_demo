
import 'package:todolist/data/models/merchandise_model.dart';

abstract class MerchandiseRepository {
  Future<List<MerchantModel>> fetchMerchandise();
}