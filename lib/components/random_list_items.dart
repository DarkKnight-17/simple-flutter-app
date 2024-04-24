import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/third_page.dart';

class RandomListItems extends StatelessWidget{
  final String name;
  final List<String> iconsList;
  final List<String> detailsList;
  final void Function() onTap;
  const RandomListItems({
    super.key,
    required this.detailsList,
    required this.iconsList,
    required this.name,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemBuilder: (context, index) {
          var ind = Random().nextInt(detailsList.length);
          return ListTile(
            onTap: onTap,
            leading: Image.asset(iconsList[ind], width: 40),
            trailing: const Icon(Icons.arrow_right),
            title: Text(name),
            subtitle: Text(detailsList[ind]),
          );

        }
    );
  }
}