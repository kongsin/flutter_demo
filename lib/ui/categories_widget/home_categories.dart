import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/category_model.dart';
import 'package:todolist/di/viewmodel_provider.dart';

class HomeCategories extends ConsumerWidget {
  final int count = 6;
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var categoryViewModel = ref.watch(categoryViewModelProvider);
    return categoryViewModel.when(
      data: (data) {
        return buildWidgetContent(context, data);
      },
      error: (error, stack) {
        return SizedBox(
          width: 0,
          height: 0,
        );
      },
      loading: () {
        return SizedBox(
          width: 0,
          height: 0,
        );
      },
    );
  }

  Widget buildWidgetContent(BuildContext context, List<CategoryModel> items) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count, // 2 columns
          crossAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    elevation: 0,
                    shape: CircleBorder(
                      side: BorderSide(),
                      eccentricity: 0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      items[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(items[index].name, overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        },
      ),
    );
  }

}
