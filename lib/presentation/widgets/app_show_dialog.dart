import 'package:flutter/material.dart';

class AppShowDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;
  const AppShowDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentTextStyle: Theme.of(context).textTheme.headline2,
      titleTextStyle: Theme.of(context).textTheme.headline1,
      icon: const Icon(Icons.close),
      title: Text(title),
      actions: actions,
      content: Text(content),
    );
  }
}
