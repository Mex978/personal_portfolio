import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/company_model.dart';

class CompanyDetailsWidget extends StatelessWidget {
  final CompanyModel company;

  const CompanyDetailsWidget({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                company.roleName,
                style: context.textTheme.titleMedium,
              ),
            ),
            Text(
              company.formattedStartDate,
              style: context.textTheme.titleSmall,
            ),
            Text(
              ' - ',
              style: context.textTheme.titleSmall,
            ),
            Text(
              company.formattedEndDate,
              style: context.textTheme.titleSmall,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '${company.name} / ${company.local}',
          style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.tertiary),
        ),
        ...company.descriptions.map(
          (description) => Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              '- $description',
              style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.outline),
            ),
          ),
        ),
      ],
    );
  }
}
