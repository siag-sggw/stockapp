// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugDumpRenderTree, debugDumpLayerTree, debugDumpSemanticsTree, DebugSemanticsDumpOrder;
import 'package:flutter/scheduler.dart' show timeDilation;
import 'stock_data.dart';
import 'stock_list.dart';
import 'stock_strings.dart';
import 'stock_symbol_viewer.dart';
import 'stock_types.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum StockHomeTab { market, portfolio }


class StockHome extends StatefulWidget {
  const StockHome(this.stocks);

  final StockData stocks;

  @override
  StockHomeState createState() => StockHomeState();
}

class StockHomeState extends State<StockHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  bool _isSearching = false;
  bool _autorefresh = false;

  void _handleSearchBegin() {
    ModalRoute.of(context).addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: () {
        setState(() {
          _isSearching = false;
          _searchQuery.clear();
        });
      },
    ));
    setState(() {
      _isSearching = true;
    });
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(child: Center(child: Text('Stocks'))),
          const ListTile(
            leading: Icon(Icons.assessment),
            title: Text('Stock List'),
            selected: true,
          ),
          const ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Account Balance'),
            enabled: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Log Out'),
            onTap: _logout,
          ),
        ],
      ),
    );
  }

  void _handleShowSettings() {
    Navigator.popAndPushNamed(context, '/settings');
  }

  void _logout() async {
    // await new GoogleSignIn().signOut();
    // Navigator.pop(context, '/');
    Navigator.pushReplacementNamed(context, "/message");
  }

  void _handleShowAbout() {
    showAboutDialog(context: context);
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(StockStrings.of(context).title()),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _handleSearchBegin,
          tooltip: 'Search',
        ),
      ],
      bottom: TabBar(
        tabs: <Widget>[
          Tab(text: StockStrings.of(context).market()),
          Tab(text: StockStrings.of(context).portfolio()),
        ],
      ),
    );
  }

  static Iterable<Stock> _getStockList(StockData stocks, Iterable<String> symbols) {
    return symbols.map<Stock>((String symbol) => stocks[symbol])
        .where((Stock stock) => stock != null);
  }

  Iterable<Stock> _filterBySearchQuery(Iterable<Stock> stocks) {
    if (_searchQuery.text.isEmpty)
      return stocks;
    final RegExp regexp = RegExp(_searchQuery.text, caseSensitive: false);
    return stocks.where((Stock stock) => stock.symbol.contains(regexp));
  }

  void _buyStock(Stock stock) {
    setState(() {
      stock.percentChange = 100.0 * (1.0 / stock.lastSale);
      stock.lastSale += 1.0;
    });
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Purchased ${stock.symbol} for ${stock.lastSale}'),
      action: SnackBarAction(
        label: 'BUY MORE',
        onPressed: () {
          _buyStock(stock);
        },
      ),
    ));
  }

  Widget _buildStockList(BuildContext context, Iterable<Stock> stocks, StockHomeTab tab) {
    return StockList(
      stocks: stocks.toList(),
      onAction: _buyStock,
      onOpen: (Stock stock) {
        Navigator.pushNamed(context, '/stock:${stock.symbol}');
      },
      onShow: (Stock stock) {
        _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) => StockSymbolBottomSheet(stock: stock));
      },
    );
  }

  Widget _buildStockTab(BuildContext context, StockHomeTab tab, List<String> stockSymbols) {
    return AnimatedBuilder(
      key: ValueKey<StockHomeTab>(tab),
      animation: Listenable.merge(<Listenable>[_searchQuery, widget.stocks]),
      builder: (BuildContext context, Widget child) {
        return _buildStockList(context, _filterBySearchQuery(_getStockList(widget.stocks, stockSymbols)).toList(), tab);
      },
    );
  }

  static const List<String> portfolioSymbols = <String>['AAPL','FIZZ', 'FIVE', 'FLAT', 'ZINC', 'ZNGA'];

  Widget buildSearchBar() {
    return AppBar(
      leading: BackButton(
        color: Theme.of(context).accentColor,
      ),
      title: TextField(
        controller: _searchQuery,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search stocks',
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _isSearching ? buildSearchBar() : buildAppBar(),
        drawer: _buildDrawer(context),
        body: TabBarView(
          children: <Widget>[
            _buildStockTab(context, StockHomeTab.market, widget.stocks.allSymbols),
            _buildStockTab(context, StockHomeTab.portfolio, portfolioSymbols),
          ],
        ),
      ),
    );
  }
}

class _CreateCompanySheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Company Name',
          ),
        ),
        Text('(This demo is not yet complete.)'),
        // For example, we could add a button that actually updates the list
        // and then contacts the server, etc.
      ],
    );
  }
}
