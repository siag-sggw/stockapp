import 'package:decimal/decimal.dart';

class MomentStockInfo {
  Decimal open;
  Decimal close;
  Decimal high;
  Decimal low;
  int volume;

  MomentStockInfo(String open, String close, String high, String low, String volume){
    this.open = Decimal.parse(open);
    this.close = Decimal.parse(close);
    this.high = Decimal.parse(high);
    this.low = Decimal.parse(low);
    this.volume = int.parse(volume);
  }
}