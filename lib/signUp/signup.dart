// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_ui_design/golobalTextfield.dart';
import 'package:shopping_ui_design/pagerouteanimation.dart';
import 'package:shopping_ui_design/userinfo/userfrom.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  var fromFey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future signup() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      if (userCredential.user!.uid.isNotEmpty) {
        emailcontroller.clear();
        passwordcontroller.clear();
        Navigator.push(context, createdroute(Userfrom()));
        Fluttertoast.showToast(msg: 'Thanks for signup');
      } else {
        Fluttertoast.showToast(msg: "Erro");
      }
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Problem');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers, duplicate_ignore
              Container(
                margin: EdgeInsets.only(
                  top: 45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(5, 5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/icon/Shape@1X.png'),
                    ),
                    Container(
                      // ignore: prefer_const_constructors
                      margin: EdgeInsets.only(top: 70, left: 25, right: 15),
                      child: Form(
                        key: fromFey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Formfield(
                              controller: emailcontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Email Field Empty");
                                }
                              },
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              obsettext: false,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Formfield(
                              controller: passwordcontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("password Field Empty");
                                }
                              },
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              obsettext: false,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (fromFey.currentState!.validate()) {
                                  fromFey.currentState!.save();
                                  signup();
                                } else {
                                  Fluttertoast.showToast(msg: 'Please Signup');
                                }
                              },
                              child: Text('SIGNUP'),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(1),
                                minimumSize: MaterialStateProperty.all(
                                  Size(MediaQuery.of(context).size.width, 50),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.greenAccent),
                              ),
                            ),
                          ],
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
    );
  }
}
