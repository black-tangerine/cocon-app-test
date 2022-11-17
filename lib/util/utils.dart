import 'package:intl/intl.dart';

class Utils{
  static comma(int price){
    return NumberFormat('###,###,###,###').format(price).replaceAll(' ', '');
  }

}