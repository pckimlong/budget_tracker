import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:intl/intl.dart';

extension BuidContextX on BuildContext {
  ThemeData get theme => FluentTheme.of(this);
}

extension AmountX on double {
  double toNegative() {
    if (this < 0) return this;
    return this - (this * 2);
  }

  String moneyFormat() {
    final formatter = NumberFormat.currency(symbol: "\$ ");
    return formatter.format(this);
  }

  double transform(CategoryType type) {
    double amount;
    switch (type) {
      case CategoryType.income:
        amount = abs();
        break;
      case CategoryType.expense:
        amount = toNegative();
        break;
    }
    return amount;
  }

  double opposite() {
    if (this == 0) return this;
    if (this < 0) {
      return abs();
    } else {
      return toNegative();
    }
  }
}

extension CategoryTypeX on CategoryType {
  String khmer() {
    switch (this) {
      case CategoryType.income:
        return "ចំណូល";
      case CategoryType.expense:
        return "ចំណាយ";
    }
  }
}

extension DateTimeX on DateTime {
  DateTime dateOnly() => DateTime(year, month, day);
  DateTime firstMinuteOfDay() => DateTime(year, month, day);
  DateTime lastMinuteOfDay() => DateTime(year, month, day, 23, 59, 59);
  // bool get isToday {
  //   final now = DateTime.now();
  //   return now.day == day && now.month == month && now.year == year;
  // }

  // bool get isTomorrow {
  //   final tomorrow = DateTime.now().add(const Duration(days: 1));
  //   return tomorrow.day == day && tomorrow.month == month && tomorrow.year == year;
  // }

  String format([bool useYtdTodayTmr = true]) {
    if (useYtdTodayTmr) {
      if (isToday) {
        return "ថ្ងៃនេះ";
      } else if (isYesterday) {
        return "ម្សិលមិញ";
      } else if (isTomorrow) {
        return "ស្អែក";
      }
    }
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String supabaseDateOnly() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }
}
