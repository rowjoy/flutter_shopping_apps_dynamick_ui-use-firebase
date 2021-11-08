// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

// class GolobelTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final bool obscureText;
//   final String? labelText;
//   final Widget? suffixIcon;
//   final TextInputType? keytype;
//   const GolobelTextField({
//     Key? key,
//     this.controller,
//     required this.obscureText,
//     this.labelText,
//     this.suffixIcon,
//     this.keytype,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       keyboardType: keytype,
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         border: UnderlineInputBorder(),
//         labelText: labelText,
//         suffixIcon: suffixIcon,
//         labelStyle: Theme.of(context).textTheme.headline2,
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(width: 3, color: Colors.greenAccent),
//         ),
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(width: 2, color: Colors.grey),
//         ),
//       ),
//     );
//   }
// }

class Formfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final int? maxlanth;
  final bool? obsettext;
  final TextInputType? keyboardType;
  const Formfield({
    Key? key,
    this.controller,
    this.labelText,
    this.maxlanth,
    this.obsettext,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      style: Theme.of(context).textTheme.headline4,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.headline2,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.greenAccent),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
    );
  }
}
