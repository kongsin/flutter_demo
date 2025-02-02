import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/di/viewmodel_provider.dart';

import '../../../data/models/banner_model.dart';

class HomeBanner extends ConsumerStatefulWidget {
  const HomeBanner({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBannerState();
}

class _HomeBannerState extends ConsumerState<HomeBanner> {
  bool _isLoadingVisible = false;
  bool _isErrorVisible = false;
  String _errorMsg = "";

  void showLoading() {
    setState(() {
      _isLoadingVisible = true;
    });
  }

  void hideLoading() {
    setState(() {
      _isLoadingVisible = false;
    });
  }

  void showError() {
    setState(() {
      _isErrorVisible = true;
    });
  }

  void hideError() {
    setState(() {
      _isErrorVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bannerViewModel = ref.watch(bannerViewModelProvider);
    return bannerViewModel.when(
      data: (banners) {
        hideLoading();
        return buildPageContent(context, banners);
      },
      error: (error, stack) {
        hideLoading();
        showError();
        return buildErrorContent(context);
      },
      loading: () {
        showLoading();
        return buildLoadingContent(context);
      },
    );
  }

  Widget buildPageContent(BuildContext context, List<BannerModel> banners) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(),
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        banners[index].image,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        banners[index].title,
                        textScaler: TextScaler.linear(2),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildErrorContent(context) {
    return Visibility(
      visible: _isErrorVisible,
      child: Center(
        child: Text("Error: $_errorMsg", style: TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget buildLoadingContent(context) {
    return Visibility(
      visible: _isLoadingVisible,
      child: Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
