import 'package:flutter/material.dart';


class CommentForm extends StatelessWidget {
      final String currentDropDownValue;
      final String? currentComment;
      final TextEditingController commentInputController;
      final void Function(String) changeCurrentDropDownValue;
      final TextEditingController dayInputController;
     final BuildContext context;
  const CommentForm({
    super.key,
    required this.currentDropDownValue,
    this.currentComment,
    required this.commentInputController,
    required this.changeCurrentDropDownValue,
    required this.dayInputController,
    required this.context
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            children: [
              dropDownItems(currentDropDownValue, changeCurrentDropDownValue),
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
          border: Border.all(width: 1, color: Theme.of(context).colorScheme.tertiary),
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

  DropdownMenuItem<String> _dropDownMenuItems(String itemValue, IconData icon, String text){
    return DropdownMenuItem<String>(

      value: itemValue,
      child:Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text, style: Theme.of(context).textTheme.displayMedium),
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



  Widget saveButton(String? commentField){
    bool buttonIsDisabled =  (commentField == '' || commentField == null);
    return TextButton(
        onPressed: buttonIsDisabled ? null : (){},
        child: Container(
          height: 50,
          decoration: BoxDecoration(

              color: buttonIsDisabled ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.save, color: Theme.of(context).colorScheme.onPrimary),
              Text('Сохранить', style: TextStyle(color:Theme.of(context).colorScheme.onPrimary))
            ],
          ),
        )
    );
  }
}
