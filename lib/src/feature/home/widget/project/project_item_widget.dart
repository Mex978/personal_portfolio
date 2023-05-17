import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/project_model.dart';

class ProjectItemWidget extends StatelessWidget {
  final ProjectModel project;

  const ProjectItemWidget(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              project.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            project.name,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            project.description,
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.outline),
          ),
          const SizedBox(height: 8),
          Text(
            project.technologies.join(' - '),
            style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.tertiary),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
