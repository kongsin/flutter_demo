import 'package:flutter/material.dart';

class RecommendMenu extends StatelessWidget {
  const RecommendMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
      child: SizedBox(
        height: 155,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
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
                    "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Text("Menu $index", overflow: TextOverflow.ellipsis),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
