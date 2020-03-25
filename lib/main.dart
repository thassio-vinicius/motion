import 'package:flutter/material.dart';
import 'package:motion/pages/login.dart';
import 'package:motion/utils/fonts.dart';

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
