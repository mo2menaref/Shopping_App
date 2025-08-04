import 'package:flutter/material.dart';

final InputDecoration Lockstyle = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.brown,
      width: 3,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.brown,
      width: 3,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),

  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.blueGrey, width: 4.0),
  ),

  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
  ),

  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
  ),

);
