import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class RepetetiveListItems extends StatelessWidget {
  final String name;
  final String detail;
  final String descriptiveIcon;
final void Function() onTap;
  const RepetetiveListItems({
    super.key,
    required this.detail,
    required this.descriptiveIcon,
    required this.name,
    required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: onTap,
          leading: Image.asset(descriptiveIcon),
          trailing: const Icon(Icons.arrow_right),
          title: Text(name),
          subtitle: Text(detail),
        );



      },
    );
  }
}
