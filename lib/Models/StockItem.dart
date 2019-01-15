import 'package:decimal/decimal.dart';
import 'dart:core';
import "MomentPredictionInfo.dart";
import 'MomentStockInfo.dart';

class StockItem {
  String symbol;
  Map<DateTime, MomentStockInfo> timeSeries;
  Map<DateTime, MomentPredictionItem> prediction;
  bool willRise;

  StockItem(String symbol){
    this.symbol = symbol;
  }

  SetData(){

  }

  GetPrediction() {
    
  }
}