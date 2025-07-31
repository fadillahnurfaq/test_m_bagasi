import "package:intl/intl.dart";

class AppGlobalFunc {
  static String formatCurrency(dynamic value) {
    final double fixedValue = double.tryParse(value.toString()) ?? 0.0;
    final formatter = NumberFormat.simpleCurrency(
      locale: "id_ID",
      name: 'Rp',
      decimalDigits: 0,
    );

    return formatter.format(fixedValue);
  }
}
