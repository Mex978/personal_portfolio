import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';

class AnimatedTextButton extends StatefulWidget {
  final String label;
  final Widget icon;
  final Function()? onPressed;
  final double width;
  final double height;

  const AnimatedTextButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.width = 200,
    this.height = 50,
  });

  @override
  State<AnimatedTextButton> createState() => _AnimatedTextButtonState();
}

class _AnimatedTextButtonState extends State<AnimatedTextButton> {
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
