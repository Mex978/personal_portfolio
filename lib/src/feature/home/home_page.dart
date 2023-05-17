import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/action_model.dart';
import 'package:personal_portfolio/src/core/model/company_model.dart';
import 'package:personal_portfolio/src/core/model/contact_model.dart';
import 'package:personal_portfolio/src/core/model/project_model.dart';
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

  late List<ProjectModel> projects;
  List<Widget> children = [];
  List<ContactModel> contacts = [];

  final companies = List.generate(
    10,
    (index) => CompanyModel(
      id: index,
      name: 'Company $index',
      descriptions: List.generate(
        4,
        (innerIndex) => 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. $index $innerIndex',
      ),
      local: LocalModel(
        city: 'Teresina',
        state: 'PI',
      ),
      roleName: 'Frontend Engineer (Remote)',
      date: DateTime.now(),
    ),
  );

  @override
  void initState() {
    projects = List.generate(
      5,
      (index) => ProjectModel(
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/0579/79a3/eaa0af7a583db16ee5c302012b3df718?Expires=1685318400&Signature=Txe0mG-LqJCFFy7IgI4xuM3doJx5fTQkQ0PhHZPfC0Qh2xGBEPCSF4OUZVGcV6Kps0jy9f511T90OvqAjuCPmwnETKZZ9BNufVxXfSwiJ0O14R6Qdjmx-YfTjaGopWcOs~xMW~pBtnmJvxVWQIHIxV-huwGrhWOvqxg69x6CsiosR-MqYBJ75sd7F5t3CYlUV8FumoAjTiPpLKM-aGdGZ3eOzVGj0K11215SJtdXbn0l7iqFFMNN-lBK8w8c2ixwqAvQgW4vfp1Cap3Ng74CPEM2~BmlqLQaOBIvUoO7uMbewEg-n~lu4U-5tcbciIdf0ewFhhHK-ghY5hXV398X8Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
        name: 'Project number $index',
        description:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat',
        technologies: [
          'React',
          'Bootstrap',
          'Styled Components',
        ],
      ),
    );

    super.initState();
  }

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
      CompanySectionWidget(
        companies: companies,
      ),
      ProjectSectionWidget(
        projects: projects,
      ),
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
