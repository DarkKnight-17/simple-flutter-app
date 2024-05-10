import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/controllers/applications_controller.dart';

import '../common/components/application_list.dart';
import '../common/components/repetetive_list_items.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final controller = Get.put(ApplicationsController());

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
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/applicationFormPage');
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
          ],
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
            const ApplicationList(),
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
