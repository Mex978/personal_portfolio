import 'package:flutter/material.dart';
import 'package:personal_portfolio/main_app.dart';

const profileImageUrl =
    'https://i0.wp.com/64.media.tumblr.com/8d8dc207e53d8bc4b686866b83a628a8/e2526685b5e6d296-17/s1280x1920/d85fda3e70629e9d3e4c5efd5243bfb6789ab4a7.jpg?resize=800%2C450&ssl=1';

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
            const CircleAvatar(
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            // const Text('MN'),
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

class ActionModel {
  final String label;
  final Function() onPressed;

  ActionModel({
    required this.label,
    required this.onPressed,
  });
}
