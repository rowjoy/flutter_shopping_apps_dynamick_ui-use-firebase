// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_ui_design/varification/varification.dart';

import '../golobalTextfield.dart';
import '../pagerouteanimation.dart';

class Userfrom extends StatefulWidget {
  const Userfrom({Key? key}) : super(key: key);

  @override
  _UserfromState createState() => _UserfromState();
}

class _UserfromState extends State<Userfrom> {
  var fromFey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phcontroller = TextEditingController();
  TextEditingController dmycontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  List<String> gender = ["Male", "Female", "Other"];

  Future selectdatetime(BuildContext context) async {
    final DateTime? piked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (piked != null) {
      setState(() {
        dmycontroller.text =
            "${piked.day}/ ${piked.month}/ ${piked.year}/${piked.hour}";
      });
    }
  }

  Future adduserinfo() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var crueentuser = _auth.currentUser;
    CollectionReference user =
        FirebaseFirestore.instance.collection('userinfo');
    user.doc(crueentuser!.email).set({
      'name': namecontroller.text,
      'pnonenumber': phcontroller.text,
      'datetime': dmycontroller.text,
      'gender': gendercontroller.text,
      'age': agecontroller.text,
    }).then((value) {
      Fluttertoast.showToast(msg: 'Thanks Submit Your userinfo');
      Navigator.push(
          context,
          createdroute(Varification(
            phone: phcontroller.text,
          )));
      namecontroller.clear();
      phcontroller.clear();
      dmycontroller.clear();
      gendercontroller.clear();
      agecontroller.clear();
    }).catchError((e) {
      Fluttertoast.showToast(msg: 'Internet problem');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Submit the Form Contnue',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: fromFey,
                child: Column(
                  children: [
                    Formfield(
                      controller: namecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Name Field Empty");
                        }
                      },
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                      obsettext: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Formfield(
                      keyboardType: TextInputType.number,
                      controller: phcontroller,
                      validator: (value) {
                        // if (value!.isEmpty) {
                        //   return ("Phone Number Field Empty");
                        // }
                        if (value!.length < 11) {
                          return ('Namber is invaid');
                        }
                      },
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                      obsettext: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Formfield(
                      controller: dmycontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Day-Month-Year Field Empty");
                        }
                      },
                      labelText: 'Day-Month-Year',
                      prefixIcon: Icon(Icons.timelapse),
                      obsettext: false,
                      suffixIcon: IconButton(
                        onPressed: () => selectdatetime(context),
                        icon: Icon(Icons.calendar_today_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Formfield(
                      controller: gendercontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Gender Select Field Empty");
                        }
                      },
                      labelText: 'Gender Select',
                      prefixIcon: DropdownButton<String>(
                        items: gender.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                            onTap: () {
                              setState(() {
                                gendercontroller.text = value;
                              });
                            },
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                      obsettext: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Formfield(
                      keyboardType: TextInputType.number,
                      controller: agecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Age Field Empty");
                        }
                      },
                      labelText: 'Age',
                      prefixIcon: Icon(Icons.person),
                      obsettext: false,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (fromFey.currentState!.validate()) {
                          fromFey.currentState!.save();
                          adduserinfo();
                        } else {
                          Fluttertoast.showToast(msg: 'TextFeild Empty');
                        }
                      },
                      child: Text('SUBMIT'),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width, 50),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
