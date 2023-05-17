import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/project_model.dart';
import 'package:personal_portfolio/src/core/widget/section_separator_widget.dart';

import 'project_list_widget.dart';

class ProjectSectionWidget extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectSectionWidget({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FEATURED PROJECTS",
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 40),
        ProjectListWidget(projects: projects),
        const SectionSeparatorWidget(),
      ],
    );
  }
}
