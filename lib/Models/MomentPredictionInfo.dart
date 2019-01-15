import 'package:decimal/decimal.dart';

class MomentPredictionItem {
  Decimal maxPrice;
  Decimal minPrice;

  MomentPredictionItem(Decimal maxPrice, Decimal minPrice) {
    this.maxPrice = maxPrice;
    this.minPrice = minPrice;
  }
}