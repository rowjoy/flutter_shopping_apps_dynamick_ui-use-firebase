// ignore_for_file: prefer_const_constructors

// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_ui_design/homeScreen/homescreen.dart';
import 'package:shopping_ui_design/pagerouteanimation.dart';
import '../golobalTextfield.dart';
import 'compononts/forgotpassword.dart';
import 'compononts/signuproute.dart';

class Signinpage extends StatefulWidget {
  static const String path = 'Signinpage';
  const Signinpage({Key? key}) : super(key: key);

  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  var fromFey = GlobalKey<FormState>();
  TextEditingController emailconteroller = TextEditingController();
  TextEditingController passwordconteroller = TextEditingController();

  Future sinin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailconteroller.text, password: passwordconteroller.text);

      if (userCredential.user!.uid.isNotEmpty) {
        Navigator.push(context, createdroute(HomeScreen()));
        Fluttertoast.showToast(msg: 'Thamks You Enjoy');
      } else {
        Fluttertoast.showToast(msg: 'Network Erro');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Erro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 100, left: 15, right: 15),
            child: Form(
              key: fromFey,
              child: Column(
                children: [
                  const Siginuproute(),
                  const SizedBox(
                    height: 25,
                  ),
                  Formfield(
                    controller: emailconteroller,
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
                    controller: passwordconteroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("password Field Empty");
                      }
                    },
                    labelText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    obsettext: false,
                  ),
                  forgotpassword(context),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (fromFey.currentState!.validate()) {
                        fromFey.currentState!.save();
                        setState(() {
                          sinin();
                        });
                      } else {
                        Fluttertoast.showToast(msg: 'Please Signin');
                      }
                    },
                    child: Text('SIGNIN'),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(1),
                      minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      '-OR-',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/icon/Path 76@1X.png'),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Sign in With Facebook',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset('assets/icon/icons8_Google_2@1X.png'),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Sign in With Google',
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
