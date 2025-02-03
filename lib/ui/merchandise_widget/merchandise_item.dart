import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/merchandise_model.dart';
import 'package:todolist/di/viewmodel_provider.dart';
import 'package:todolist/ui/merchandise_widget/merchat_cail.dart';

class MerchandiseItemScreen extends ConsumerStatefulWidget {
  final int columnCount;
  const MerchandiseItemScreen({key, required this.columnCount})
    : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      MerchandiseItems(columnCount: columnCount);
}

class MerchandiseItems extends ConsumerState<MerchandiseItemScreen> {
  final int columnCount;
  MerchandiseItems({required this.columnCount}) : super();

  var _itemCount = 0;

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
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: _itemCount,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount, // 2 columns
          crossAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          return MerchantCellWidget(
            image: _items[index].image,
            name: _items[index].name,
            scheme: _items[index].scheme,
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
