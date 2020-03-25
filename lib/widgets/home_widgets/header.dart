import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 25,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          Positioned(
            left: 95,
            top: 8,
            child: Text(
              'Billy Mason',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Positioned(
            right: 25,
            top: -3,
            child: IconButton(
                icon: Image.asset('assets/images/icon_notifications.png'),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
