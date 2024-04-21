import 'package:flutter/material.dart';

import '../components/custom_rows.dart';
import 'second_page.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});


   void toSecondPage(BuildContext context){
     Navigator.of(context).push(
       MaterialPageRoute(
         builder: (context) => const SecondPage()
       )
     );


   }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,

      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap:() => toSecondPage(context),
           child: customRow('Лиды', 'от заявки до подключения', Icons.local_fire_department),
          ),
         const SizedBox(height: 15),
          customRow('Партнеры', 'их анкеты', Icons.handshake),
         const SizedBox(height: 15),
         customRow('Поддержка', 'заявки от клиентов', Icons.support),
         const SizedBox(height: 40),
        Container(
          decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.grey,
            )
          )
          ),
        padding: const EdgeInsets.only(top: 25),
          child: const Align(
            alignment: Alignment.topCenter,
            child: Text('Время билда: 04.04.2024 - 18:00:39'),
          ),
        )
        ],
      ),
      )
    );
  }
}
