import 'package:flutter/material.dart';

class ContactIcons extends StatelessWidget {
  const ContactIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary, width: 1),
              bottom: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary, width: 1))),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(
                Icons.phone,
                size: 30,
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.message, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
