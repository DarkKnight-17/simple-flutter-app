import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_flutter_app/controllers/comment_form_controller.dart';

class CommentForm extends StatelessWidget {
  final CommentFormController controller;
  const CommentForm({
    super.key,
    required this.controller,
  });

  // List<String> commentsNotRequiredList = ['four', 'six', 'eight'];
  // List<String> commentsRequiredList = ['two', 'seven'];

  // List<String> dropDownWaitingOptions = ['three', 'five'];
  // void Function()? onPressed;
  // Color? saveButtonBackgroundColor;

  @override
  Widget build(BuildContext context) {
    // if (controller.currentDropDownValue.value == 'one') {
    //   controller.errorTextForComment.value = '';
    //   onPressed = null;
    //   saveButtonBackgroundColor = Colors.grey[500];
    // } else if (commentsRequiredList
    //     .contains(controller.currentDropDownValue.value)) {
    //   if (controller.currentComment.value.isEmpty) {
    //     controller.errorTextForComment.value = 'Коментарий обязателен';
    //     onPressed = null;
    //     saveButtonBackgroundColor = Colors.grey[500];
    //   } else {
    //     onPressed = () {};
    //     saveButtonBackgroundColor = Colors.blue;
    //     controller.errorTextForComment.value = '';
    //   }
    // } else if (commentsNotRequiredList
    //     .contains(controller.currentDropDownValue.value)) {
    //   controller.errorTextForComment.value = '';
    //   onPressed = () {};
    //   saveButtonBackgroundColor = Colors.blue;
    // } else if (dropDownWaitingOptions
    //     .contains(controller.currentDropDownValue.value)) {
    //   controller.errorTextForComment.value = '';

    //   if (controller.currentOptionalNumberOfDays.value.isEmpty) {
    //     controller.errorTextForNumberOfDays.value = 'Нужно больше нуля';
    //     onPressed = null;
    //     saveButtonBackgroundColor = Colors.grey[500];
    //   } else {
    //     controller.errorTextForNumberOfDays.value = '';
    //     onPressed = () {};
    //     saveButtonBackgroundColor = Colors.blue;
    //   }
    // }

    return Obx(
      () => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            dropDownItems(context),
            ((controller.currentDropDownValue.value == 'three' ||
                    controller.currentDropDownValue.value == "five")
                ? selectNumberOfDaysField()
                : Container()),
            formForComment(),
            saveButton()
          ])),
    );
  }

  Widget selectNumberOfDaysField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: controller.currentOptionalNumberOfDays.value,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          controller.currentOptionalNumberOfDays.value = value;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Через сколько перезвонить?',
            suffixText: 'дней'),
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
          value: controller.currentDropDownValue.value,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) {
            controller.currentDropDownValue.value = newValue!;
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
          // style: Theme.of(context).textTheme.displayMedium
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
          controller.currentComment.value = newValue;
          if (newValue == '') {
            controller.errorTextForComment.value = 'Коментарий обязателен';
            controller.saveButtonBackgroundColor.value = Colors.grey[500];
          } else {
            controller.errorTextForComment.value = '';
            controller.saveButtonBackgroundColor.value = Colors.blue;
          }
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Комментарий',
          errorText: controller.errorTextForComment.value.isEmpty
              ? null
              : controller.errorTextForComment.value,
        ),
      ),
    );
  }

  Widget saveButton() {
    return ElevatedButton(
      onPressed: (controller.currentComment.value == '') ? null : () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: controller.saveButtonBackgroundColor.value,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          minimumSize: const Size(100, 60)),
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
