// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library stocks;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show
  debugPaintSizeEnabled,
  debugPaintBaselinesEnabled,
  debugPaintLayerBordersEnabled,
  debugPaintPointersEnabled,
  debugRepaintRainbowEnabled;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'stock_data.dart';
import 'stock_home.dart';
import 'stock_strings.dart';
import 'stock_symbol_viewer.dart';
import 'stock_types.dart';
import 'stock_login.dart';
import 'stock_message.dart';

class _StocksLocalizationsDelegate extends LocalizationsDelegate<StockStrings> {
  @override
  Future<StockStrings> load(Locale locale) => StockStrings.load(locale);

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  bool shouldReload(_StocksLocalizationsDelegate old) => false;
}

class StocksApp extends StatefulWidget {
  @override
  StocksAppState createState() => StocksAppState();
}

class StocksAppState extends State<StocksApp> {
  StockData stocks;

  StockConfiguration _configuration = StockConfiguration(
  );

  @override
  void initState() {
    super.initState();
    stocks = StockData();
  }

  void configurationUpdater(StockConfiguration value) {
  }

  ThemeData get theme {
        return ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.purple
        );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    // Routes, by c_onvention, are split on slashes, like filesystem paths.
    final List<String> path = settings.name.split('/');
    // We only support paths that start with a slash, so bail if
    // the first component is not empty:
    if (path[0] != '')
      return null;
    // If the path is "/stock:..." then show a stock page for the
    // specified stock symbol.
    if (path[1].startsWith('stock:')) {
      // We don't yet support subpages of a stock, so bail if there's
      // any more path components.
      if (path.length != 2)
        return null;
      // Extract the symbol part of "stock:..." and return a route
      // for that symbol.
      final String symbol = path[1].substring(6);
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => StockSymbolPage(symbol: symbol, stocks: stocks),
      );
    }
    // The other paths we support are in the routes table.
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stocks',
      theme: theme,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        _StocksLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      routes: <String, WidgetBuilder>{
         '/':    (BuildContext context) => Login(),
         '/home':(BuildContext context) => StockHome(stocks),
          '/message':(BuildContext context) => MesssageWidget()
      },
      onGenerateRoute: _getRoute,
    );
  }
}

void main() {
  runApp(StocksApp());
}
