import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/company_model.dart';
import 'package:personal_portfolio/src/core/widget/section_separator_widget.dart';

import 'company_list_widget.dart';

class CompanySectionWidget extends StatelessWidget {
  final List<CompanyModel> companies;

  const CompanySectionWidget({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "EXPERIENCE",
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        CompanyListWidget(companies: companies),
        const SectionSeparatorWidget(),
      ],
    );
  }
}
