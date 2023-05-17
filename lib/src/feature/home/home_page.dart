// import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/company_model.dart';
import 'package:personal_portfolio/src/core/model/contact_model.dart';
import 'package:personal_portfolio/src/core/model/project_model.dart';
import 'package:personal_portfolio/src/core/resource/images/images.dart';
import 'package:personal_portfolio/src/feature/home/widget/project/project_list_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'widget/app_bar_widget.dart';
import 'widget/company/company_list_widget.dart';

String randomImageUrl(int id) => 'https://picsum.photos/id/$id/400/400';

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

  late Gradient gradient;
  late List<ProjectModel> projects;
  List<Widget> children = [];
  List<ContactModel> contacts = [];

  final companies = List.generate(
    6,
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
    gradient = const LinearGradient(
      colors: [
        Color(0xff9845E8),
        Color(0xff33D2FF),
        Color(0xffDD5789),
      ],
      stops: [0.02, 0.4, 1.2],
    );
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
    contacts = getContacts(context);

    return Scaffold(
      appBar: AppBarWidget(
        actions: [
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
        ],
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
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, I\'m',
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Max Nícolas',
            style: context.textTheme.displayLarge?.copyWith(fontFamily: 'GTWalsheimPro'),
          ),
          const SizedBox(height: 24),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam convallis nibh eu pellentesque ornare. Vestibulum nec euismod est. Aliquam eget bibendum dui. Fusce ut elit in tortor lacinia ultricies et id lacus. Donec blandit, purus nec ornare volutpat, ipsum tortor viverra nisl, eget bibendum tellus lorem ac ex. Nam ut ullamcorper neque. Morbi leo nisl, consequat non neque id, dictum lobortis nisi. Quisque blandit eleifend ullamcorper. Pellentesque cursus consequat leo non rhoncus. Morbi sed quam id massa posuere faucibus quis non purus.",
            style: context.textTheme.bodyLarge,
          ),
          const SizedBox(height: 60),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "EXPERIENCE",
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          CompanyListWidget(companies: companies),
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 60),
            height: 1,
            color: context.colorScheme.outline,
            width: double.infinity,
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "FEATURED PROJECTS",
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 40),
          ProjectListWidget(projects: projects),
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 60),
            height: 1,
            color: context.colorScheme.outline,
            width: double.infinity,
          ),
        ],
      ),
      Column(
        children: [
          Row(
            children: [
              Text(
                "CONTACT",
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(width: 60),
              Row(
                children: contacts
                    .map(
                      (contact) => Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 40,
                          child: OutlinedButton.icon(
                            label: Text(contact.name),
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: contact.icon,
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            onPressed: () async {
                              // js.context.callMethod('open', ['https://stackoverflow.com/questions/ask']);

                              if (await canLaunchUrlString(contact.url)) {
                                await launchUrlString(contact.url);
                              }
                            },
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          )
        ],
      )
    ];
  }

  List<ContactModel> getContacts(BuildContext context) {
    return [
      ContactModel(
        name: 'Send an email',
        url: 'mailto:max.lima2@gmail.com',
        icon: const Icon(Icons.email),
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
        name: 'Github',
        url: 'https://github.com/Mex978',
        icon: Image.asset(
          Images.github,
          color: context.colorScheme.primary,
        ),
      ),
    ];
  }
}
