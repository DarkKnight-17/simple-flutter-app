import 'package:flutter/material.dart';

import 'ui/comment_form.dart';
import 'ui/contact_icons.dart';
import 'ui/person_details.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: ListView(
          children: const [
            PersonDetails(),
            ContactIcons(),
            CommentForm(),
          ],
        ));
  }
}
