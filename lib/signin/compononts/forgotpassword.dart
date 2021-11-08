import 'package:flutter/material.dart';

Container forgotpassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(top: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Forgot Passwort?',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ),
  );
}
