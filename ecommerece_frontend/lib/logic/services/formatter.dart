import 'package:intl/intl.dart';

class Formatter {
  static String fromatterPrice(int price) {
    final numberFormat = NumberFormat("#,##,###");
    return numberFormat.format(price);
  }
}
