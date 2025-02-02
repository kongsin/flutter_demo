import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MerchantCellWidget extends StatelessWidget {

  final String image;
  final String name;

  const MerchantCellWidget({key, required this.image, required this.name}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(image, fit: BoxFit.cover),
          ),
          Expanded(
              child: Center(
                child: Text(name, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
              )
          ),
        ],
      ),
    );
  }

}