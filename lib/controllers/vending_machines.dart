import 'package:get/get.dart';
import 'package:my_flutter_app/models/icons_and_details.dart';

class ApplicationFormController extends GetxController {
  List<Map<String, RxBool>> vendingMachines = [
    {'Водоматы': false.obs},
    {'Снэк-аппараты': false.obs},
    {'Кофемашины': false.obs},
    {'Массажные кресла': false.obs},
    {'Игровые аппараты': false.obs},
    {'Силомеры': false.obs},
    {'Автомойки самообслуживания': false.obs},
    {'Аппараты мороженного': false.obs},
    {'Соковыжималки': false.obs},
    {'Ландроматы': false.obs},
    {'Другое': false.obs},
  ];

  RxList<Application> applications = [
    Application(personName: 'Габиден'),
    Application(personName: 'Руслан'),
    Application(personName: 'Азамат')
  ].obs;
}
