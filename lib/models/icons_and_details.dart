import 'package:flutter/material.dart';

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
    child: Icon(Icons.email),
    backgroundColor: Colors.green,
  ),
  CircleAvatar(
    child: Icon(Icons.timer),
    backgroundColor: Colors.grey,
  ),
  CircleAvatar(
    child: Icon(Icons.link),
    backgroundColor: Colors.green,
  ),
  CircleAvatar(
    child: Icon(Icons.close),
    backgroundColor: Colors.red,
  ),
  CircleAvatar(
    child: Icon(Icons.done),
    backgroundColor: Colors.green,
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
