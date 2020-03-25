import 'package:flutter/material.dart';
import 'package:motion/pages/home.dart';
import 'package:motion/utils/fonts.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.60,
        height: MediaQuery.of(context).size.height * 0.08,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: CustomFonts.helvetica65,
              ),
            ),
            Image.asset('assets/images/login_arrow.png'),
          ],
        ),
      ),
    );
  }
}
