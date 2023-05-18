import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/widget/section_separator_widget.dart';

class ResumeSectionWidget extends StatelessWidget {
  const ResumeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('infos').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active) {
          final data = snapshot.data?.docs;

          if (data == null || data.isEmpty) {
            return Container();
          }

          Map<String, dynamic> myInfo = {};

          if (data.any((element) => element.id == 'resume')) {
            myInfo['resume'] = data.firstWhere((element) => element.id == 'resume').data()['data'];
          }

          if (data.any((element) => element.id == 'name')) {
            myInfo['name'] = data.firstWhere((element) => element.id == 'name').data()['data'];
          }

          final String? name = myInfo['name'];
          final String? resume = myInfo['resume'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (name?.isNotEmpty ?? false) ...[
                Text(
                  'Hi, I\'m',
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  name!,
                  style: context.textTheme.displayLarge?.copyWith(fontFamily: 'GTWalsheimPro'),
                ),
              ],
              if (resume?.isNotEmpty ?? false) ...[
                const SizedBox(height: 24),
                Text(
                  resume!,
                  style: context.textTheme.bodyLarge,
                ),
              ],
              const SectionSeparatorWidget(),
            ],
          );
        }

        return Container();
      },
    );
  }
}
