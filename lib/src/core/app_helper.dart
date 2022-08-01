import 'package:flutter/services.dart';

TextInputFormatter inputFormatterKhmerNumToDigitWithDouble =
    TextInputFormatter.withFunction(
  (oldValue, newValue) {
    final replacment = newValue.text
        .replaceAll('០', "0")
        .replaceAll('១', '1')
        .replaceAll('២', '2')
        .replaceAll('៣', '3')
        .replaceAll('៤', '4')
        .replaceAll('៥', '5')
        .replaceAll('៦', '6')
        .replaceAll('៧', '7')
        .replaceAll('៨', '8')
        .replaceAll('។', '.')
        .replaceAll(',', '.')
        .replaceAll('៩', '9');
    return TextEditingValue(
      text: replacment,
      selection: TextSelection.collapsed(offset: replacment.length),
    );
  },
);

List<TextInputFormatter> get inputFormatterNumeric => [
      FilteringTextInputFormatter.allow(RegExp(r"[0-9១២៣៤៥៦៧៨៩០។.,]")),
      inputFormatterKhmerNumToDigitWithDouble,
      TextInputFormatter.withFunction((oldValue, newValue) {
        final result = num.tryParse(newValue.text);
        if (result == null && newValue.text.isNotEmpty) return oldValue;
        return newValue;
      }),
    ];

class ModelParser {
  static int? dateParserToJson(DateTime? dateTime) {
    return dateTime?.millisecondsSinceEpoch;
  }

  static DateTime? dateParserFromJson(int? millisecondsSinceEpoch) {
    if (millisecondsSinceEpoch == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }
}
