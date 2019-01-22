// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

enum StockMode { optimistic, pessimistic }
enum BackupMode { enabled, disabled }

class StockConfiguration {
    StockConfiguration({
      @required this.stockMode
    }) : assert(stockMode != null);

    final StockMode stockMode;

    StockConfiguration copyWith({
      StockMode stockMode
    }) {
    StockConfiguration copyWith(
    ) {
      return StockConfiguration(
        stockMode: stockMode ?? this.stockMode
      );
    }
  }
}