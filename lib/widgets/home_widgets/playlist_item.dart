import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion/utils/fonts.dart';

class PlaylistItem extends StatelessWidget {
  PlaylistItem(
      {@required this.image,
      @required this.title,
      @required this.containsDescription,
      @required this.duration,
      this.description});

  final String image;
  final String description;
  final String title;
  final bool containsDescription;
  final String duration;
  final EdgeInsetsGeometry _padding = EdgeInsets.only(left: 8);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: containsDescription
          ? MediaQuery.of(context).size.height * 0.25
          : MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: Colors.white.withAlpha(130),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
              flex: 5,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              )),
          Flexible(
            flex: 2,
            child: Container(
              alignment:
                  containsDescription ? Alignment.centerLeft : Alignment.center,
              padding: _padding,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: CustomFonts.helvetica65,
                ),
              ),
            ),
          ),
          if (containsDescription)
            Flexible(
              flex: 2,
              child: Container(
                padding: _padding,
                alignment: Alignment.centerLeft,
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withAlpha(175),
                    fontSize: 9,
                    fontFamily: CustomFonts.helvetica65,
                  ),
                ),
              ),
            ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 8, bottom: 8),
              alignment: containsDescription
                  ? Alignment.bottomLeft
                  : Alignment.bottomCenter,
              child: Text(
                duration,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: CustomFonts.helvetica65,
                  fontSize: 9,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
