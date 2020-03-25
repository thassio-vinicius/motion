import 'package:flutter/material.dart';
import 'package:motion/utils/fonts.dart';
import 'package:motion/widgets/home_widgets/slider/custom_tracker.dart';

class HumorSlider extends StatefulWidget {
  @override
  _HumorSliderState createState() => _HumorSliderState();
}

class _HumorSliderState extends State<HumorSlider> {
  double _value = 0.2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackShape: CustomTracker(),
          thumbColor: Colors.white,
          overlayColor: Colors.white.withAlpha(32),
          trackHeight: 8,
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
          disabledActiveTickMarkColor: Colors.transparent,
          disabledInactiveTickMarkColor: Colors.transparent,
          tickMarkShape: RoundSliderTickMarkShape(),
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
          onChanged: (value) => setState(() => _value = value),
        ),
      ),
    );
  }

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
}
