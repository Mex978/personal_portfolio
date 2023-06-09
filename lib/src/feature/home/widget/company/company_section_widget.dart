import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/company_model.dart';
import 'package:personal_portfolio/src/core/widget/section_separator_widget.dart';

import 'company_list_widget.dart';
import 'skeleton_companies_loader_widget.dart';

class CompanySectionWidget extends StatelessWidget {
  const CompanySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('companies').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SkeletonCompaniesLoaderWidget();
        }

        if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active) {
          final data = snapshot.data?.docs;

          if (data == null || data.isEmpty) {
            return Container();
          }

          final companies = data.map((e) => CompanyModel.fromDoc(e)).toList();
          if (companies.isNotEmpty) {
            companies.first.selected = true;
          }

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

        return Container();
      },
    );
  }
}
