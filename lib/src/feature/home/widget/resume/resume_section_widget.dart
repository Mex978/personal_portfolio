import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/widget/section_separator_widget.dart';

class ResumeSectionWidget extends StatelessWidget {
  const ResumeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I\'m',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Max Nícolas',
          style: context.textTheme.displayLarge?.copyWith(fontFamily: 'GTWalsheimPro'),
        ),
        const SizedBox(height: 24),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam convallis nibh eu pellentesque ornare. Vestibulum nec euismod est. Aliquam eget bibendum dui. Fusce ut elit in tortor lacinia ultricies et id lacus. Donec blandit, purus nec ornare volutpat, ipsum tortor viverra nisl, eget bibendum tellus lorem ac ex. Nam ut ullamcorper neque. Morbi leo nisl, consequat non neque id, dictum lobortis nisi. Quisque blandit eleifend ullamcorper. Pellentesque cursus consequat leo non rhoncus. Morbi sed quam id massa posuere faucibus quis non purus.",
          style: context.textTheme.bodyLarge,
        ),
        const SectionSeparatorWidget(),
      ],
    );
  }
}
