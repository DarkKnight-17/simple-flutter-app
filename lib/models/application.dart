import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Application {
  final String id;
  final String companyName;
  final String personFullName;
  final String phoneNumber;
  final String companyIdentityNumber;
  final String companyAddress;
  final String kaspiPayAccount;
  final String email;
  final int amountOfMachines;
  final int monthlyIncome;
  final List types;
  final DateTime datetime;

  const Application({
    required this.id,
    required this.companyName,
    required this.amountOfMachines,
    required this.email,
    required this.monthlyIncome,
    required this.kaspiPayAccount,
    required this.types,
    required this.personFullName,
    required this.phoneNumber,
    required this.companyIdentityNumber,
    required this.companyAddress,
    required this.datetime,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    Timestamp timestamp = json['timestamp'];
    return Application(
      id: json['id'],
      companyName: json['companyName'],
      amountOfMachines: json['amountOfMachines'],
      email: json['email'],
      monthlyIncome: json['monthlyIncome'],
      phoneNumber: json['phoneNumber'],
      kaspiPayAccount: json['kaspiPayAccount'],
      types: json['types'],
      personFullName: json['personFullName'],
      companyIdentityNumber: json['companyIdentityNumber'],
      companyAddress: json['companyAddress'],
      datetime: DateTime.parse(timestamp.toDate().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personFullName': personFullName,
      'companyIdentityNumber': companyIdentityNumber,
      'companyAddress': companyAddress,
      'types': types as Map<String, dynamic>,
      'kaspiPayAccount': kaspiPayAccount,
      'phoneNumber': phoneNumber,
      'amountOfMachines': amountOfMachines,
      'email': email,
      'companyName': companyName,
      'monthlyIncome': monthlyIncome,
      'timestamp': datetime,
    };
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
