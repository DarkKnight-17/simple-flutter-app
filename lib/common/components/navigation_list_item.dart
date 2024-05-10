
import 'package:flutter/material.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData descriptiveIcon;
  final void Function()? onTap;

  const NavigationListItem({
    super.key,
    required this.descriptiveIcon,
    required this.subTitle,
    required this.title,
    this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(descriptiveIcon),
      trailing: const Icon(Icons.arrow_right),
      title: Text(title),
        subtitle: Text(subTitle),
    );
  }
}
