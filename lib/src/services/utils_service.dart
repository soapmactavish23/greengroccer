
import 'package:intl/intl.dart';

class UtilsService {
  
  static String priceToCurreny(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  static String formatDateTime(DateTime dateTime) {
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();

    return dateFormat.format(dateTime);

  }

}