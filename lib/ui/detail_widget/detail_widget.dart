import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/models/merchandise_model.dart';

class DetailWidget extends ConsumerWidget {
  final MerchantModel merchantModel;
  final String imageTag;

  const DetailWidget({
    super.key,
    required this.merchantModel,
    required this.imageTag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: imageTag,
                  child: Image.network(merchantModel.image, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              margin: EdgeInsets.all(16),
              alignment: Alignment.bottomCenter,
              child: Text(
                merchantModel.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () {
                Navigator.maybePop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                ),
                alignment: Alignment.topLeft,
                child: Center(child: Icon(Icons.arrow_back_ios_new)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
