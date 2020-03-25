import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion/widgets/login_widgets/greetings_login_positioned.dart';
import 'package:motion/widgets/login_widgets/login_button.dart';
import 'package:motion/widgets/login_widgets/login_image.dart';
import 'package:motion/widgets/login_widgets/signup_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            LoginImage(),
            GreetingsLoginPositioned(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 35,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.17,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    LoginButton(),
                    SignupButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
