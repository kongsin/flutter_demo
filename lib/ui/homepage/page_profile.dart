import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/ui/merchandise_widget/merchandise_item.dart';
import 'package:todolist/ui/merchandise_widget/merchat_cail.dart';

class PageProfile extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageProfileState();
}

class _PageProfileState extends ConsumerState<PageProfile> {
  ScrollController _scrollController = ScrollController();
  bool _showTitle = false;
  final double _actionbarHeight = 300;
  final double _toolbarHeight = 70;

  @override
  void initState() {
    _scrollController.addListener(() {
      print(" offset: ${_scrollController.offset}");
      if (_scrollController.offset >= (_actionbarHeight - _toolbarHeight)) {
        if (!_showTitle) {
          setState(() {
            _showTitle = true;
          });
        }
      } else {
        if (_showTitle) {
          setState(() {
            _showTitle = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 8,
            expandedHeight: _actionbarHeight,
            pinned: true,
            leadingWidth: MediaQuery.of(context).size.width,
            leading: Visibility(
              visible: _showTitle,
              child: Center(
                child: Text(
                  "Kongsin Pansansou",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.fromLTRB(16, 70, 16, 16),
                child: Center(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(150),
                        ),
                        elevation: 0,
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Kongsin Pansansou",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList.list(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Text(
                  "My Content",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 0
                ),
              ),
            ),
            MerchandiseItemScreen(columnCount: 3)
          ]),
        ],
      ),
    );
  }
}
