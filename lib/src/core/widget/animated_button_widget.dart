import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';

class AnimatedButton2 extends StatefulWidget {
  final String label;
  final Function()? onPressed;
  final double width;
  final double height;

  const AnimatedButton2({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 200,
    this.height = 50,
  });

  @override
  State<AnimatedButton2> createState() => _AnimatedButton2State();
}

class _AnimatedButton2State extends State<AnimatedButton2> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: widget.onPressed,
      text: widget.label,
      animatedOn: AnimatedOn.onHover,
      backgroundColor: Colors.transparent,
      width: widget.width,
      selectedBackgroundColor: context.colorScheme.onPrimaryContainer,
      selectedTextColor: context.colorScheme.onPrimary,
      borderColor: context.colorScheme.onPrimaryContainer,
      textStyle: TextStyle(
        color: context.colorScheme.onPrimaryContainer,
        fontSize: 16,
      ),
    );
  }
}
