import 'package:flutter/material.dart';
import 'package:motion/fontes.dart';

class Indicator extends StatefulWidget {
  final double indicatorValue;

  Indicator({@required this.indicatorValue});

  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset('assets/images/indicator_shape.png'),
          Positioned(
            top: 17,
            left: 15,
            child: Text(
              _getLabelText(),
              style: TextStyle(
                fontFamily: CustomFonts.helvetica65,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  _getLabelText() {
    if (widget.indicatorValue >= 0 && widget.indicatorValue <= 2) {
      return 'Feliz';
    } else if (widget.indicatorValue > 2 && widget.indicatorValue <= 4) {
      return 'Animado';
    } else if (widget.indicatorValue > 4 && widget.indicatorValue <= 6) {
      return 'Neutro';
    } else if (widget.indicatorValue > 6 && widget.indicatorValue <= 8) {
      return 'Entediado';
    } else if (widget.indicatorValue > 8 && widget.indicatorValue <= 10) {
      return 'Triste';
    }
  }
}
