// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Snapshot from http://www.nasdaq.com/screening/company-list.aspx
// Fetched 2/23/2014.
// "Symbol","Name","LastSale","MarketCap","IPOyear","Sector","industry","Summary Quote",
// Data in stock_data.json

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final math.Random _rng = math.Random();

class Stock {
  Stock(this.symbol, this.open, this.close, this.low, this.high, this.volume, this.percentChange);

  Stock.fromFields(String symboll, Map<String, dynamic> fields) {
    symbol = symboll;
    open = fields['open'] + .0;
    close = fields['close'] + .0;
    high = fields['high'] + .0;
    low = fields['low'] + .0;
    volume = fields['volume'] + .0;
    percentChange = fields['changePercent'] + .0;
  }

  String symbol;
  num open;
  num close;
  num high;
  num low;
  num volume;
  num percentChange;
}

class StockData extends ChangeNotifier {
  StockData() {
    if (actuallyFetchData) {
      _httpClient = http.Client();
      _fetchNextChunk();
    }
  }

  final List<String> _symbols = [
    'AAPL',
    'AMD',
    'CMCSA',
    'CRON',
    'CSCO',
    'CZR',
    'EBAY',
    'FB',
    'INTC',
    'MSFT',
    'MU',
    'NFLX',
    'QCOM',
    'QQQ',
    'SIRI',
    'SQQQ',
    'TQQQ',
    'TVIX',
  ];
  Iterable<String> get allSymbols => _symbols;
  final Map<String, Stock> _stocks = <String, Stock>{};

  Stock operator [](String symbol) => _stocks[symbol];

  bool get loading => _httpClient != null;

  void add(List<dynamic> data, String symbol) {
    //print(data);
    for (Map<String, dynamic> fields in data) {
      //print(fields);
      final Stock stock = Stock.fromFields(symbol, fields);
      //print(stock.symbol);
      _stocks[symbol] = stock;
    }
    notifyListeners();
  }

  static const int _chunkCount = 30;
  int _nextChunk = 0;

  String _urlToFetch(String symbol) {
    return 'https://api.iextrading.com/1.0/stock/${symbol}/chart/1m';
  }

  http.Client _httpClient;

  static bool actuallyFetchData = true;

  // void _fetchData() {
  //   for (String symbol in _symbols {
  //     _httpClient.get(_urlToFetch(symbol)).then<void>((http.Response response) {
  //       print('response');
  //     });
  //   }
  //   ;
  // }

  void _fetchNextChunk() async {
    for (String symbol in _symbols) {
      await _httpClient
          .get(_urlToFetch(symbol))
          .then<void>((http.Response response) {
        final String json = response.body;
        //print(json);
        if (json == null) {
          debugPrint('Failed to load stock data chunk ${_nextChunk - 1}');
          _end();
          return;
        }
        const JsonDecoder decoder = JsonDecoder();
        //print(decoder.convert(json));
        add(decoder.convert(json), symbol);
      });
    }
    _end();
  }

  void _end() {
    _httpClient?.close();
    _httpClient = null;
    actuallyFetchData = false;
  }
}
