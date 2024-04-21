

import 'dart:math';

import 'package:flutter/material.dart';

import '../pages/third_page.dart';

Widget customRow(String title, String detail, IconData _icon){
  return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 50,
            child: Center(
              child: Icon(_icon),
            )
        ),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16)),
                  Text(detail, style: const TextStyle(fontSize: 16))
                ]
            )
        ),
        const  SizedBox(
            width: 50,
            child: Center(
              child:Icon(Icons.arrow_circle_right_outlined),
            )
        )
      ]
  );
}

Widget randomListItems(String name, List<String> detailsList, List<String> iconsList, BuildContext context){

   return ListView.builder(
      itemBuilder: (context, index) {

    var ind = Random().nextInt(detailsList.length);

         return GestureDetector(
           onTap: () {
             Navigator.of(context).push(
                 MaterialPageRoute(
                     builder: (context) =>  ThirdPage()
                 )
             );
           },
           child: Padding(
             padding: const EdgeInsets.only(top: 10.0),
             child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Padding(
                       padding: const EdgeInsets.all(15),
                       child: Center(
                         child: Image.asset(
                             iconsList[ind],
                           width: 30,
                         ),
                       )
                   ),
                   Expanded(
                       child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(name, style: const TextStyle(fontSize: 16)),
                             Text("${detailsList[ind]} | Только что", style: const TextStyle(fontSize: 16))
                           ]
                       )
                   ),
                   const  SizedBox(
                       width: 50,
                       child: Center(
                         child:Icon(Icons.arrow_circle_right_outlined),
                       )
                   )
                 ]
             ),
           ),
         );
      }
  );
}


Widget repetetiveItems(String name, String detail, String icon_source, BuildContext context){
  return ListView.builder(
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap:() {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>  ThirdPage()
              )
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 50,
                    child: Center(
                      child: Image.asset(
                          icon_source,
                         width: 30,
                      ),
                    )
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name, style: const TextStyle(fontSize: 16)),
                          Text("$detail | Только что", style: const TextStyle(fontSize: 16))
                        ]
                    )
                ),
                const  SizedBox(
                    width: 50,
                    child: Center(
                      child:Icon(Icons.arrow_circle_right_outlined),
                    )
                )
              ]
          ),
        ),
      );
    },
  );

}