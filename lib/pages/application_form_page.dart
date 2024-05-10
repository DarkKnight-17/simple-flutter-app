import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_flutter_app/common/components/list_spaced.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ApplicationFormPage extends StatelessWidget {
  final Function(Map<String, dynamic>) add;
  const ApplicationFormPage(this.add, {super.key});

  @override
  Widget build(BuildContext context) {
    final amount = FormControl<int>(value: 20, validators: [
      Validators.required,
    ]);

    final income = FormControl<int>(value: 200000, validators: [
      Validators.required,
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[500],
        title: const Text('Kaspi Bank'),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ReactiveForm(
        formGroup: FormGroup({
          'companyName': FormControl<String>(validators: [Validators.required]),
          'companyIdentityNumber': FormControl<int>(validators: [
            Validators.required,
          ]),
          'phoneNumber': FormControl<int>(validators: [
            Validators.required,
          ]),
          'kaspiPayAccount':
              FormControl<String>(validators: [Validators.required]),
          'companyAddress':
              FormControl<String>(validators: [Validators.required]),
          'email': FormControl<String>(
              validators: [Validators.required, Validators.email]),
          'personFullName':
              FormControl<String>(validators: [Validators.required]),
          'amountOfMachines': amount,
          'monthlyIncome': income,
          'types': FormArray<String>([], validators: [Validators.minLength(1)]),
        }),
        child: ListViewSpaced(children: [
          const Column(
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
          ReactiveTextField(
            validationMessages: {
              ValidationMessage.required: (_) => 'Это обязательное поле',
            },
            scrollPadding: const EdgeInsets.symmetric(vertical: 15),
            formControlName: 'companyName',
            decoration: InputDecoration(
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text('Наименование компании (ИП/TOO)',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              helperText: 'Образец: ИП Ахметов А.А',
            ),
          ),
          ReactiveTextField<int>(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              MaskTextInputFormatter(
                  mask: '## ## ## ## ## ##', filter: {'#': RegExp(r'[0-9]')})
            ],
            formControlName: 'companyIdentityNumber',
            validationMessages: {
              ValidationMessage.required: (_) => 'Это обязательное поле',
            },
            decoration: InputDecoration(
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text('ИИН/БИН компании',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              helperText: 'Образец: 830519018300',
            ),
          ),
          ReactiveTextField(
            validationMessages: {
              ValidationMessage.creditCard: (_) =>
                  'Данный номер счета не действителен',
              ValidationMessage.required: (_) => 'Это обязательное поле'
            },
            formControlName: 'kaspiPayAccount',
            decoration: InputDecoration(
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text('Номер счета на Kaspi Pay',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              helperText: 'На этот счет будут поступать деньги',
            ),
          ),
          ReactiveTextField(
            validationMessages: {
              ValidationMessage.required: (_) => 'Это обязательное поле'
            },
            formControlName: 'companyAddress',
            decoration: InputDecoration(
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text(
                'Юр. адрес компании',
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              helperText:
                  'Образец: Астана, Есильский район, ул. Туркестан 20, офис 14',
              helperMaxLines: 2,
            ),
          ),
          ReactiveTextField(
            formControlName: 'email',
            validationMessages: {
              ValidationMessage.email: (_) => 'Введите настоящий email',
              ValidationMessage.required: (_) => 'Это обязательное поле'
            },
            decoration: InputDecoration(
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text('E-mail',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              helperText: 'На этот адрес банк будет присылать ежедневный отчет',
            ),
          ),
          ReactiveTextField(
            formControlName: 'personFullName',
            validationMessages: {
              ValidationMessage.required: (_) => 'Это обязательное поле'
            },
            decoration: InputDecoration(
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text('Контакт (ФИО)',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              helperText: 'Образец: Ахметов Ахмет Ахметович',
            ),
          ),
          ReactiveTextField(
            formControlName: 'phoneNumber',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              MaskTextInputFormatter(
                  mask: '(###) ###-##-##', filter: {'#': RegExp(r'[0-9]')})
            ],
            validationMessages: {
              ValidationMessage.required: (_) => 'Это обязательное поле',
            },
            decoration: InputDecoration(
              prefixText: '+7 ',
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text('Мобильный телефон',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              helperText: 'Образец: +77776665544',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Виды Аппаратов:'),
          ),
          ReactiveFormArray<String>(
            formArrayName: 'types',
            builder: (context, formArray, child) {
              return ChipList(
                onChange: (value) {
                  formArray.clear();
                  formArray.value = value;
                },
              );
            },
          ),
          ReactiveTextField(
            readOnly: true,
            formControlName: 'amountOfMachines',
            validationMessages: {
              ValidationMessage.required: (_) => 'Это обязательное поле',
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  print(amount.value);
                  amount.value = amount.value! - 5;
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  amount.value = amount.value! + 5;
                },
                icon: const Icon(Icons.add_circle_outline),
              ),
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text('Количество аппаратов',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              helperText: 'Образец: 5',
            ),
          ),
          ReactiveTextField<int>(
            validationMessages: {
              ValidationMessage.required: (_) => 'Это обязательное поле',
            },
            formControlName: 'monthlyIncome',
            textAlign: TextAlign.center,
            readOnly: true,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  if (income.value! >= 25000) {
                    income.value = income.value! - 25000;
                  }
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  income.value = income.value! + 25000;
                },
                icon: const Icon(Icons.add_circle_outline),
              ),
              helperStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: Text('Примерные обороты в месяц (тенге)',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              helperText: 'Образец: 200000',
            ),
          ),
          ReactiveFormConsumer(builder: (context, form, child) {
            // print(form.value);
            return ElevatedButton(
              onPressed: form.valid ? () => add(form.value) : null,
              child: const Text('Отправить'),
            );
          }),
        ]),
      ),
    );
  }
}

class ChipList extends StatefulWidget {
  final Function(List<String>) onChange;
  const ChipList({
    required this.onChange,
    super.key,
  });

  @override
  State<ChipList> createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  List<String> selectedTypes = [];

  void change(String name, bool selected) {
    if (selected) {
      setState(() => selectedTypes.add(name));
    } else {
      setState(() => selectedTypes.remove(name));
    }
    widget.onChange(selectedTypes);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ChoiceChip(
          label: const Text('Водоматы'),
          selected: selectedTypes.contains('Водоматы'),
          onSelected: (selected) {
            change('Водоматы', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Снэк-аппараты'),
          selected: selectedTypes.contains('Снэк-аппараты'),
          onSelected: (selected) {
            change('Снэк-аппараты', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Кофемашины'),
          selected: selectedTypes.contains('Кофемашины'),
          onSelected: (selected) {
            change('Кофемашины', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Автомойки самообслуживания'),
          selected: selectedTypes.contains('Автомойки самообслуживания'),
          onSelected: (selected) {
            change('Автомойки самообслуживания', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Массажные кресла'),
          selected: selectedTypes.contains('Массажные кресла'),
          onSelected: (selected) {
            change('Массажные кресла', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Игровые аппараты'),
          selected: selectedTypes.contains('Игровые аппараты'),
          onSelected: (selected) {
            change('Игровые аппараты', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Силомеры'),
          selected: selectedTypes.contains('Силомеры'),
          onSelected: (selected) {
            change('Силомеры', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Аппараты мороженного'),
          selected: selectedTypes.contains('Аппараты мороженного'),
          onSelected: (selected) {
            change('Аппараты мороженного', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Соковыжималки'),
          selected: selectedTypes.contains('Соковыжималки'),
          onSelected: (selected) {
            change('Соковыжималки', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Ландроматы'),
          selected: selectedTypes.contains('Ландроматы'),
          onSelected: (selected) {
            change('Ландроматы', selected);
          },
        ),
        ChoiceChip(
          label: const Text('Другое'),
          selected: selectedTypes.contains('Другое'),
          onSelected: (selected) {
            change('Другое', selected);
          },
        ),
      ],
    );
  }
}
