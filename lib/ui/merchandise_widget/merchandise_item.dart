import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/merchandise_model.dart';
import 'package:todolist/di/viewmodel_provider.dart';

class MerchandiseItemScreen extends ConsumerStatefulWidget {
  const MerchandiseItemScreen({required Key key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MerchandiseItems();
}

class MerchandiseItems extends ConsumerState<MerchandiseItemScreen> {
  var _itemCount = 0;
  final int _col = 2;

  final List<MerchantModel> _items = [];

  @override
  Widget build(BuildContext context) {
    var merchandiseViewModel = ref.watch(merchandiseWidgetViewModelProvider);
    merchandiseViewModel.when(
      data: (merchandise) {
        addItems(merchandise);
      },
      error: (e, stackTrace) {
        return SizedBox();
      },
      loading: () {
        return SizedBox();
      },
    );
    return buildWidgetContent(context, []);
  }

  Widget buildWidgetContent(
    BuildContext context,
    List<MerchantModel> merchandise,
  ) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: _itemCount,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _col, // 2 columns
          crossAxisSpacing: 10,
          childAspectRatio: 0.89,
        ),
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(_items[index].image, fit: BoxFit.cover),
                ),
                Text(_items[index].name, overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        },
      ),
    );
  }

  void addItems(List<MerchantModel> merchandise) {
    setState(() {
      _items.addAll(merchandise);
      _itemCount = _items.length;
    });
  }

  void loadMore() {
    var merchandiseViewModel = ref.read(
      merchandiseWidgetViewModelProvider.notifier,
    );
    merchandiseViewModel.loadMoreMerchandise();
  }
}
