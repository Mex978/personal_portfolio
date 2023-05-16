import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';

class CompaniesListWidget extends StatefulWidget {
  final List<CompanyItem> companies;

  const CompaniesListWidget({super.key, required this.companies});

  @override
  State<CompaniesListWidget> createState() => _CompaniesListWidgetState();
}

class _CompaniesListWidgetState extends State<CompaniesListWidget> {
  @override
  void initState() {
    widget.companies.first.selected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: widget.companies
              .map(
                (company) => Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 16),
                    height: 50,
                    child: FilledButton.tonal(
                      style: FilledButton.styleFrom(
                        backgroundColor: company.selected ? context.colorScheme.onPrimary : Colors.transparent,
                      ),
                      child: Text(company.name),
                      onPressed: () => changeSelectedItem(company.id),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 40),
        Text(
          'Frontend Engineer (Remote)',
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Text(
          'Company Name / US - New York',
          style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.tertiary),
        ),
        const SizedBox(height: 12),
        Text(
          '- Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
          style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.outline),
        ),
        const SizedBox(height: 12),
        Text(
          '- Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
          style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.outline),
        ),
      ],
    );
  }

  void changeSelectedItem(int id) {
    for (var company in widget.companies) {
      company.selected = company.id == id;
    }
    setState(() {});
  }
}

class CompanyItem {
  final int id;
  String name;
  bool selected;

  CompanyItem({
    required this.id,
    required this.name,
    this.selected = false,
  });
}
