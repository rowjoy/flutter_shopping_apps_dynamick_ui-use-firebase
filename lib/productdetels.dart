// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_ui_design/firebase/review.dart';
import 'package:shopping_ui_design/userreview.dart';

class Productdetels extends StatefulWidget {
  final String? image;
  final String? productname;
  final String? productprice;
  final String? discreption;
  final String? tag;
  const Productdetels({
    Key? key,
    this.image,
    this.discreption,
    this.productname,
    this.productprice,
    this.tag,
  }) : super(key: key);

  @override
  _ProductdetelsState createState() => _ProductdetelsState();
}

class _ProductdetelsState extends State<Productdetels> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(widget.productprice!,
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent)),
                  onPressed: () {
                    setState(() {
                      final FirebaseAuth _auth = FirebaseAuth.instance;
                      var creentuser = _auth.currentUser;
                      CollectionReference addcart = FirebaseFirestore.instance
                          .collection('addtocart')
                          .doc(creentuser!.email)
                          .collection('User-Cart');
                      addcart.add({
                        "ProductImage": widget.image,
                        "price": widget.productprice,
                        "productname": widget.productname,
                        'discription': widget.discreption,
                      }).then((value) {
                        Navigator.pop(context);
                        Fluttertoast.showToast(msg: 'Product add Sucessfully');
                      }).catchError((e) {
                        Fluttertoast.showToast(
                            msg: 'Please check your internet');
                      });
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'ADD TO CART',
                      style: GoogleFonts.montserrat(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage('assets/icon/Shape@1X.png'),
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 600,
                  child: Hero(
                    tag: widget.tag!,
                    child: ListView(
                      children: [
                        Container(
                          color: Colors.grey,
                          child: AspectRatio(
                            aspectRatio: 1.3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 25, bottom: 25),
                              child: Image.network(widget.image!),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.productname!,
                                  style: Theme.of(context).textTheme.headline1,
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text('Size',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                      Text('Xl',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text('Color',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Details',
                                style: Theme.of(context).textTheme.headline1,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                          child: Text(
                            widget.discreption!,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Review',
                                style: Theme.of(context).textTheme.headline1,
                              )
                            ],
                          ),
                        ),
                        Userreviewsystem(),
                        //user product review
                        Userproductreview(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
