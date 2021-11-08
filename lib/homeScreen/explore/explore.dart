// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:shopping_ui_design/homeScreen/explore/catagorise/womens.dart';
import 'package:shopping_ui_design/homeScreen/explore/searchbar.dart';
import 'package:shopping_ui_design/pagerouteanimation.dart';
import 'package:shopping_ui_design/productdesign.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_ui_design/productdetels.dart';
import 'catagorise/Golobalcatagori.dart';

class Explorepage extends StatefulWidget {
  const Explorepage({Key? key}) : super(key: key);

  @override
  _ExplorepageState createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Searchbar(),
            ),
            preferredSize: Size.fromHeight(50)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                child: Text(
                  'Categorise',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Catagoriselist(
                      image: 'assets/category/Icon_Mens Shoe@1X.png',
                      onpressss: () {
                        Navigator.push(context, createdroute(Womens()));
                      },
                      cotagorisename: 'Mens',
                    ),
                    Catagoriselist(
                      image: 'assets/category/Icon_Womens Shoe@1X.png',
                      onpressss: () {
                        Navigator.push(context, createdroute(Womens()));
                      },
                      cotagorisename: 'Womens',
                    ),
                    Catagoriselist(
                      image: 'assets/category/Icon_Devices@1X.png',
                      onpressss: () {
                        Navigator.push(context, createdroute(Womens()));
                      },
                      cotagorisename: 'Device',
                    ),
                    Catagoriselist(
                      image: 'assets/category/Icon_Gadgets@1X.png',
                      onpressss: () {
                        Navigator.push(context, createdroute(Womens()));
                      },
                      cotagorisename: 'Gedgets',
                    ),
                    Catagoriselist(
                      image: 'assets/category/Icon_Gaming@1X.png',
                      onpressss: () {
                        Navigator.push(context, createdroute(Womens()));
                      },
                      cotagorisename: 'Gaming',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Selling',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'See all',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
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
                      List<DocumentSnapshot> productlist = snapshot.data!.docs;
                      return Container(
                        height: 370,
                        child: ListView.builder(
                          itemCount: productlist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Productdetels(
                                              image: productlist[index]
                                                  ['product-img'],
                                              productname: productlist[index]
                                                  ['product-name'],
                                              productprice: productlist[index]
                                                  ['Price'],
                                              discreption: productlist[index]
                                                  ['product -discription'],
                                              tag: productlist[index]['tag'],
                                            )));
                              },
                              child: Hero(
                                tag: productlist[index]['tag'],
                                child: Productdesign(
                                  productimage: productlist[index]
                                      ['product-img'],
                                  productname: productlist[index]
                                      ['product-name'],
                                  productprice: productlist[index]['Price'],
                                  discreption: productlist[index]
                                      ['product -discription'],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    );
                  }),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 355,
                height: 164,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset('assets/product/5691822.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 15,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fuatured Brands',
                      style: Theme.of(context).textTheme.headline1,
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
                                        Theme.of(context).textTheme.headline1,
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
                    }),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'See all',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
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
                      List<DocumentSnapshot> productlist = snapshot.data!.docs;
                      return Container(
                        height: 370,
                        child: ListView.builder(
                          itemCount: productlist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Productdetels(
                                              image: productlist[index]
                                                  ['product-img'],
                                              productname: productlist[index]
                                                  ['product-name'],
                                              productprice: productlist[index]
                                                  ['Price'],
                                              discreption: productlist[index]
                                                  ['product -discription'],
                                              tag: productlist[index]['tag'],
                                            )));
                              },
                              child: Productdesign(
                                productimage: productlist[index]['product-img'],
                                productname: productlist[index]['product-name'],
                                productprice: productlist[index]['Price'],
                                discreption: productlist[index]
                                    ['product -discription'],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
