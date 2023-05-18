import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/main_app.dart';
import 'package:personal_portfolio/src/core/model/action_model.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final List<ActionModel> actions;

  const AppBarWidget({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('infos').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  final data = snapshot.data?.docs;

                  if (data == null || data.isEmpty) {
                    return Container();
                  }

                  String? imageUrl;

                  if (data.any((element) => element.id == 'imageUrl')) {
                    imageUrl = data.firstWhere((element) => element.id == 'imageUrl').data()['data'];
                  }

                  if (imageUrl != null) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    );
                  }
                }

                return Container();
              },
            ),
            const Spacer(),
            ...actions.map(
              (action) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton(
                  onPressed: action.onPressed,
                  child: Text(action.label),
                ),
              ),
            ),
            IconButton(
              onPressed: appController.changeThemeMode,
              icon: const Icon(Icons.sunny),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => const SizedBox.shrink();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
