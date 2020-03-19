import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion/custom_tracker.dart';
import 'package:motion/fontes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _value = 0.2;
  UI.Image _image;

  _getLabelText() {
    if (_value >= 0 && _value <= 2) {
      return 'Feliz';
    } else if (_value > 2 && _value <= 4) {
      return 'Animado';
    } else if (_value > 4 && _value <= 6) {
      return 'Neutro';
    } else if (_value > 6 && _value <= 8) {
      return 'Entediado';
    } else if (_value > 8 && _value <= 10) {
      return 'Triste';
    }
  }

  _loadUiImage() async {
    final ByteData data = await rootBundle.load('assets/images/icon_thumb.png');
    final Completer<UI.Image> completer = Completer();
    UI.decodeImageFromList(Uint8List.view(data.buffer), (UI.Image img) {
      return completer.complete(img);
    });

    completer.future.then((image) {
      setState(() => _image = image);
    });
  }

  @override
  void initState() {
    _loadUiImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
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
                            icon: Image.asset(
                                'assets/images/icon_notifications.png'),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ),
                Container(
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
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackShape: CustomTracker(),
                    thumbColor: Colors.white,
                    overlayColor: Colors.white.withAlpha(32),
                    trackHeight: 8,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.black,
                    valueIndicatorTextStyle: TextStyle(
                      fontFamily: CustomFonts.helvetica65,
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    label: _getLabelText(),
                    min: 0,
                    max: 10,
                    divisions: 4,
                    value: _value,
                    onChanged: (value) {
                      print(value);
                      setState(
                        () {
                          _value = value;
                        },
                      );
                    },
                  ),
                ),
                //Indicator(indicatorValue: _value)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
