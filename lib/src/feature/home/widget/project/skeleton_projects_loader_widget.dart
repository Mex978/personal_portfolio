import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/widget/section_separator_widget.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class SkeletonProjectsLoaderWidget extends StatelessWidget {
  const SkeletonProjectsLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 180,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 40),
          Container(
            width: 280,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: 160,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: 280,
            height: 14,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          Container(
            width: 270,
            height: 14,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          Container(
            width: 260,
            height: 14,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          Container(
            width: 275,
            height: 14,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: 160,
            height: 10,
            color: Colors.white,
          ),
          const SectionSeparatorWidget(),
        ],
      ),
      items: 1,
      period: const Duration(seconds: 2),
      highlightColor: context.colorScheme.primary,
      direction: SkeletonDirection.ltr,
    );
  }
}
