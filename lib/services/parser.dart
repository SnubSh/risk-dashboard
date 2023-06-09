
import 'package:intl/intl.dart';

class Parser {

  static String dateTimeToString(DateTime date) {
    final dateFormat = DateFormat('dd - MMMM - yyyy', "es_MX");
    var datetime = dateFormat.format(date);
    return datetime;
  }
}