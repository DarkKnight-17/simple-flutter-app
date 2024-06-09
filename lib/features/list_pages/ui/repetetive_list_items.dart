import 'package:flutter/material.dart';

class RepetetiveListItems extends StatelessWidget {
  final String name;
  final String detail;
  final Widget leadingIcon;
  final void Function() onTap;
  const RepetetiveListItems(
      {super.key,
      required this.detail,
      required this.leadingIcon,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: onTap,
          leading: leadingIcon,
          trailing: const Icon(Icons.arrow_right),
          title: Text(name),
          subtitle: Text(detail),
        );
      },
    );
  }
}
