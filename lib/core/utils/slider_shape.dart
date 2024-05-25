import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';

//track shape
class GradientRectRangeSliderTrackShape extends RangeSliderTrackShape {
  const GradientRectRangeSliderTrackShape({
    this.gradient = const LinearGradient(
      colors: [
        AppColors.green,
        AppColors.yellow,
        AppColors.mainOrange,
        AppColors.red,
      ],
    ),
    this.darkenInactive = true,
  });

  final LinearGradient gradient;
  final bool darkenInactive;

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    assert(sliderTheme.overlayShape != null, 'sliderTheme.overlayShape is required');
    assert(sliderTheme.trackHeight != null, 'sliderTheme.trackHeight is required');

    final double overlayWidth = sliderTheme.overlayShape!.getPreferredSize(isEnabled, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight!;
    assert(overlayWidth >= 0);
    assert(trackHeight >= 0);

    final double trackLeft = offset.dx + overlayWidth / 2;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackRight = trackLeft + parentBox.size.width - overlayWidth;
    final double trackBottom = trackTop + trackHeight;
    return Rect.fromLTRB(math.min(trackLeft, trackRight), trackTop, math.max(trackLeft, trackRight), trackBottom);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset startThumbCenter,
    required Offset endThumbCenter,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null, 'sliderTheme.disabledActiveTrackColor is required');
    assert(sliderTheme.disabledInactiveTrackColor != null, 'sliderTheme.disabledInactiveTrackColor is required');
    assert(sliderTheme.activeTrackColor != null, 'sliderTheme.activeTrackColor is required');
    assert(sliderTheme.inactiveTrackColor != null, 'sliderTheme.inactiveTrackColor is required');
    assert(sliderTheme.rangeThumbShape != null, 'sliderTheme.rangeThumbShape iss required');
    assert(
        sliderTheme.trackHeight != null && sliderTheme.trackHeight! > 0,
        'sliderTheme.trackHeight != null and sliderTheme.trackHeight! > 0'
        'are required');

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final ColorTween activeTrackColorTween = ColorTween(
      begin: sliderTheme.disabledActiveTrackColor,
      end: sliderTheme.activeTrackColor,
    );
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
            begin: sliderTheme.disabledInactiveTrackColor,
            end: sliderTheme.inactiveTrackColor,
          )
        : activeTrackColorTween;
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    final Offset leftThumbOffset;
    final Offset rightThumbOffset;
    switch (textDirection) {
      case TextDirection.ltr:
        leftThumbOffset = startThumbCenter;
        rightThumbOffset = endThumbCenter;
        break;
      case TextDirection.rtl:
        leftThumbOffset = endThumbCenter;
        rightThumbOffset = startThumbCenter;
        break;
    }
    final Size thumbSize = sliderTheme.rangeThumbShape!.getPreferredSize(isEnabled, isDiscrete);
    final double thumbRadius = thumbSize.width / 2;
    assert(thumbRadius > 0);

    final Radius trackRadius = Radius.circular(trackRect.height / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        trackRect.top,
        leftThumbOffset.dx,
        trackRect.bottom,
        topLeft: trackRadius,
        bottomLeft: trackRadius,
      ),
      inactivePaint,
    );
    context.canvas.drawRect(
      Rect.fromLTRB(
        leftThumbOffset.dx,
        trackRect.top - (additionalActiveTrackHeight / 2),
        rightThumbOffset.dx,
        trackRect.bottom + (additionalActiveTrackHeight / 2),
      ),
      activePaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        rightThumbOffset.dx,
        trackRect.top,
        trackRect.right,
        trackRect.bottom,
        topRight: trackRadius,
        bottomRight: trackRadius,
      ),
      inactivePaint,
    );
  }
}

//thumb shape
class CustomRangeSliderThumbShape extends RangeSliderThumbShape {
  final double thumbRadius;

  CustomRangeSliderThumbShape({
    this.thumbRadius = 12.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      bool isDiscrete = false,
      bool isEnabled = false,
      bool isOnTop = false,
      TextDirection textDirection = TextDirection.ltr,
      required SliderThemeData sliderTheme,
      Thumb thumb = Thumb.start,
      bool isPressed = false}) {
    final Canvas canvas = context.canvas;

    // Paint shadow if needed here
    final Paint greyPaint = Paint()
      ..color = AppColors.grey5
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius, greyPaint);
    // Paint an outer white circle
    final Paint whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius * 0.85, whitePaint);

    // Create an orange-yellow linear gradient
    const Gradient gradient = AppColors.mainGradient;

    // Paint the inner circle with the gradient
    final Paint gradientPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(
          center: center,
          radius: thumbRadius * 0.55,
        ),
      )
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius * 0.55, gradientPaint);
  }
}
