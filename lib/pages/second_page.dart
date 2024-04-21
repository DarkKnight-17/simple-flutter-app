import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/custom_rows.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: IconButton(
            onPressed: (){},
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
              color: Colors.pinkAccent.shade100,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Stack(
                children: [
                  const Icon(Icons.email_rounded, size: 45),
                  Container(
                    margin:const EdgeInsets.only(left: 23),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle
                    ),
                    child: const Text('3', style:TextStyle(color: Colors.white, fontSize: 14)),
                  )
                ],
              )

            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            bottom: TabBar(
                tabs: [
                  Tab(
                    child: Row(
                        children: [
                          Image.asset(
                            'images/fire.png',
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text('В работе', style: TextStyle(color: Colors.white),)
                        ]
                    ),
                  ),Tab(
                      child:Row(
                        children: [
                          Image.asset(
                            'images/sandClock.png',
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text('Ожидание', style: TextStyle(color: Colors.white))
                        ]
                    ),

                  ),Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Image.asset(
                            'images/thumbs_down.png',
                          width: 20,
                         ),
                              const SizedBox(width: 10),
                              const Text('Отказы',style: TextStyle(color: Colors.white))
                        ]
                        ),
                      ),
                    ),

                ]
            ),
          ),
          body: TabBarView(
                children: [
                 randomListItems('Габиден', detailsList, iconsList, context),
                 repetetiveItems('Габиден',  "Новая заявка", 'images/blue_fire.png' , context),
                 repetetiveItems('Габиден', 'Отказ', 'images/rejection.png',context),
             ],
            ),
        ),
    );
  }
}


List<String> detailsList = [
  'Проконсультировать',
  'Отправить в Kaspi',
  'Проверить в Kaspi',
  'Зарегистрировать',
  'Погрустить',
  'Подключен',
  'Напомнить о нас',
  'Ждем анкету',
];
List<String> iconsList = [
  'images/blue_fire.png',
  'images/message.png',
  'images/timer.png',
  'images/register.png',
  'images/rejection.png',
  'images/done_mark.png',
  'images/timer.png',
  'images/timer.png',
];