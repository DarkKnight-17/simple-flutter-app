import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/random_list_items.dart';
import '../components/repetetive_list_items.dart';

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
              color:  Theme.of(context).floatingActionButtonTheme.backgroundColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Stack(
                children: [
                  const Icon(Icons.email_rounded, size: 45),
                  Container(
                    margin:const EdgeInsets.only(left: 23),
                    padding: const EdgeInsets.all(5),
                    decoration:  BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle
                    ),
                    child:  Text('3', style:Theme.of(context).textTheme.displaySmall),
                  )
                ],
              )

            ),
          ),
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            bottom: TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/fire.png',
                            width: 20,
                          ),
                          const SizedBox(width: 5),
                          Text('В работе', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary))
                        ]
                    ),
                  ),Tab(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/sandClock.png',
                            width: 20,
                          ),
                          const SizedBox(width: 5),
                          Text('Ожидание', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary))
                        ]
                    ),

                  ),Tab(
                         child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           Image.asset(
                            'images/thumbs_down.png',
                          width: 20,
                         ),
                              const SizedBox(width: 5),
                              Text('Отказы',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary))
                        ]
                        ),

                    ),

                ]
            ),
          ),
          body: TabBarView(
                children: [
                 RandomListItems(
                     name: 'Габиден',
                     detailsList: detailsList,
                     iconsList: iconsList,
                   onTap:(){
                     context.push('/thirdPage');
                     }
                 ),
               RepetetiveListItems(
                     name: 'Габиден',
                     detail: "Новая заявка",
                     descriptiveIcon: 'images/blue_fire.png',
                   onTap:(){
                     context.push('/thirdPage');
                   }
                 ),
                 RepetetiveListItems(
                     name: 'Габиден',
                     detail:  'Отказ',
                     descriptiveIcon: 'images/rejection.png',
                   onTap:(){
                     context.push('/thirdPage');
                   }
                 ),
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