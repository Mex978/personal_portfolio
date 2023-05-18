import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/project_model.dart';
import 'package:personal_portfolio/src/core/widget/section_separator_widget.dart';

import 'project_list_widget.dart';
import 'skeleton_projects_loader_widget.dart';

class ProjectSectionWidget extends StatelessWidget {
  const ProjectSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('projects').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SkeletonProjectsLoaderWidget();
        }

        if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active) {
          final data = snapshot.data?.docs;

          if (data == null || data.isEmpty) {
            return Container();
          }

          final projects = data.map((e) => ProjectModel.fromDoc(e)).toList();

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

        return Container();
      },
    );
  }
}
