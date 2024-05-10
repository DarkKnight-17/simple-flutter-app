import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/common/components/navigation_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text("Welcome"),
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavigationListItem(
                  descriptiveIcon: Icons.local_fire_department,
                  subTitle: 'от заявки до подключения',
                  title: 'Лиды',
                  onTap: () => Get.toNamed('/secondPage')),
              const NavigationListItem(
                  descriptiveIcon: Icons.handshake,
                  subTitle: 'их анкеты',
                  title: 'Партнеры'),
              const NavigationListItem(
                  descriptiveIcon: Icons.support,
                  subTitle: 'заявки от клиентов',
                  title: 'Поддержка'),
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
