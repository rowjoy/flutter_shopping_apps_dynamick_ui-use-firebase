// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({
    Key? key,
  }) : super(key: key);

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  TextEditingController searchbar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      controller: searchbar,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
          prefixIcon: ImageIcon(
            AssetImage(
              'assets/icon/Icon_Search@1X.png',
            ),
            color: Colors.black,
          ),
          suffixIcon: ImageIcon(
            AssetImage('assets/icon/Camara205@1X.png'),
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          )),
    );
  }
}
