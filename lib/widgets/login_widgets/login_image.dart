import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 80,
      child: Center(
        child: Image.asset('assets/images/login_image.png'),
      ),
    );
  }
}
