import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'application_list.dart';
import 'ui/repetetive_list_items.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Badge(
            label: Text(
              '3',
            ),
            child: Icon(Icons.email, size: 40),
          ),
          // padding: EdgeInsets.all(),
        ),
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          actions: [
            IconButton(
                onPressed: () {
                  Get.dialog(Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 150,
                      horizontal: 50.0,
                    ),
                    child: Column(
                      children: [
                        CheckboxListTile(
                            // title: Text(),
                            value: false,
                            onChanged: (newValue) {})
                      ],
                    ),
                  ));
                },
                icon: Icon(Icons.filter_list)),
            IconButton(
                onPressed: () {
                  Get.toNamed('/applicationFormPage');
                },
                icon: const Icon(
                  Icons.add,
                ))
          ],
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
            ApplicationList(),
            RepetetiveListItems(
                name: 'Габиден',
                detail: "Новая заявка",
                leadingIcon: const CircleAvatar(
                  child: Icon(Icons.whatshot),
                ),
                onTap: () {
                  Get.toNamed('/thirdPage');
                }),
            RepetetiveListItems(
                name: 'Габиден',
                detail: 'Отказ',
                leadingIcon: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.close),
                ),
                onTap: () {
                  Get.toNamed('/thirdPage');
                }),
          ],
        ),
      ),
    );
  }
}
