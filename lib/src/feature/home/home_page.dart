import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/action_model.dart';
import 'package:personal_portfolio/src/core/model/contact_model.dart';
import 'package:personal_portfolio/src/core/resource/images/images.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widget/app_bar_widget.dart';
import 'widget/company/company_section_widget.dart';
import 'widget/contact/contact_section_widget.dart';
import 'widget/project/project_section_widget.dart';
import 'widget/resume/resume_section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();

  List<Widget> children = [];
  List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
    children = getChildren(context);

    return Scaffold(
      appBar: AppBarWidget(
        actions: getActions(),
      ),
      body: ScrollablePositionedList.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 24,
        ),
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
        itemScrollController: itemScrollController,
        scrollOffsetController: scrollOffsetController,
        itemPositionsListener: itemPositionsListener,
        scrollOffsetListener: scrollOffsetListener,
      ),
    );
  }

  List<Widget> getChildren(BuildContext context) {
    return [
      const ResumeSectionWidget(),
      const CompanySectionWidget(),
      const ProjectSectionWidget(),
      ContactSectionWidget(
        contacts: getContacts(context),
      ),
    ];
  }

  List<ActionModel> getActions() {
    return [
      ActionModel(
        label: 'Resume',
        onPressed: () => itemScrollController.scrollTo(
          index: 0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),
      ActionModel(
        label: 'Projects',
        onPressed: () => itemScrollController.scrollTo(
          index: 2,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),
      ActionModel(
        label: 'Contact',
        onPressed: () => itemScrollController.scrollTo(
          index: 3,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),
    ];
  }

  List<ContactModel> getContacts(BuildContext context) {
    return [
      ContactModel(
        name: 'Github',
        url: 'https://github.com/Mex978',
        icon: Image.asset(
          Images.github,
          color: context.colorScheme.primary,
        ),
      ),
      ContactModel(
        name: 'LinkedIn',
        url: 'https://www.linkedin.com/in/maxlima1/',
        icon: Image.asset(
          Images.linkedin,
          fit: BoxFit.fitHeight,
          color: context.colorScheme.primary,
        ),
      ),
      ContactModel(
        name: 'Send an email',
        url: 'mailto:max.lima2@gmail.com',
        icon: const Icon(Icons.email),
      ),
    ];
  }
}
