import 'package:flutter/material.dart';

class GreetingsStack extends StatefulWidget {
  @override
  _GreetingsStackState createState() => _GreetingsStackState();
}

class _GreetingsStackState extends State<GreetingsStack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 25,
            top: -5,
            child: Text(
              'Bom dia!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.33),
            ),
          ),
          Positioned(
            left: 25,
            top: 45,
            child: Text(
              'Como está o seu humor hoje?',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
