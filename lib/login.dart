import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Positioned(
              left: 0,
              right: 0,
              top: 80,
              child:
                  Center(child: Image.asset('assets/images/login_image.png'))),
          Positioned(
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
                        color: Color(0xff263238),
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'humor do dia',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff263238),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                  InkWell(
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
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Image.asset('assets/images/login_arrow.png'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: RichText(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Não tem uma conta? ',
                        style: TextStyle(
                          color: Color(0xff263238),
                          fontSize: 14,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Criar agora',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
