import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/recommend_model.dart';

import '../../di/viewmodel_provider.dart';

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
            return Card(
              margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
              shape: RoundedRectangleBorder(
                side: BorderSide(),
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.network(
                    items[index].image,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Text(items[index].title, overflow: TextOverflow.ellipsis),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
