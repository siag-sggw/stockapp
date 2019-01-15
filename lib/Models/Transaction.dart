import 'package:decimal/decimal.dart';

class Transaction {
  String symbol;
  int quantity;
  Decimal priceForOne;

  Transaction(String symbol, int quantity, Decimal priceForOne) {
    this.symbol = symbol;
    this.quantity = quantity;
    this.priceForOne = priceForOne;
  }
}
