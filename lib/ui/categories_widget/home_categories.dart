import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var count = 6;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
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
                    shape: CircleBorder(side: BorderSide(), eccentricity: 0),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text("Menu $index", overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        },
      ),
    );
  }
}
