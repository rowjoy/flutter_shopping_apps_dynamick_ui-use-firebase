// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Userreviewsystem extends StatefulWidget {
  const Userreviewsystem({
    Key? key,
  }) : super(key: key);

  @override
  State<Userreviewsystem> createState() => _UserreviewState();
}

class _UserreviewState extends State<Userreviewsystem> {
  late double totalrating;
  @override
  void initState() {
    super.initState();
  }

  var fromFey = GlobalKey<FormState>();
  TextEditingController reviewcontroller = TextEditingController();
  TextEditingController areviewcontroller = TextEditingController();
  addreview() {
    CollectionReference user =
        FirebaseFirestore.instance.collection('product-review');
    user.add({
      "Name": FirebaseAuth.instance.currentUser!.email,
      "Rating": totalrating,
      "User-said": reviewcontroller.text,
    }).then((value) {
      Fluttertoast.showToast(msg: 'Your review add sucessfully');
    }).catchError((e) {
      Fluttertoast.showToast(msg: 'Some thing is problem$e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            enableDrag: true,
            backgroundColor: Colors.white.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 550,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Please tell me Product Rating',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    RatingBar.builder(
                      minRating: 1,
                      initialRating: 0.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (e) {
                        setState(() {
                          totalrating = e;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: fromFey,
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 7,
                              blurRadius: 0,
                              offset: Offset(0, 7), // Shadow position
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: reviewcontroller,
                          keyboardType: TextInputType.text,
                          maxLines: 4,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'review field isEmpaty';
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Your review',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 25),
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (fromFey.currentState!.validate()) {
                                fromFey.currentState!.save();
                                addreview();
                                Navigator.pop(context);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Please some problem');
                              }
                            });
                          },
                          child: Text('SUBMIT'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Write your review',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
