

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/di/use_case_provider.dart';
import 'package:todolist/ui/banner_widget/home_banner_view_model.dart';
import 'package:todolist/ui/categories_widget/category_widget_viewmodel.dart';

var bannerViewModelProvider = StateNotifierProvider<HomeBannerViewModel, AsyncValue<List<BannerModel>>>(
    (ref) => HomeBannerViewModel(ref.read(getBannerUserCaseProvider))
);

var categoryViewModelProvider = StateNotifierProvider<CategoryWidgetViewModel, AsyncValue<List<CategoryModel>>>(
    (ref) => CategoryWidgetViewModel(ref.read(getCategoryUseCaseProvider))
);