import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/home_page_item_type.dart';
import '../banner_widget/home_banner.dart';
import '../categories_widget/home_categories.dart';
import '../merchandise_widget/merchandise_item.dart';
import '../recommend_widget/recommend_menu.dart';

class PageMain extends ConsumerStatefulWidget {
  const PageMain({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageMainState();
}

class _PageMainState extends ConsumerState<PageMain> {
  final List<HomePageItemType> _datas = [
    HomePageItemType.BANNER,
    HomePageItemType.CATEGORY,
    HomePageItemType.RECOMMEND,
    HomePageItemType.ITEM,
  ];

  final GlobalKey<MerchandiseItems> globalKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _showLoadMore(context);
        _hideLoadMore(context);
      }
    });
    return ListView.builder(
      itemCount: _datas.length,
      controller: _scrollController,
      itemBuilder: (context, index) {
        switch (_datas[index]) {
          case HomePageItemType.BANNER:
            return HomeBanner();
          case HomePageItemType.CATEGORY:
            return HomeCategories();
          case HomePageItemType.RECOMMEND:
            return RecommendMenu();
          case HomePageItemType.ITEM:
            return MerchandiseItemScreen(key: globalKey, columnCount: 2);
        }
      },
    );
  }

  void _hideLoadMore(context) async {
    await Future.delayed(Duration(seconds: 1));
    globalKey.currentState?.loadMore();
    Navigator.pop(context);
  }

  void _showLoadMore(context) {
    showDialog(
      context: context,
      builder: (context) {
        return _createLoadMoreDialog(context);
      },
    );
  }

  AlertDialog _createLoadMoreDialog(context) {
    return AlertDialog(
      title: Text("Load more"),
      content: Row(
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text("Loading..."),
          ),
        ],
      ),
    );
  }
}
