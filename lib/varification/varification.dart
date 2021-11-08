// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopping_ui_design/homeScreen/homescreen.dart';

import 'package:shopping_ui_design/pagerouteanimation.dart';

import 'package:shopping_ui_design/varification/components/function.dart';

class Varification extends StatefulWidget {
  final String? phone;

  const Varification({Key? key, this.phone}) : super(key: key);

  @override
  _VarificationState createState() => _VarificationState();
}

class _VarificationState extends State<Varification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.push(context, createdroute(HomeScreen()));
        },
        label: Padding(
          padding: const EdgeInsets.only(left: 90, right: 90),
          child: Text('CONTINUE'),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 70,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/icon/Shape@1X.png'))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verification',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'A 6 Digit pin has Been Send to your email address enter its below to continue',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'Verifi Number : +088${widget.phone}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: TextFormField(
                            autofocus: true,
                            textAlign: TextAlign.justify,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: otpdecration,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: TextFormField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: otpdecration,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: TextFormField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: otpdecration,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: TextFormField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: otpdecration,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: TextFormField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: otpdecration,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: TextFormField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: otpdecration,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(context, createdroute(HomeScreen()));
                //     },
                //     child: Text('CONTINUE'),
                //     style: ButtonStyle(
                //       elevation: MaterialStateProperty.all(1),
                //       minimumSize: MaterialStateProperty.all(
                //         Size(MediaQuery.of(context).size.width, 50),
                //       ),
                //       backgroundColor:
                //           MaterialStateProperty.all(Colors.greenAccent),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
