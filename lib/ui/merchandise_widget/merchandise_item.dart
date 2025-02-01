import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MerchandiseItemScreen extends StatefulWidget {
  const MerchandiseItemScreen({required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MerchandiseItems();
}

class MerchandiseItems extends State<MerchandiseItemScreen> {

  var itemCount = 20;
  final int col = 2;
  final String path = "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D";

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: col, // 2 columns
          crossAxisSpacing: 10,
          childAspectRatio: 0.88,
        ),
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(),
              borderRadius: BorderRadius.circular(10)
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    path,
                    fit: BoxFit.cover,
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

  void addItems() {
    setState(() {
      itemCount = itemCount + 20;
    });
  }

}
