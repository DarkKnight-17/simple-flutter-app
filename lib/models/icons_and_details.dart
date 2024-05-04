import 'package:flutter/material.dart';

class Application {
  final String personName;
  final DateTime applicationTime = DateTime.now();
  Application({required this.personName});
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
const List<Widget> iconsList = [
  CircleAvatar(
    child: Icon(Icons.whatshot),
  ),
  CircleAvatar(
    backgroundColor: Colors.green,
    child: Icon(Icons.email),
  ),
  CircleAvatar(
    backgroundColor: Colors.grey,
    child: Icon(Icons.timer),
  ),
  CircleAvatar(
    backgroundColor: Colors.green,
    child: Icon(Icons.link),
  ),
  CircleAvatar(
    backgroundColor: Colors.red,
    child: Icon(Icons.close),
  ),
  CircleAvatar(
    backgroundColor: Colors.green,
    child: Icon(Icons.done),
  ),
  CircleAvatar(
    backgroundColor: Colors.grey,
    child: Icon(Icons.timer),
  ),
  CircleAvatar(
    backgroundColor: Colors.grey,
    child: Icon(Icons.timer),
  ),
];
