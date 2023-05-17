import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';

class SectionSeparatorWidget extends StatelessWidget {
  const SectionSeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60, bottom: 60),
      height: 1,
      color: context.colorScheme.outline,
      width: double.infinity,
    );
  }
}
