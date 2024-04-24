
import 'package:flutter/material.dart';


class PersonDetails extends StatelessWidget {
  final BuildContext context;
  const PersonDetails({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 15),
      child:  Column(
          children: [
            infoRow(Icons.person, 'Габиден'),
            infoRow(Icons.phone_rounded, '776420344'),
            infoRow(Icons.water_drop, 'Водоматы'),
            infoRow(Icons.numbers, '2 шт'),
            infoRow(Icons.numbers, 'sv051319'),
          ]
      ),
    );
  }


  Widget infoRow(IconData icon, String text){
    return  Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text, style: Theme.of(context).textTheme.displayMedium),
          )
        ]
    );
  }
}
