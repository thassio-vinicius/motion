import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion/widgets/home_widgets/greetings_stack.dart';
import 'package:motion/widgets/home_widgets/header.dart';
import 'package:motion/widgets/home_widgets/playlists_gridview.dart';
import 'package:motion/widgets/home_widgets/searchbox.dart';
import 'package:motion/widgets/home_widgets/slider/humor_slider.dart';
import 'package:motion/widgets/home_widgets/week_row.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              children: <Widget>[
                Header(),
                GreetingsStack(),
                HumorSlider(),
                SearchBox(),
                WeekRow(),
                PlaylistsGridview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
