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
            margin: const EdgeInsets.only(left: 2),
            width: 100,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(
              3,
              (index) => Container(
                width: 120,
                height: 40,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: 200,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 12),
          Container(
            width: 160,
            height: 10,
            color: Colors.white,
          ),
          ...List.generate(
            4,
            (index) => Container(
              margin: const EdgeInsets.only(top: 12),
              width: 500,
              height: 14,
              color: Colors.white,
            ),
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
