import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/recommend_model.dart';

import '../../di/viewmodel_provider.dart';
import '../merchandise_widget/merchat_cail.dart';

class RecommendMenu extends ConsumerWidget {
  const RecommendMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var recommendViewModel = ref.watch(recommendWidgetViewModelProvider);
    return recommendViewModel.when(
      data: (recommends) {
        return buildWidgetContent(context, recommends);
      },
      error: (error, stack) {
        return SizedBox();
      },
      loading: () {
        return SizedBox();
      },
    );
  }

  Widget buildWidgetContent(BuildContext context, List<RecommendModel> items) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
      child: SizedBox(
        height: 145,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 120,
              child: MerchantCellWidget(
                image: items[index].image,
                name: items[index].title,
              ),
            );
          },
        ),
      ),
    );
  }

}
