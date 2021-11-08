// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 10),
                child: Column(
                  children: [
                    Text(
                      ' Total Price',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text('0', style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              Container(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent)),
                    onPressed: () {},
                    child: Text(
                      'Proceed to Checkout',
                      style: GoogleFonts.montserrat(),
                    )),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'ADD CART LIST',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('addtocart')
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection('User-Cart')
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Erro');
                }

                if (snapshot.hasData) {
                  Text('Some Problem');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  List<DocumentSnapshot> cirdlist = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: cirdlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey.withOpacity(1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: NetworkImage(
                                      cirdlist[index]['ProductImage']),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cirdlist[index]['productname'],
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                  Text(cirdlist[index]['price'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ],
                              ),
                            ),
                            Container(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      CollectionReference addcart =
                                          FirebaseFirestore.instance
                                              .collection('addtocart')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.email)
                                              .collection('User-Cart');
                                      addcart
                                          .doc(cirdlist[index].id)
                                          .delete()
                                          .then((value) {
                                        Fluttertoast.showToast(
                                            msg: 'Remove product Successfuly');
                                      }).catchError((e) {});
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.blueGrey,
                                    size: 30,
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
