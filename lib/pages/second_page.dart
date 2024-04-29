import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/models/icons_and_details.dart';

import '../components/random_list_items.dart';
import '../components/repetetive_list_items.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          foregroundColor:
              Theme.of(context).floatingActionButtonTheme.foregroundColor,
          onPressed: () {},
          backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
          child: Badge(
            backgroundColor: Colors.green,
            offset: const Offset(-1, 2),
            label: Text(
              '3',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            child: const Icon(Icons.email, size: 40),
          ),
          // padding: EdgeInsets.all(),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          bottom: TabBar(tabs: [
            Tab(
                child: Text('🔥 В работе',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary))),
            Tab(
                child: Text('⌛ Ожидание',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary))),
            Tab(
                child: Text('👎 Отказы',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary))),
          ]),
        ),
        body: TabBarView(
          children: [
            RandomListItems(
                name: 'Габиден',
                detailsList: detailsList,
                iconsList: iconsList,
                onTap: () {
                  context.push('/thirdPage');
                }),
            RepetetiveListItems(
                name: 'Габиден',
                detail: "Новая заявка",
                leadingIcon: const CircleAvatar(
                  child: Icon(Icons.whatshot),
                ),
                onTap: () {
                  context.push('/thirdPage');
                }),
            RepetetiveListItems(
                name: 'Габиден',
                detail: 'Отказ',
                leadingIcon: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.close),
                ),
                onTap: () {
                  context.push('/thirdPage');
                }),
          ],
        ),
      ),
    );
  }
}
