import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/helpers/extensions.dart';
import 'package:personal_portfolio/src/core/model/contact_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSectionWidget extends StatelessWidget {
  final List<ContactModel> contacts;

  const ContactSectionWidget({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
