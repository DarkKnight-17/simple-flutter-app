import 'package:flutter/material.dart';

class PersonDetails extends StatelessWidget {
  const PersonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 15),
      child: const Column(children: [
        // infoRow(Icons.person, 'Габиден'),
        ListTile(
          title: Text('Габиден'),
          leading: Icon(Icons.person),
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        ListTile(
          leading: Icon(Icons.phone_rounded),
          title: Text('776420344'),
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('Водоматы'),
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        ListTile(
          leading: Icon(Icons.numbers),
          title: Text('2 шт'),
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        ListTile(
          leading: Icon(Icons.numbers),
          title: Text('sv051319'),
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
      ]),
    );
  }
}
