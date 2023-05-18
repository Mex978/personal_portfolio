import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/model/company_model.dart';
import 'package:personal_portfolio/src/core/widget/zoom_animated_switcher_widget.dart';
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
    scrollController.addListener(scrollListener);
    super.initState();
  }

  bool hasMoreToScrollOnEnd = false;
  bool hasMoreToScrollOnStart = false;

  void scrollListener() {
    final maxScrollOffset = scrollController.position.maxScrollExtent;
    final currentScrollOffset = scrollController.offset;

    final hasMoreToScrollOnStart = currentScrollOffset > 15;
    final hasMoreToScrollOnEnd = currentScrollOffset < maxScrollOffset;

    if (this.hasMoreToScrollOnEnd != hasMoreToScrollOnEnd) {
      setState(() {
        this.hasMoreToScrollOnEnd = hasMoreToScrollOnEnd;
      });
    }

    if (this.hasMoreToScrollOnStart != hasMoreToScrollOnStart) {
      setState(() {
        this.hasMoreToScrollOnStart = hasMoreToScrollOnStart;
      });
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCompany = widget.companies.firstWhere(
      (company) => company.selected,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final maxScrollOffset = scrollController.position.maxScrollExtent;
      final currentScrollOffset = scrollController.offset;

      hasMoreToScrollOnStart = currentScrollOffset > 15;
      hasMoreToScrollOnEnd = currentScrollOffset < maxScrollOffset;
      setState(() {});
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 40,
          child: Stack(
            children: [
              ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (Rect rect) {
                  if (hasMoreToScrollOnStart) {
                    return const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.transparent, Colors.white],
                      stops: [0.8, 1.0],
                    ).createShader(rect);
                  }

                  return const LinearGradient(
                    colors: [Colors.transparent, Colors.transparent],
                    stops: [1.0, 1.0],
                  ).createShader(rect);
                },
                child: ShaderMask(
                  blendMode: BlendMode.dstOut,
                  shaderCallback: (Rect rect) {
                    if (hasMoreToScrollOnEnd) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.transparent, Colors.white],
                        stops: [0.8, 1.0],
                      ).createShader(rect);
                    }

                    return const LinearGradient(
                      colors: [Colors.transparent, Colors.transparent],
                      stops: [0.0, 0.0],
                    ).createShader(rect);
                  },
                  child: ListView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
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
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: ZoomAnimatedSwitcherWidget(
                  duration: const Duration(milliseconds: 100),
                  child: !hasMoreToScrollOnEnd
                      ? Container()
                      : FloatingActionButton(
                          shape: const CircleBorder(),
                          child: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            scrollController.animateTo(
                              math.min(
                                scrollController.offset + scrollController.position.viewportDimension,
                                scrollController.position.maxScrollExtent,
                              ),
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.ease,
                            );
                          },
                        ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: ZoomAnimatedSwitcherWidget(
                  duration: const Duration(milliseconds: 100),
                  child: !hasMoreToScrollOnStart
                      ? Container()
                      : FloatingActionButton(
                          shape: const CircleBorder(),
                          child: const Icon(Icons.arrow_back),
                          onPressed: () {
                            scrollController.animateTo(
                              math.max(
                                scrollController.offset - scrollController.position.viewportDimension,
                                0,
                              ),
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.ease,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Builder(builder: (context) {
          return ZoomAnimatedSwitcherWidget(
            duration: const Duration(milliseconds: 500),
            reverseDuration: const Duration(milliseconds: 100),
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
