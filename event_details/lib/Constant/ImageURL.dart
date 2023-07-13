// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';

class ItemImage extends StatelessWidget {
  String imageUrl;
  ItemImage({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 95,
      // padding: EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 40, 39, 39),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          fit: BoxFit.fill,
          image: NetworkImage(imageUrl),
        ),
      ),
      // child: Image.network(
      //   imageUrl,
      //   scale: 0.002,
      // ),
    );
  }
}
