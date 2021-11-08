// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_ui_design/productdesign.dart';
import 'package:shopping_ui_design/productdetels.dart';

import '../../../gridviewproduct.dart';

class Womens extends StatefulWidget {
  const Womens({Key? key}) : super(key: key);

  @override
  _WomensState createState() => _WomensState();
}

class _WomensState extends State<Womens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.only(
                    top: 30,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset('assets/icon/Shape@1X.png'),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Smart Watch',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 20,
                    bottom: 25,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Brands',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 15),
                        width: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 50,
                              child: Image.asset('assets/icon/Icon_B&o@1X.png'),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'B&o',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    '1235 products',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

                FutureBuilder(
                    future:
                        FirebaseFirestore.instance.collection('products').get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Erro');
                      }

                      if (snapshot.hasData) {
                        Text('Some Problem');
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        List<DocumentSnapshot> productlist =
                            snapshot.data!.docs;
                        return Container(
                          height: MediaQuery.of(context).size.height * 1 / 2,
                          margin: EdgeInsets.only(top: 20),
                          child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: productlist.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemBuilder: (context, index) {
                                return Productdesign(
                                  productimage: productlist[index]
                                      ['product-img'],
                                  productname: productlist[index]
                                      ['product-name'],
                                  productprice: productlist[index]['Price'],
                                  discreption: productlist[index]
                                      ['product -discription'],
                                );
                              }),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        ),
                      );
                    }),

                // Gritviewproduct(),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Center(
                        child: Text(
                          'No filters applied',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      )),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.greenAccent),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Text('FILTER'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
