import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/mockup/banner_repository_mockup_impl.dart';
import 'package:todolist/data/repositories/banner_repository_impl.dart';
import 'package:todolist/data/services/banner_api_service.dart';

final bannerAPIProvider = Provider((ref) => BannerAPIService());
final bannerRepository = Provider((ref) => BannerRepositoryMockupImpl());