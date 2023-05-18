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
        Text(
          company.roleName,
          style: context.textTheme.titleMedium,
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
