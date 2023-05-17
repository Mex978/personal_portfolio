import 'dart:math';

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
  final scrollController = ScrollController();

  @override
  void initState() {
    widget.companies.first.selected = true;

    super.initState();
  }

  bool hasMoreToScroll = true;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCompany = widget.companies.firstWhere(
      (company) => company.selected,
    );

    // print('hasMoreToScroll: $hasMoreToScroll');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 40,
          child: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                ShaderMask(
                  shaderCallback: (Rect rect) {
                    if (!hasMoreToScroll) {
                      return const LinearGradient(colors: [
                        Colors.transparent,
                        Colors.transparent,
                      ]).createShader(rect);
                    }

                    return const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.transparent, Colors.white],
                      stops: [0.6, 1.0],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: NotificationListener<ScrollUpdateNotification>(
                    onNotification: (notification) {
                      final maxScrollOffset = scrollController.position.maxScrollExtent;
                      final currentScrollOffset = scrollController.offset;

                      final hasMoreToScroll = currentScrollOffset < maxScrollOffset;

                      if (this.hasMoreToScroll != hasMoreToScroll) {
                        setState(() {
                          this.hasMoreToScroll = hasMoreToScroll;
                        });
                      }

                      //How many pixels scrolled from pervious frame
                      // print(notification.scrollDelta);

                      //List scroll position
                      // print(notification.metrics.pixels);

                      // // print('scrollController.offset: ${scrollController.offset}');
                      // print(
                      //     'scrollController.scrollController.position.maxScrollExtent: ${scrollController.position.maxScrollExtent}');

                      return true;
                    },
                    child: ListView(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      children: widget.companies
                          .map(
                            (company) => CompanyItemWidget(
                              company,
                              onPressed: changeSelectedItem,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                if (hasMoreToScroll)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      child: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        scrollController.animateTo(
                          min(
                            scrollController.offset + (constraints.maxWidth / 2),
                            scrollController.position.maxScrollExtent,
                          ),
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  )
              ],
            );
          }),
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
