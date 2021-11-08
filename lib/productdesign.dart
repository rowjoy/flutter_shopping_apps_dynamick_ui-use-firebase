// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Productdesign extends StatelessWidget {
  final String? productimage;
  final String? productname;
  final String? discreption;
  final String? productprice;
  const Productdesign({
    Key? key,
    this.productimage,
    this.productprice,
    this.discreption,
    this.productname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 20),
            height: 240,
            width: 164,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(1),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Image.network(productimage!),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 8),
            width: 164,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productname!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  discreption!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '\$${productprice!}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
