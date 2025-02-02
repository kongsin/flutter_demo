import 'package:flutter/material.dart';
import 'package:todolist/ui/banner_widget//home_banner.dart';
import 'package:todolist/ui/categories_widget/home_categories.dart';
import 'package:todolist/ui/merchandise_widget/merchandise_item.dart';
import 'package:todolist/ui/recommend_widget/recommend_menu.dart';
import '../../enums/home_page_item_type.dart';

class HomepageScreen extends StatelessWidget {
  List<HomePageItemType> _datas = [
    HomePageItemType.BANNER,
    HomePageItemType.CATEGORY,
    HomePageItemType.RECOMMEND,
    HomePageItemType.ITEM,
  ];

  final GlobalKey<MerchandiseItems> globalKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _showLoadMore(context);
        _hideLoadMore(context);
      }
    });

    return Scaffold(
      body: ListView.builder(
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
              return MerchandiseItemScreen(key: globalKey);
          }
        },
      ),
    );
  }

  void _showLoadMore(context) {
    showDialog(
      context: context,
      builder: (context) {
        return _createLoadMoreDialog(context);
      },
    );
  }

  void _hideLoadMore(context) async {
    await Future.delayed(Duration(seconds: 1));
    globalKey.currentState?.loadMore();
    Navigator.pop(context);
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
