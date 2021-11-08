// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Userproductreview extends StatefulWidget {
  const Userproductreview({
    Key? key,
  }) : super(key: key);

  @override
  State<Userproductreview> createState() => _UserproductreviewState();
}

class _UserproductreviewState extends State<Userproductreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(),
            width: 70,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(),
                  width: 270,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        child: Text('Jamirul islam',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ),
                      Container(
                        height: 40,
                        width: 60,
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.yellow,
                            ),
                            Text(
                              '55',
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 270,
                  child: Text(
                    'Each product has a useful life after which it needs replacement Each product has a useful life after which it needs replacement',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
