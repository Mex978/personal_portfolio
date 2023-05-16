import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';

class ProjectListWidget extends StatelessWidget {
  final List<ProjectItem> projects;

  const ProjectListWidget({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: projects.map<Widget>(ProjectItemBuilder.new).toList(),
    );
  }
}

class ProjectItemBuilder extends StatelessWidget {
  final ProjectItem project;

  const ProjectItemBuilder(this.project, {super.key});

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
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat',
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.outline),
          ),
          const SizedBox(height: 8),
          Text(
            'React - Bootstrap - Styled Components',
            style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.tertiary),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class ProjectItem {
  final String imageUrl;
  final String name;

  ProjectItem({
    required this.imageUrl,
    required this.name,
  });
}
