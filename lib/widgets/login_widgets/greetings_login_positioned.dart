import 'package:flutter/material.dart';
import 'package:motion/utils/fonts.dart';

class GreetingsLoginPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 175,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem vindo!',
              style: TextStyle(
                fontSize: 30,
                fontFamily: CustomFonts.helvetica65,
                color: Color(0xff263238),
              ),
            ),
            RichText(
              maxLines: 2,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Escolha músicas conforme o seu\n',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: CustomFonts.helvetica65,
                  color: Color(0xff263238),
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: 'humor do dia',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: CustomFonts.helvetica65,
                      color: Color(0xff263238),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
