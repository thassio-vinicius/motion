import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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
    final ByteData data =
        await rootBundle.load('assets/images/indicator_shape.png');
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
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: SliderTheme(
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
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 25,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Monte sua playlist para relaxar',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: CustomFonts.helvetica65,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 35,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withAlpha(130),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))),
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Image.asset(
                                    'assets/images/icon_search.png'),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: TextField(
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      labelText:
                                          'Escolha a música perfeita para meditação',
                                      labelStyle: TextStyle(
                                        fontFamily: CustomFonts.helvetica65,
                                        color: Colors.white.withAlpha(150),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildWeekDay(context, day: 'Dom'),
                      _buildWeekDay(context, day: 'Seg'),
                      _buildWeekDay(context, day: 'Ter'),
                      _buildWeekDay(context, day: 'Qua'),
                      _buildWeekDay(context, day: 'Qui'),
                      _buildWeekDay(context, day: 'Sex'),
                      _buildWeekDay(context, day: 'Sáb'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeekDay(
    BuildContext context, {
    String day,
  }) {
    bool isToday = false;

    initializeDateFormatting("pt_BR", null).then((_) {
      print('DIA:' + day.toLowerCase());
      print(DateFormat.E('pt_BR').format(DateTime.now()));

      DateTime date = DateTime.now().subtract(Duration(hours: 3));

      if (day.toLowerCase() == DateFormat.E('pt_BR').format(date)) {
        setState(() {
          isToday = true;
        });
      }
    });

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.width * 0.20,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.white),
              right: BorderSide(color: Colors.white),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              day,
              style: TextStyle(
                fontSize: 11,
                fontFamily: CustomFonts.helvetica65,
                color: Colors.white.withAlpha(180),
              ),
            ),
          ),
        ),
        if (isToday)
          Container(
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(132),
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                '25-33min',
                style: TextStyle(
                  fontFamily: CustomFonts.helvetica65,
                  fontSize: 9,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
      ],
    );
  }
}
