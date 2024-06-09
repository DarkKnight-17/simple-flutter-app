import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get ddmmyyyy {
    return DateFormat('dd.MM.yyyy').format(this);
  }

  String get ago {
    final diff = DateTime.now().difference(this);
    if (diff.inDays == 1) {
      return 'вчера';
    }
    if (diff.inDays > 1) {
      return '${diff.inDays} дней назад';
    }
    return 'сегодня';
  }
}
