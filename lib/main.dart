import 'package:flutter/material.dart';
import 'package:motion/fontes.dart';
import 'package:motion/login.dart';

void main() {
  runApp(
    MaterialApp(
      home: Login(),
      title: 'Motion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xffE8505B), fontFamily: CustomFonts.helvetica65),
    ),
  );
}
