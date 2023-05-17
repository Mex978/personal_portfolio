import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/model/company_model.dart';
import 'package:personal_portfolio/src/core/resource/animations/scale_curve_animation.dart';
import 'package:personal_portfolio/src/feature/home/widget/company/company_details_widget.dart';
import 'package:personal_portfolio/src/feature/home/widget/company/company_item_widget.dart';

class CompanyListWidget extends StatefulWidget {
  final List<CompanyModel> companies;

  const CompanyListWidget({super.key, required this.companies});

  @override
  State<CompanyListWidget> createState() => _CompanyListWidgetState();
}

class _CompanyListWidgetState extends State<CompanyListWidget> {
  @override
  void initState() {
    widget.companies.first.selected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCompany = widget.companies.firstWhere(
      (company) => company.selected,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: widget.companies
              .map(
                (company) => CompanyItemWidget(
                  company,
                  onPressed: changeSelectedItem,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 40),
        Builder(builder: (context) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            reverseDuration: const Duration(milliseconds: 100),
            transitionBuilder: (child, animation) {
              final newAnimation = scaleCurveSequence.animate(animation);

              return FadeTransition(
                opacity: newAnimation,
                child: ScaleTransition(
                  scale: newAnimation,
                  child: child,
                ),
              );
            },
            child: CompanyDetailsWidget(
              key: ValueKey(selectedCompany.id),
              company: selectedCompany,
            ),
          );
        }),
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
