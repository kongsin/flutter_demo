

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/di/use_case_provider.dart';
import 'package:todolist/ui/banner_widget/home_banner_view_model.dart';

var bannerViewModelProvider = StateNotifierProvider<HomeBannerViewModel, AsyncValue<List<BannerModel>>>(
    (ref) => HomeBannerViewModel(ref.read(getBannerUserCaseProvider))
);