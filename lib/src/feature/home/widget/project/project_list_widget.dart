import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/project_model.dart';
import 'package:personal_portfolio/src/feature/home/widget/project/project_item_widget.dart';

class ProjectListWidget extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectListWidget({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = context.percentWidth(.003).truncate();

    return StaggeredGrid.count(
      crossAxisCount: max(crossAxisCount, 1),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: projects.map<Widget>(ProjectItemWidget.new).toList(),
    );
  }
}
