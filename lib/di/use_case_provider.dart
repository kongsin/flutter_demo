import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/di/service_provider.dart';
import 'package:todolist/domain/usecases/get_banner_use_case.dart';
import 'package:todolist/domain/usecases/get_category_use_case.dart';

var getBannerUserCaseProvider = Provider((ref) => GetBannerUseCase(ref.read(bannerRepository)));
var getCategoryUseCaseProvider = Provider((ref) => GetCategoriesUseCase(ref.read(categoryRepository)));