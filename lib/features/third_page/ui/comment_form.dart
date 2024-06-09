import 'package:flutter/material.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({super.key});

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  String? currentComment;
  String currentDropDownValue = 'one';
  String currentOptionalNumberOfDays = '2';
  bool buttonIsDisabled = true;
  String? errorTextForComment;
  String? errorTextForNumberOfDays;
  Color? saveButtonBackgroundColor = Colors.grey[500];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          dropDownItems(context),
          ((currentDropDownValue == 'three' || currentDropDownValue == "five")
              ? selectNumberOfDaysField()
              : Container()),
          formForComment(),
          saveButton()
        ]));
  }

  Widget selectNumberOfDaysField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: currentOptionalNumberOfDays,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            currentOptionalNumberOfDays = value;
            if (value.isEmpty) {
              errorTextForNumberOfDays = "Это поле обязательное";
            } else if (int.parse(value) < 1) {
              errorTextForNumberOfDays = "Число должно быть больше одного";
            }
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Через сколько перезвонить?',
            suffixText: 'дней',
            errorText: errorTextForNumberOfDays),
      ),
    );
  }

  Widget dropDownItems(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.tertiary),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: DropdownButton(
          underline: Container(),
          borderRadius: BorderRadius.circular(12),
          isExpanded: true,
          value: currentDropDownValue,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) {
            setState(() {
              currentDropDownValue = newValue!;
            });
          },
          items: [
            _dropDownMenuItems('one', '🎉 Новая заявка'),
            _dropDownMenuItems('two', '🔁 Добьем позже'),
            _dropDownMenuItems('three', '⏳ Ожидаем анкету'),
            _dropDownMenuItems('four', '📨 Получили анкету'),
            _dropDownMenuItems('five', '⏳ Ожидаем Kaspi'),
            _dropDownMenuItems('six', '🔗 Kaspi подключен'),
            _dropDownMenuItems('seven', '⛔ Отказ'),
            _dropDownMenuItems('eight', '✅ Подключен'),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> _dropDownMenuItems(String itemValue, String text) {
    return DropdownMenuItem<String>(
      value: itemValue,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
        ),
      ),
    );
  }

  Widget formForComment() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        maxLines: 2,
        onChanged: (newValue) {
          setState(() {
            currentComment = newValue;
            if (newValue == '') {
              errorTextForComment = 'Коментарий обязателен';
              saveButtonBackgroundColor = Colors.grey[500];
            } else {
              errorTextForComment = null;
              saveButtonBackgroundColor = Colors.blue;
            }
          });
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Комментарий',
          errorText: errorTextForComment,
        ),
      ),
    );
  }

  Widget saveButton() {
    return ElevatedButton(
      onPressed: currentComment == '' ? null : () {},
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.save),
        SizedBox(
          width: 10,
        ),
        Text('Сохранить')
      ]),
    );
  }
}
