import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/di/service_provider.dart';
import 'package:todolist/domain/usecases/get_banner_use_case.dart';
import 'package:todolist/domain/usecases/get_category_use_case.dart';
import 'package:todolist/domain/usecases/get_merchandise_use_case.dart';
import 'package:todolist/domain/usecases/get_recommend_use_case.dart';

final getBannerUserCaseProvider = Provider((ref) => GetBannerUseCase(ref.read(bannerRepository)));
final getCategoryUseCaseProvider = Provider((ref) => GetCategoriesUseCase(ref.read(categoryRepository)));
final getRecommendUseCaseProvider = Provider((ref) => GetRecommendUseCase(ref.read(recommendRepository)));
final getMerchandiseUseCaseProvider = Provider((ref) => GetMerchandiseUseCase(ref.read(merchandiseRepository)));