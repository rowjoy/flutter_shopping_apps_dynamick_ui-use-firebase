import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_ui_design/signin/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        primaryColor: Colors.greenAccent,
        textTheme: TextTheme(
          headline1: GoogleFonts.mada(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            color: Colors.black,
          ),
          headline2: GoogleFonts.montserrat(
            fontSize: 17,
            color: Colors.grey,
          ),
          headline3: GoogleFonts.montserrat(
            fontSize: 17,
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
          headline4: GoogleFonts.montserrat(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          headline5: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline6: GoogleFonts.montserrat(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: GoogleFonts.montserrat(
            fontSize: 19,
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: GoogleFonts.montserrat(
            fontSize: 14,
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: Signinpage.path,
      routes: {
        // ignore: prefer_const_constructors
        Signinpage.path: (context) => Signinpage(),
      },
    );
  }
}
