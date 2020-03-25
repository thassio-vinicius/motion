import 'package:flutter/material.dart';
import 'package:motion/utils/fonts.dart';

class SignupButton extends StatefulWidget {
  @override
  _SignupButtonState createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: RichText(
        maxLines: 1,
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Não tem uma conta? ',
          style: TextStyle(
            color: Color(0xff263238),
            fontSize: 14,
            fontFamily: CustomFonts.helvetica65,
          ),
          children: <InlineSpan>[
            TextSpan(
              text: 'Criar agora',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: CustomFonts.helvetica65,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
