import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_flutter_app/controllers/vending_machines.dart';
import 'package:my_flutter_app/models/icons_and_details.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ApplicationFormPage extends StatelessWidget {
  ApplicationFormPage({super.key});

  final controller = Get.put(ApplicationFormController());

  final form = FormGroup({
    'companyName': FormControl<String>(validators: [Validators.required]),
    'companyIdentityNumber': FormControl<String>(validators: [
      Validators.number(allowNegatives: false),
      Validators.required,
      Validators.minLength(12),
      Validators.maxLength(12),
      Validators.pattern(RegExp(r'^[0-9]+$'))
    ]),
    'phoneNumber': FormControl<String>(validators: [
      Validators.required,
      Validators.number(allowNegatives: false),
      Validators.minLength(11),
      Validators.maxLength(11),
      Validators.pattern(RegExp(r'^[0-9]+$'))
    ]),
    'kaspiPayAccount': FormControl<String>(validators: [Validators.required]),
    'companyAddress': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'personFullName': FormControl<String>(validators: [Validators.required]),
    'amountOfMachines': FormControl<int>(validators: [
      Validators.required,
      Validators.number(allowNegatives: false),
      Validators.pattern(RegExp(r'^[0-9]+$'))
    ]),
    'monthlyIncome': FormControl<int>(validators: [
      Validators.required,
      Validators.number(allowNegatives: false),
      Validators.pattern(RegExp(r'^[0-9]+$'))
    ]),
    'serialNumbers': FormControl<String>()
  });

  final checkboxes = FormGroup({
    'Водоматы': FormControl<bool>(),
    'Другое': FormControl<bool>(),
    'Снэк-аппараты': FormControl<bool>(),
    'Кофемашины': FormControl<bool>(),
    'Автомойки самообслуживания': FormControl<bool>(),
    'Массажные кресла': FormControl<bool>(),
    'Игровые аппараты': FormControl<bool>(),
    'Силомеры': FormControl<bool>(),
    'Аппараты мороженного': FormControl<bool>(),
    'Соковыжималки': FormControl<bool>(),
    'Ландроматы': FormControl<bool>(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[500],
          title: const Text('Kaspi Bank'),
          centerTitle: true,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ReactiveForm(
            formGroup: form,
            child: ListView(children: [
              const SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. Анкета будет отправлена в Kaspi Bank'),
                    Text.rich(TextSpan(children: [
                      TextSpan(text: '2. Анкета рассматривается '),
                      TextSpan(
                          text: 'банком',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      TextSpan(text: ' 1-2 рабочих дня'),
                    ])),
                    Text('3. После подключения мы свяжемся с Вами')
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                height: 20,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ReactiveTextField(
                  validationMessages: {
                    ValidationMessage.required: (_) => 'Это обязательное поле',
                  },
                  scrollPadding: const EdgeInsets.symmetric(vertical: 15),
                  formControlName: 'companyName',
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Наименование компании (ИП/TOO)',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    helperText: 'Образец: ИП Ахметов А.А',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ReactiveTextField(
                  formControlName: 'companyIdentityNumber',
                  validationMessages: {
                    ValidationMessage.required: (_) => 'Это обязательное поле',
                    ValidationMessage.minLength: (_) =>
                        'Данный номер не действителен',
                    ValidationMessage.maxLength: (_) =>
                        'Данный номер не действителен',
                    ValidationMessage.number: (_) =>
                        'Номер не может быть отрицательным',
                    ValidationMessage.pattern: (_) => 'Пишите только числами'
                  },
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('ИИН/БИН компании',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    helperText: 'Образец: 830519018300',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ReactiveTextField(
                  validationMessages: {
                    ValidationMessage.creditCard: (_) =>
                        'Данный номер счета не действителен',
                    ValidationMessage.required: (_) => 'Это обязательное поле'
                  },
                  formControlName: 'kaspiPayAccount',
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Номер счета на Kaspi Pay',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    helperText: 'На этот счет будут поступать деньги',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ReactiveTextField(
                  validationMessages: {
                    ValidationMessage.required: (_) => 'Это обязательное поле'
                  },
                  formControlName: 'companyAddress',
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text(
                      'Юр. адрес компании',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    helperText:
                        'Образец: Астана, Есильский район, ул. Туркестан 20, офис 14',
                    helperMaxLines: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ReactiveTextField(
                  formControlName: 'email',
                  validationMessages: {
                    ValidationMessage.email: (_) => 'Введите настоящий email',
                    ValidationMessage.required: (_) => 'Это обязательное поле'
                  },
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('E-mail',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    helperText:
                        'На этот адрес банк будет присылать ежедневный отчет',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ReactiveTextField(
                  formControlName: 'personFullName',
                  validationMessages: {
                    ValidationMessage.required: (_) => 'Это обязательное поле'
                  },
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Контакт (ФИО)',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    helperText: 'Образец: Ахметов Ахмет Ахметович',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ReactiveTextField(
                  formControlName: 'phoneNumber',
                  validationMessages: {
                    ValidationMessage.number: (_) =>
                        'Данный номер не правильный',
                    ValidationMessage.minLength: (_) => 'Введите 11 цифр',
                    ValidationMessage.maxLength: (_) => 'Введите 11 цифр',
                    ValidationMessage.required: (_) => 'Это обязательное поле',
                    ValidationMessage.pattern: (_) => 'Пишите только числами'
                  },
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Мобильный телефон',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    helperText: 'Образец: 87776665544',
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                height: 40,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              ReactiveForm(
                formGroup: checkboxes,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Какие виды аппаратов планируете подключить?'),
                    const SizedBox(height: 15),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.vendingMachines.map((machine) {
                          return Obx(
                            () => ReactiveCheckboxListTile(
                              selected: machine.values.first.value,
                              dense: true,
                              formControlName: machine.keys.first,
                              title: Text(
                                machine.keys.first,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black87),
                              ),
                              onChanged: (_) {
                                machine.values.first.toggle();
                              },
                            ),
                          );
                        }).toList()),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                height: 40,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ReactiveTextField(
                  formControlName: 'amountOfMachines',
                  validationMessages: {
                    ValidationMessage.required: (_) => 'Это обязательное поле',
                    ValidationMessage.number: (_) =>
                        'Количество должно быть больше нуля',
                    ValidationMessage.pattern: (_) => 'Пишите только числами'
                  },
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Количество аппаратов',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    helperText: 'Образец: 5',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ReactiveTextField(
                  validationMessages: {
                    ValidationMessage.number: (_) =>
                        'Введите положительное число',
                    ValidationMessage.required: (_) => 'Это обязательное поле',
                    ValidationMessage.pattern: (_) => 'Пишите только числами'
                  },
                  formControlName: 'monthlyIncome',
                  decoration: InputDecoration(
                    helperStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Примерные обороты в месяц (тенге)',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    helperText: 'Образец: 200000',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ReactiveTextField(
                  formControlName: 'serialNumbers',
                  decoration: InputDecoration(
                      helperStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('Серийные номера LE Vending (Необязательно)',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary)),
                      helperText: 'укажите через запятую',
                      helperMaxLines: 3),
                ),
              ),
              ReactiveFormConsumer(
                key: const Key('submit'),
                builder: (context, form, _) => ElevatedButton(
                  onPressed: form.valid && checkboxes.valid
                      ? () {
                          print(form.value);
                          print(checkboxes.value);

                          final newApplication = Application(
                              personName: form.control('personFullName').value);
                          controller.applications.insert(0, newApplication);
                          Get.toNamed('/secondPage');
                        }
                      : null,
                  child: const Text('Отправить'),
                ),
              )
            ]),
          ),
        ));
  }
}
