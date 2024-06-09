import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/features/home_page/ui/drawer_for_homepage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text("Welcome"),
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        drawer: MyDrawer(user: user),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                  leading: const Icon(Icons.local_fire_department),
                  subtitle: const Text('от заявки до подключения'),
                  title: const Text('Лиды'),
                  onTap: () => Get.toNamed('/secondPage')),
              const ListTile(
                  leading: Icon(Icons.handshake),
                  subtitle: Text('их анкеты'),
                  title: Text('Партнеры')),
              const ListTile(
                  leading: Icon(Icons.support),
                  subtitle: Text('заявки от клиентов'),
                  title: Text('Поддержка')),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.tertiary,
                ))),
                padding: const EdgeInsets.only(top: 25),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text('Время билда: 04.04.2024 - 18:00:39'),
                ),
              )
            ],
          ),
        ));
  }
}
