import 'package:flutter/material.dart';
import 'package:personal_portfolio/main_app.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/widget/animated_button_widget.dart';
import 'package:personal_portfolio/src/feature/home/widget/project_list_widget.dart';

import 'widget/companies_list_widget.dart';

const profileImageUrl =
    'https://i0.wp.com/64.media.tumblr.com/8d8dc207e53d8bc4b686866b83a628a8/e2526685b5e6d296-17/s1280x1920/d85fda3e70629e9d3e4c5efd5243bfb6789ab4a7.jpg?resize=800%2C450&ssl=1';

String randomImageUrl(int id) => 'https://picsum.photos/id/$id/400/400';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Gradient gradient;
  late List<ProjectItem> projects;

  final companies = List.generate(
    6,
    (index) => CompanyItem(
      id: index,
      name: 'Company',
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
      (index) => ProjectItem(
        // imageUrl: randomImageUrl(Random().nextInt(200)),
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/0579/79a3/eaa0af7a583db16ee5c302012b3df718?Expires=1685318400&Signature=Txe0mG-LqJCFFy7IgI4xuM3doJx5fTQkQ0PhHZPfC0Qh2xGBEPCSF4OUZVGcV6Kps0jy9f511T90OvqAjuCPmwnETKZZ9BNufVxXfSwiJ0O14R6Qdjmx-YfTjaGopWcOs~xMW~pBtnmJvxVWQIHIxV-huwGrhWOvqxg69x6CsiosR-MqYBJ75sd7F5t3CYlUV8FumoAjTiPpLKM-aGdGZ3eOzVGj0K11215SJtdXbn0l7iqFFMNN-lBK8w8c2ixwqAvQgW4vfp1Cap3Ng74CPEM2~BmlqLQaOBIvUoO7uMbewEg-n~lu4U-5tcbciIdf0ewFhhHK-ghY5hXV398X8Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
        name: 'Project number $index',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(width: 16),
              const CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              // const Text('MN'),
              const Spacer(),
              const Text('Projects'),
              const SizedBox(width: 16),
              const Text('Resume'),
              const SizedBox(width: 16),
              const Text('Contact'),
              const SizedBox(width: 16),
              IconButton(
                onPressed: appController.changeThemeMode,
                icon: const Icon(Icons.sunny),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.percentWidth(.1), vertical: 24),
          child: Column(
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
                "I'm a software engineer based in Toronto, Canada and also a communication and journalism student. I enjoy creating things that live on the internet, whether that be websites, applications, or anything in between. I have been freelancing for a year now while studying at the university and I've manage to gain a decent amount of experience and valuable knowledge from all different kinds of fields throughout my projects/work.",
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: 60),
              AnimatedButton2(
                label: 'Hire me ->',
                onPressed: () {},
              ),
              const SizedBox(height: 60),
              Text(
                "EXPERIENCE",
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              CompaniesListWidget(companies: companies),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 100),
                height: 1,
                color: context.colorScheme.outline,
                width: double.infinity,
              ),
              Text(
                "FEATURED PROJECTS",
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: 40),
              ProjectListWidget(projects: projects),
            ],
          ),
        ),
      ),
    );
  }
}
