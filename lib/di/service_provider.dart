import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/mockup/banner_repository_mockup_impl.dart';
import 'package:todolist/data/mockup/categories_repository_mockup_impl.dart';
import 'package:todolist/data/mockup/recommend_repository_mockup_impl.dart';
import 'package:todolist/data/services/banner_api_service.dart';
import 'package:todolist/data/services/category_api_service.dart';
import 'package:todolist/data/services/recommend_api_service.dart';

final bannerAPIProvider = Provider((ref) => BannerAPIService());
final bannerRepository = Provider((ref) => BannerRepositoryMockupImpl());

final categoryAPIProvider = Provider((ref) => CategoryAPIService());
final categoryRepository = Provider((ref) => CategoriesRepositoriesMockupImpl());

final recommendAPIProvider = Provider((ref) => RecommendAPIService());
final recommendRepository = Provider((ref) => RecommendRepositoriesMockupImpl());