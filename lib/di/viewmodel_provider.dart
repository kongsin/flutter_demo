

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/data/models/recommend_model.dart';
import 'package:todolist/di/use_case_provider.dart';
import 'package:todolist/ui/banner_widget/home_banner_viewmodel.dart';
import 'package:todolist/ui/categories_widget/category_widget_viewmodel.dart';
import 'package:todolist/ui/recommend_widget/recommend_widget_viewmodel.dart';

var categoryViewModelProvider = StateNotifierProvider<CategoryWidgetViewModel, AsyncValue<List<CategoryModel>>>(
    (ref) => CategoryWidgetViewModel(ref.read(getCategoryUseCaseProvider))
);

var bannerViewModelProvider = StateNotifierProvider<HomeBannerViewModel, AsyncValue<List<BannerModel>>>(
    (ref) => HomeBannerViewModel(ref.read(getBannerUserCaseProvider))
);

var recommendWidgetViewModelProvider = StateNotifierProvider<RecommendWidgetViewModel, AsyncValue<List<RecommendModel>>>(
    (ref) => RecommendWidgetViewModel(ref.read(getRecommendUseCaseProvider))
);
