import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/company_model.dart';

class CompanyItemWidget extends StatelessWidget {
  final CompanyModel company;
  final ValueChanged<String> onPressed;

  const CompanyItemWidget(this.company, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      height: 50,
      child: FilledButton.tonal(
        style: FilledButton.styleFrom(
          elevation: 0,
          backgroundColor: company.selected ? context.colorScheme.inversePrimary : Colors.transparent,
        ),
        child: Text(company.name),
        onPressed: () => onPressed(company.id),
      ),
    );
  }
}
