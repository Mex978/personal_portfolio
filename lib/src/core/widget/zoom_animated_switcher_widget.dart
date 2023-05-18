import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/resource/animations/scale_curve_animation.dart';

class ZoomAnimatedSwitcherWidget extends StatelessWidget {
  final Widget child;

  final Duration duration;
  final Duration? reverseDuration;

  const ZoomAnimatedSwitcherWidget({
    super.key,
    required this.child,
    required this.duration,
    this.reverseDuration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: reverseDuration ?? duration,
      transitionBuilder: (child, animation) {
        final newAnimation = scaleCurveSequence.animate(animation);

        return FadeTransition(
          opacity: newAnimation,
          child: ScaleTransition(
            scale: newAnimation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
