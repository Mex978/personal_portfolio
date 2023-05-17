import 'package:flutter/material.dart';

final List<TweenSequenceItem<double>> fastOutExtraSlowInTweenSequenceItems = <TweenSequenceItem<double>>[
  TweenSequenceItem<double>(
    tween: Tween<double>(begin: 0.0, end: 0.4).chain(CurveTween(curve: const Cubic(0.05, 0.0, 0.133333, 0.06))),
    weight: 0.166666,
  ),
  TweenSequenceItem<double>(
    tween: Tween<double>(begin: 0.4, end: 1.0).chain(CurveTween(curve: const Cubic(0.208333, 0.82, 0.25, 1.0))),
    weight: 1.0 - 0.166666,
  ),
];

TweenSequence<double> scaleCurveSequence = TweenSequence<double>(fastOutExtraSlowInTweenSequenceItems);
