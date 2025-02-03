import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/data/models/merchandise_model.dart';
import 'package:todolist/ui/detail_widget/detail_widget.dart';
import 'package:uuid/uuid.dart';

class MerchantCellWidget extends StatelessWidget {
  final String image;
  final String name;
  final String scheme;

  const MerchantCellWidget({
    key,
    required this.image,
    required this.name,
    required this.scheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uuid uuid = const Uuid();
    final String imageTag = uuid.v4();
    return GestureDetector(
      onTap:
          () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailWidget(
                      merchantModel: MerchantModel(
                        name: name,
                        image: image,
                        scheme: scheme,
                      ),
                      imageTag: imageTag,
                    ),
              ),
            ),
          },
      child: Card(
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
              child: Hero(
                tag: imageTag,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
