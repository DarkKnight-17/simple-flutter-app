import 'package:reactive_forms/reactive_forms.dart';

Map<String, dynamic>? validateIdentity(AbstractControl<dynamic> control) {
  if (control.value != null && control.value.toString().length == 17) {
    String value = control.value.toString().replaceAll(' ', '');

    bool isProperIIN = checkIIN(value);
    bool isProperBID = checkBID(value);

    return isProperBID || isProperIIN ? null : {'numberIsIncorrect': true};
  }
  return {'notEnoughDigits': true};
}

bool checkIIN(String value) {
  int sum = 0;
  int sum1 = 0;

  for (int i = 0; i < value.length - 1; i++) {
    sum += int.parse(value[i]) * (i + 1);
  }
  int lastDigit1 = sum % 11;

  // case 1
  if (lastDigit1 < 10 && lastDigit1 == int.parse(value[value.length - 1])) {
    return true;
  } else {
    // second case
    for (int b = 0; b < value.length - 3; b++) {
      sum1 += int.parse(value[b]) * (b + 3);
    }
    sum1 += int.parse(value[9]) * 1 + int.parse(value[10]) * 2;
    int lastDigit2 = sum1 % 11;

    return (lastDigit2 < 10 && lastDigit2 == int.parse(value[value.length - 1]))
        ? true
        : false;
  }
}

bool checkBID(String value) {
  String year = value.substring(0, 2);
  String month = value.substring(2, 4);
  List validYears = [];
  for (int i = 10; i < 100; i++) {
    validYears.add(i.toString());
  }

  List otherValidYears = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09'
  ];

  List validMonths = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];

  bool correctYear =
      validYears.contains(year) || otherValidYears.contains(year);
  bool correctMonth = validMonths.contains(month);
  bool goodFirstPart = correctYear && correctMonth;
  List secondPartProperCases = ['4', '5', '6'];
  bool goodFifthDigit = secondPartProperCases.contains(value[4]);
  List thirdPartProperCases = ['0', '1', '2', '3'];
  bool goodSixthDigit = thirdPartProperCases.contains(value[5]);
  return (goodFirstPart && goodSixthDigit && goodFifthDigit);
}
