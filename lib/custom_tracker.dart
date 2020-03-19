import 'dart:math';

import 'package:flutter/material.dart';

class CustomTracker extends SliderTrackShape {
  @override
  Rect getPreferredRect({
    RenderBox parentBox,
    Offset offset = Offset.zero,
    SliderThemeData sliderTheme,
    bool isEnabled,
    bool isDiscrete,
  }) {
    final double thumbWidth =
        sliderTheme.thumbShape.getPreferredSize(true, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight;
    assert(thumbWidth >= 0);
    assert(trackHeight >= 0);
    assert(parentBox.size.width >= thumbWidth);
    assert(parentBox.size.height >= trackHeight);

    final double trackLeft =
        parentBox.size.width * 0.20; //offset.dx + thumbWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width * 0.60;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    Animation<double> enableAnimation,
    TextDirection textDirection,
    Offset thumbCenter,
    bool isDiscrete,
    bool isEnabled,
  }) {
    if (sliderTheme.trackHeight == 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Gradient gradient = LinearGradient(
      colors: <Color>[
        Colors.lightGreen.withOpacity(1.0),
//        Colors.greenAccent.withOpacity(1.0),
        Colors.yellow.withOpacity(1.0),
        Colors.orange.withOpacity(1.0),
        Colors.red.withOpacity(1.0),
        // Colors.pink.withOpacity(1.0),
        Colors.purple.withOpacity(1.0),
        Colors.blue.shade700.withOpacity(1.0),
      ],
      stops: [
        0.25,
        //0.25,
        0.4,
        0.45,
        0.55,
        //0.55,
        0.70,
        0.75,
      ],
    );

    Rect rect = Rect.fromPoints(Offset(0.0, -parentBox.size.height),
        Offset(parentBox.size.width, parentBox.size.height));

    final Paint fillPaint = Paint()
      ..shader = gradient.createShader(rect)
      //..color = Colors.greenAccent
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final pathSegment = Path()
      ..moveTo(trackRect.left, trackRect.top)
      ..lineTo(trackRect.right, trackRect.top)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect.right + 7, trackRect.top),
            Offset(trackRect.right - 7, trackRect.bottom),
          ),
          -pi / 2,
          pi,
          false)
      ..lineTo(trackRect.left, trackRect.bottom)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect.left + 7, trackRect.top),
            Offset(trackRect.left - 7, trackRect.bottom),
          ),
          -pi * 3 / 2,
          pi,
          false);

    context.canvas.drawPath(pathSegment, fillPaint);
    context.canvas.drawPath(pathSegment, borderPaint);
  }
}
