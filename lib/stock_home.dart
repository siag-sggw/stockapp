// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'stock_data.dart';
import 'stock_list.dart';
import 'stock_strings.dart';
import 'stock_symbol_viewer.dart';
import 'stock_types.dart';

typedef ModeUpdater = void Function(StockMode mode);

enum _StockMenuItem { autorefresh, refresh, speedUp, speedDown }
enum StockHomeTab { market, favourite }


class StockHome extends StatefulWidget {
  const StockHome(this.stocks, this.configuration, this.updater);

  final StockData stocks;
  final StockConfiguration configuration;
  final ValueChanged<StockConfiguration> updater;

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

  void _handleStockModeChange(StockMode value) {
    if (widget.updater != null)
      widget.updater(widget.configuration.copyWith(stockMode: value));
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: new Hero(
                  tag: 'hero',
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 64.0,
                    child: Image.asset('assets/increase.png'),
                  ),
                ),),
          const ListTile(
            leading: Icon(Icons.assessment),
            title: Text('Stock List'),
            selected: true,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.assistant),
            title: const Text('Begginer mode'),
            trailing: Radio<StockMode>(
              value: StockMode.optimistic,
              groupValue: widget.configuration.stockMode,
              onChanged: _handleStockModeChange,
            ),
            onTap: () {
              _handleStockModeChange(StockMode.optimistic);
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Pro mode'),
            trailing: Radio<StockMode>(
              value: StockMode.pessimistic,
              groupValue: widget.configuration.stockMode,
              onChanged: _handleStockModeChange,
            ),
            onTap: () {
              _handleStockModeChange(StockMode.pessimistic);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('About'),
            onTap: _handleShowAbout,
          ),
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
    Navigator.pushReplacementNamed(context, "/");
  }

  void _handleShowAbout() {
    const List<String> names = ["Wiktor El Attar", "Ilya Piatrenka",
                                "Kamil Barciński", "Michał Pindel",
                                "Jakub Kowalik", "Karina Śmiech",
                                "Patryk Figarski", "Zuza Gałecka",
                                "Kamil Jaszczak", "Grzegorz Jarząbek",
                                "Maksymilian Adamowicz", "Michał Kwiatkowski"];
    double width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("App creators:"),
          children: <Widget>[
            Container(
              width: width,
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 10, 3),
                    child: Text(
                      "- ${names[index]}",
                      style: TextStyle(
                        fontSize: 16
                      ),  
                    ),
                  );
                },
                shrinkWrap: true,
              )
            )
          ],
        );
      }
    );
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
          Tab(text: StockStrings.of(context).favourites()),
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

  void _addToFavourites(Stock stock) {
    setState(() {
      if(favouriteSymbols.contains(stock.symbol)) {
        favouriteSymbols.remove(stock.symbol);
      } else {
        favouriteSymbols.add(stock.symbol);
      }
    });
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Added ${stock.symbol} to FAVOURITE tab.'),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          setState(() {
            favouriteSymbols.removeWhere((symbol) => symbol == stock.symbol);
          });
        },
      ),
    ));
  }

  Widget _buildStockList(BuildContext context, Iterable<Stock> stocks, StockHomeTab tab) {
    return StockList(
      stocks: stocks.toList(),
      onAction: _addToFavourites,
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

  static List<String> favouriteSymbols = new List();

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
            _buildStockTab(context, StockHomeTab.favourite, favouriteSymbols),
          ],
        ),
      ),
    );
  }
}