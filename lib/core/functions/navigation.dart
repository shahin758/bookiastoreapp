import 'package:flutter/material.dart';

void pushReplacement(BuildContext context, Widget newscreen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => newscreen),
  );
}

void pushTo(BuildContext context, Widget newscreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => newscreen));
}

void pushToBase(BuildContext context, Widget newscreen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => newscreen),
    (route) => false,
  );
}

void pop(BuildContext context, Widget newscreen) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => newscreen));
}
