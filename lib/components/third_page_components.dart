
import 'package:flutter/material.dart';



Widget personDetails(){
  return Container(
    padding: const EdgeInsets.only(left: 20, top: 15),
    child:  Column(
      children: [
        info_row(Icons.person, 'Габиден'),
        info_row(Icons.phone_rounded, '776420344'),
        info_row(Icons.water_drop, 'Водоматы'),
        info_row(Icons.numbers, '2 шт'),
        info_row(Icons.numbers, 'sv051319'),
      ]
    ),
  );
}

Widget info_row(IconData icon, String text){
  return  Row(
    children: [
      Icon(icon),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(text, style: const TextStyle(fontSize: 15)),
      )
    ]
  );
}

Widget contactIcons(){
  return Container(
    decoration:const BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Colors.grey,
          width: 1
        ),
          bottom:BorderSide(
            color: Colors.grey,
            width: 1
          )
      )
    ),
    padding:const  EdgeInsets.only(top: 30, bottom: 30),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          singleContactIcon(Icons.phone),
          singleContactIcon(Icons.message),
        ],
      ),
    ),
  );
}
Widget singleContactIcon(IconData _icon){
  return Container(
    decoration: const BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle
    ),
    padding: const EdgeInsets.all(5),
    child: IconButton(
      onPressed: (){},
      icon: Icon(_icon, size: 30),
      color: Colors.white,

    ),
  );
}




Widget commentForms(
    String currentDropDownValue,
    String? currentComment,
    TextEditingController commentInputController,
    void Function(String) changeCurrentValue,
    TextEditingController dayInputController
){


  return Container(
    margin:const  EdgeInsets.symmetric(horizontal: 20),
       child: Column(
        children: [
          dropDownItems(currentDropDownValue, changeCurrentValue),
          ((currentDropDownValue == 'three' || currentDropDownValue == "five") ?
             selectNumberOfDaysField(dayInputController) : Container()),

          formForComment(commentInputController),
           saveButton(currentComment)
        ]
       )
  );
}

Widget selectNumberOfDaysField(TextEditingController dayInputController){

  return Container(
     margin: const EdgeInsets.symmetric(vertical:10),

     child:TextFormField(
       controller: dayInputController,
       initialValue: null,
         keyboardType: TextInputType.number,
         decoration:  InputDecoration(
            border:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
             labelText: 'Через сколько перезвонить?',
          suffixText: 'дней'
         ),

       ),
   );
}



Widget dropDownItems( String currentValue, void Function(String) changeCurrentValue){
  return Container(
     height: 50,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.grey),
      borderRadius: BorderRadius.circular(15)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Center(
      child: DropdownButton(
        underline: Container(),
        borderRadius: BorderRadius.circular(12),
        isExpanded: true,
        value: currentValue,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue){
               changeCurrentValue(newValue!);
          },
        items: [
           _dropDownMenuItems('one', Icons.celebration, 'Новая заявка'),
           _dropDownMenuItems('two', Icons.restart_alt, 'Добьем позже'),
           _dropDownMenuItems('three', Icons.access_time_filled, 'Ожидаем анкету'),
           _dropDownMenuItems('four', Icons.email_rounded, 'Получили анкету'),
           _dropDownMenuItems('five', Icons.access_time_filled,'Ожидаем Kaspi'),
           _dropDownMenuItems('six', Icons.link,'Kaspi подключен'),
           _dropDownMenuItems('seven', Icons.stop_circle, 'Отказ'),
           _dropDownMenuItems('eight', Icons.done, 'Подключен'),
          ],
      ),
    ),
  );
}

DropdownMenuItem<String> _dropDownMenuItems(String _value, IconData icon, String text){
  return DropdownMenuItem<String>(

      value: _value,
      child:Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text, style: const TextStyle(fontSize: 15)),
          )
            ],
          ),
      );

}



Widget formForComment(TextEditingController commentInputController){

  return Container(
    margin: const EdgeInsets.symmetric(vertical:10),

    child:TextFormField(
      maxLines: 2,
      controller: commentInputController,
      decoration:  InputDecoration(
          border:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Комментарий'

      ),

    ),
  );
}



Widget saveButton(String? comment_field){
  bool buttonIsDisabled =  (comment_field == '' || comment_field == null);
  return TextButton(
      onPressed: buttonIsDisabled ? null : (){},
      child: Container(
        height: 50,
        decoration: BoxDecoration(

          color: buttonIsDisabled ? Colors.grey.shade500 : Colors.blue,
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Icon(Icons.save, color: Colors.white),
           Text('Сохранить', style: TextStyle(color: Colors.white))
         ],
        ),
      )
  );
}





