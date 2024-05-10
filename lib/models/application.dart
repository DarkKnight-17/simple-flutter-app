import 'package:flutter/material.dart';

class Application {
  final String companyName;
  final String personFullName;
  final String phoneNumber;
  final String companyIdentityNumber;
  final String companyAddress;
  final String kaspiPayAccount;
  final String email;
  final int amountOfMachines;
  final int monthlyIncome;
  final List<String> types;
  final DateTime date;

  const Application({
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
    required this.date,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      companyName: json['companyName'],
      amountOfMachines: json['amountOfMachines'],
      email: json['email'],
      monthlyIncome: json['monthlyIncome'],
      phoneNumber: json['phoneNumber'],
      kaspiPayAccount: json['kaspiPayAccount'],
      types: json['types'] as List<String>,
      personFullName: json['personFullName'],
      companyIdentityNumber: json['companyIdentityNumber'],
      companyAddress: json['companyAddress'],
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
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
      'date': date.toIso8601String(),
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
