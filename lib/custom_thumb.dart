import 'dart:ui' as UI;

import 'package:flutter/material.dart';

class CustomThumb extends SliderComponentShape {
  final double thumbRadius;
  final UI.Image image;

  const CustomThumb({
    this.thumbRadius = 6.0,
    this.image,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) async {
    final Canvas canvas = context.canvas;

    /*
    final rect = Rect.fromCircle(center: center, radius: thumbRadius);

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left - 1, rect.top),
        Offset(rect.right + 1, rect.bottom),
      ),
      Radius.circular(thumbRadius - 2),
    );

     */

    final fillPaint = Paint()
      ..color = sliderTheme.activeTrackColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.8
      ..style = PaintingStyle.stroke;

    //var image = await loadUiImage('assets/images/icon_thumb.png');

    //canvas.drawRRect(rrect, fillPaint);
    //canvas.drawRRect(rrect, borderPaint);
    canvas.drawImage(image, center, fillPaint);
    canvas.drawImage(image, center, borderPaint);
  }
}
