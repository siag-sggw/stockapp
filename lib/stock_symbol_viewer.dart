// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';

import 'stock_arrow.dart';
import 'stock_data.dart';

class _StockSymbolView extends StatelessWidget {
  const _StockSymbolView({this.stock, this.arrow});

  final Stock stock;
  final Widget arrow;

  @override
  Widget build(BuildContext context) {
    List sampleData = [
      {
        "open": 174.6775,
        "high": 175.1504,
        "low": 173.9894,
        "close": 174.3819,
        "volumeto": 27108551
      },
      {
        "open": 174.6775,
        "high": 176.7858,
        "low": 174.2046,
        "close": 174.4213,
        "volumeto": 32689146
      },
      {
        "open": 174.6282,
        "high": 174.6775,
        "low": 170.6381,
        "close": 171.643,
        "volumeto": 51105090
      },
      {
        "open": 171.9238,
        "high": 172.3623,
        "low": 168.0076,
        "close": 168.579,
        "volumeto": 41529004
      },
      {
        "open": 169.4559,
        "high": 169.4559,
        "low": 167.5446,
        "close": 168.9731,
        "volumeto": 39143011
      },
      {
        "open": 167.6431,
        "high": 167.6431,
        "low": 164.5988,
        "close": 165.4756,
        "volumeto": 50640406
      },
      {
        "open": 163.0767,
        "high": 164.8944,
        "low": 162.2639,
        "close": 164.5003,
        "volumeto": 46048185
      },
      {
        "open": 164.4018,
        "high": 165.9502,
        "low": 164.0372,
        "close": 164.9535,
        "volumeto": 32478930
      },
      {
        "open": 164.6924,
        "high": 166.1259,
        "low": 164.2934,
        "close": 165.2983,
        "volumeto": 47230787
      },
      {
        "open": 163.5446,
        "high": 164.3328,
        "low": 157.7319,
        "close": 158.126,
        "volumeto": 86593825
      },
      {
        "open": 156.7467,
        "high": 161.456,
        "low": 153.6925,
        "close": 154.1753,
        "volumeto": 72738522
      },
      {
        "open": 152.5399,
        "high": 161.2984,
        "low": 151.7221,
        "close": 160.6186,
        "volumeto": 68243838
      },
      {
        "open": 160.6728,
        "high": 160.9831,
        "low": 156.7157,
        "close": 157.1802,
        "volumeto": 51608580
      },
      {
        "open": 157.9191,
        "high": 158.6186,
        "low": 152.7369,
        "close": 152.8551,
        "volumeto": 54390516
      },
      {
        "open": 155.3777,
        "high": 156.1889,
        "low": 148.6213,
        "close": 154.7248,
        "volumeto": 70672608
      },
      {
        "open": 156.7923,
        "high": 162.1242,
        "low": 155.813,
        "close": 160.9569,
        "volumeto": 60819539
      },
      {
        "open": 160.2051,
        "high": 162.975,
        "low": 159.9084,
        "close": 162.5694,
        "volumeto": 32549163
      },
      {
        "open": 161.2883,
        "high": 165.7349,
        "low": 161.1251,
        "close": 165.5667,
        "volumeto": 40644933
      },
      {
        "open": 167.9607,
        "high": 171.2251,
        "low": 167.1792,
        "close": 171.1262,
        "volumeto": 51147171
      },
      {
        "open": 170.503,
        "high": 172.9365,
        "low": 169.9193,
        "close": 170.5722,
        "volumeto": 40176091
      },
      {
        "open": 170.1963,
        "high": 172.3825,
        "low": 169.5731,
        "close": 169.9985,
        "volumeto": 33930540
      },
      {
        "open": 170.9679,
        "high": 172.244,
        "low": 169.1675,
        "close": 169.2269,
        "volumeto": 37471623
      },
      {
        "open": 169.949,
        "high": 172.0758,
        "low": 169.86,
        "close": 170.6415,
        "volumeto": 30991940
      },
      {
        "open": 171.7989,
        "high": 173.7575,
        "low": 171.6703,
        "close": 173.6091,
        "volumeto": 33812360
      },
      {
        "open": 174.45,
        "high": 177.4572,
        "low": 174.3115,
        "close": 177.0418,
        "volumeto": 38162174
      },
      {
        "open": 177.1704,
        "high": 178.5355,
        "low": 176.2405,
        "close": 176.468,
        "volumeto": 38928125
      },
      {
        "open": 177.3286,
        "high": 178.669,
        "low": 176.1317,
        "close": 176.2009,
        "volumeto": 37782138
      },
      {
        "open": 176.6164,
        "high": 177.8381,
        "low": 170.7997,
        "close": 173.1145,
        "volumeto": 48801970
      },
      {
        "open": 170.9382,
        "high": 174.4005,
        "low": 170.592,
        "close": 174.3115,
        "volumeto": 38453950
      },
      {
        "open": 173.3223,
        "high": 175.825,
        "low": 172.6397,
        "close": 174.9149,
        "volumeto": 28401366
      },
      {
        "open": 175.9932,
        "high": 176.3295,
        "low": 174.2324,
        "close": 174.7665,
        "volumeto": 23788506
      },
      {
        "open": 173.0552,
        "high": 173.9554,
        "low": 172.3924,
        "close": 173.1442,
        "volumeto": 31703462
      },
      {
        "open": 173.5894,
        "high": 175.2117,
        "low": 173.1838,
        "close": 175.0336,
        "volumeto": 23774107
      },
      {
        "open": 176.0426,
        "high": 178.0607,
        "low": 175.4788,
        "close": 178.0409,
        "volumeto": 32185162
      },
      {
        "open": 178.3475,
        "high": 180.4249,
        "low": 178.2684,
        "close": 179.7621,
        "volumeto": 32207081
      },
      {
        "open": 180.6228,
        "high": 181.523,
        "low": 177.3088,
        "close": 178.031,
        "volumeto": 31693529
      },
      {
        "open": 178.3772,
        "high": 178.5751,
        "low": 175.8943,
        "close": 176.5175,
        "volumeto": 29368356
      },
      {
        "open": 176.5768,
        "high": 178.2981,
        "low": 176.1516,
        "close": 176.7252,
        "volumeto": 22743798
      },
      {
        "open": 176.7252,
        "high": 177.1901,
        "low": 175.7063,
        "close": 176.102,
        "volumeto": 39404688
      },
      {
        "open": 175.4095,
        "high": 175.5579,
        "low": 171.789,
        "close": 173.4113,
        "volumeto": 33446771
      },
      {
        "open": 173.3519,
        "high": 174.8951,
        "low": 173.0552,
        "close": 173.3519,
        "volumeto": 19649350
      },
      {
        "open": 173.1541,
        "high": 173.2036,
        "low": 169.4148,
        "close": 169.4247,
        "volumeto": 37054935
      },
      {
        "open": 168.1684,
        "high": 170.8195,
        "low": 166.7835,
        "close": 167.0308,
        "volumeto": 41490767
      },
      {
        "open": 166.5757,
        "high": 168.0893,
        "low": 163.1629,
        "close": 163.1629,
        "volumeto": 41028784
      },
      {
        "open": 166.2592,
        "high": 171.235,
        "low": 164.6468,
        "close": 170.9086,
        "volumeto": 37541236
      },
      {
        "open": 171.8088,
        "high": 173.2629,
        "low": 165.1216,
        "close": 166.5263,
        "volumeto": 40922579
      },
      {
        "open": 165.448,
        "high": 168.1882,
        "low": 163.4102,
        "close": 164.6863,
        "volumeto": 41668545
      },
      {
        "open": 165.997,
        "high": 169.8995,
        "low": 165.1018,
        "close": 165.9723,
        "volumeto": 38398505
      },
      {
        "open": 166.0712,
        "high": 167.1198,
        "low": 162.698,
        "close": 164.8842,
        "volumeto": 37586791
      },
      {
        "open": 165.8338,
        "high": 166.9274,
        "low": 163.1036,
        "close": 166.5757,
        "volumeto": 30278046
      },
      {
        "open": 163.1036,
        "high": 170.1567,
        "low": 162.9947,
        "close": 169.7611,
        "volumeto": 34605489
      },
      {
        "open": 170.7206,
        "high": 172.3532,
        "low": 170.226,
        "close": 170.9382,
        "volumeto": 26933197
      },
      {
        "open": 169.1279,
        "high": 170.6217,
        "low": 166.3878,
        "close": 166.5659,
        "volumeto": 35005290
      },
      {
        "open": 168.0497,
        "high": 171.2251,
        "low": 168.0151,
        "close": 168.2179,
        "volumeto": 29017718
      },
      {
        "open": 171.1361,
        "high": 172.1253,
        "low": 169.6819,
        "close": 171.3834,
        "volumeto": 28614241
      },
      {
        "open": 170.3744,
        "high": 172.0493,
        "low": 169.8501,
        "close": 170.5821,
        "volumeto": 22431640
      },
      {
        "open": 171.5417,
        "high": 173.1145,
        "low": 171.1756,
        "close": 172.2638,
        "volumeto": 22889285
      },
      {
        "open": 172.8969,
        "high": 173.9455,
        "low": 171.9769,
        "close": 172.8474,
        "volumeto": 25124255
      },
      {
        "open": 173.1443,
        "high": 174.2917,
        "low": 172.9465,
        "close": 173.9257,
        "volumeto": 21578420
      },
      {
        "open": 174.5885,
        "high": 177.0086,
        "low": 174.5093,
        "close": 176.3196,
        "volumeto": 26605442
      },
      {
        "open": 175.8943,
        "high": 176.8934,
        "low": 174.9743,
        "close": 175.9239,
        "volumeto": 20754538
      },
      {
        "open": 173.0651,
        "high": 173.5003,
        "low": 170.7997,
        "close": 170.9382,
        "volumeto": 34808800
      },
      {
        "open": 168.757,
        "high": 169.3737,
        "low": 163.6476,
        "close": 163.9345,
        "volumeto": 65491140
      },
      {
        "open": 165.0373,
        "high": 165.1216,
        "low": 162.3221,
        "close": 163.4597,
        "volumeto": 36515477
      },
      {
        "open": 163.8851,
        "high": 164.5379,
        "low": 159.4831,
        "close": 161.1845,
        "volumeto": 33692017
      },
      {
        "open": 160.8679,
        "high": 163.6377,
        "low": 160.6602,
        "close": 161.8868,
        "volumeto": 28382084
      },
      {
        "open": 162.3518,
        "high": 163.9444,
        "low": 161.6098,
        "close": 162.4507,
        "volumeto": 27963014
      },
      {
        "open": 162.233,
        "high": 162.5595,
        "low": 158.8994,
        "close": 160.5711,
        "volumeto": 35655839
      },
      {
        "open": 160.3834,
        "high": 165.4579,
        "low": 160.0963,
        "close": 163.4795,
        "volumeto": 42427424
      },
      {
        "open": 164.6173,
        "high": 167.377,
        "low": 163.4894,
        "close": 167.2781,
        "volumeto": 53569376
      },
      {
        "open": 173.3371,
        "high": 175.8349,
        "low": 171.9275,
        "close": 174.6676,
        "volumeto": 66539371
      },
      {
        "open": 173.985,
        "high": 175.5876,
        "low": 172.5617,
        "close": 174.9842,
        "volumeto": 34068180
      },
      {
        "open": 176.3295,
        "high": 182.2649,
        "low": 176.2504,
        "close": 181.8494,
        "volumeto": 56201317
      },
      {
        "open": 183.1849,
        "high": 185.648,
        "low": 182.7595,
        "close": 183.1651,
        "volumeto": 42451423
      },
      {
        "open": 182.9969,
        "high": 184.2136,
        "low": 181.6862,
        "close": 184.0455,
        "volumeto": 28402777
      },
      {
        "open": 184.5401,
        "high": 185.3809,
        "low": 183.2244,
        "close": 185.3414,
        "volumeto": 23211241
      },
      {
        "open": 185.7173,
        "high": 188.3189,
        "low": 185.6282,
        "close": 187.9925,
        "volumeto": 27989289
      },
      {
        "open": 188.1712,
        "high": 188.7372,
        "low": 186.1454,
        "close": 187.2774,
        "volumeto": 26212221
      },
      {
        "open": 187.6945,
        "high": 188.2109,
        "low": 186.5525,
        "close": 186.8405,
        "volumeto": 20778772
      },
      {
        "open": 185.48,
        "high": 185.768,
        "low": 183.8117,
        "close": 185.1424,
        "volumeto": 23695159
      },
      {
        "open": 184.775,
        "high": 187.1483,
        "low": 184.7055,
        "close": 186.8703,
        "volumeto": 19183064
      },
      {
        "open": 186.6915,
        "high": 187.5952,
        "low": 185.063,
        "close": 185.6886,
        "volumeto": 17294029
      },
      {
        "open": 185.8872,
        "high": 186.5031,
        "low": 184.8346,
        "close": 185.0133,
        "volumeto": 18297728
      },
      {
        "open": 186.6915,
        "high": 187.9527,
        "low": 185.6097,
        "close": 186.3241,
        "volumeto": 18400787
      },
      {
        "open": 187.0639,
        "high": 187.5654,
        "low": 185.48,
        "close": 185.8574,
        "volumeto": 15240704
      },
      {
        "open": 185.053,
        "high": 187.1881,
        "low": 184.4671,
        "close": 187.049,
        "volumeto": 20058415
      },
      {
        "open": 187.4562,
        "high": 187.5257,
        "low": 184.914,
        "close": 186.8405,
        "volumeto": 23233975
      },
      {
        "open": 186.9199,
        "high": 188.3301,
        "low": 186.344,
        "close": 187.2675,
        "volumeto": 17460963
      },
      {
        "open": 186.2943,
        "high": 187.4363,
        "low": 185.5694,
        "close": 186.5922,
        "volumeto": 22514075
      },
      {
        "open": 186.4135,
        "high": 186.6915,
        "low": 185.48,
        "close": 186.195,
        "volumeto": 18690547
      },
      {
        "open": 185.917,
        "high": 186.9199,
        "low": 184.8445,
        "close": 185.5694,
        "volumeto": 27482793
      },
      {
        "open": 186.6828,
        "high": 188.9358,
        "low": 186.4433,
        "close": 188.916,
        "volumeto": 23442510
      },
      {
        "open": 190.3013,
        "high": 192.0738,
        "low": 190.0182,
        "close": 190.4949,
        "volumeto": 26266174
      },
      {
        "open": 191.7213,
        "high": 192.5902,
        "low": 191.0212,
        "close": 191.9646,
        "volumeto": 21565963
      },
      {
        "open": 192.2824,
        "high": 192.7292,
        "low": 190.5843,
        "close": 192.6299,
        "volumeto": 20933619
      },
      {
        "open": 192.7888,
        "high": 192.8484,
        "low": 190.9964,
        "close": 192.1135,
        "volumeto": 21347180
      },
      {
        "open": 189.8395,
        "high": 190.6637,
        "low": 188.4492,
        "close": 190.3658,
        "volumeto": 26656799
      },
      {
        "open": 190.0182,
        "high": 190.6339,
        "low": 188.8862,
        "close": 189.8991,
        "volumeto": 18308460
      },
      {
        "open": 190.053,
        "high": 191.2705,
        "low": 189.8196,
        "close": 190.9418,
        "volumeto": 16911141
      },
      {
        "open": 191.0808,
        "high": 191.5376,
        "low": 189.1146,
        "close": 189.3728,
        "volumeto": 21638393
      },
      {
        "open": 190.2168,
        "high": 190.2367,
        "low": 188.8961,
        "close": 189.4721,
        "volumeto": 21610074
      },
      {
        "open": 188.7074,
        "high": 188.8365,
        "low": 186.9497,
        "close": 187.5257,
        "volumeto": 61719160
      },
      {
        "open": 186.5724,
        "high": 187.9031,
        "low": 185.8971,
        "close": 187.4264,
        "volumeto": 18484865
      },
      {
        "open": 183.8515,
        "high": 185.0332,
        "low": 182.1732,
        "close": 184.3976,
        "volumeto": 33578455
      },
      {
        "open": 185.053,
        "high": 185.8971,
        "low": 184.4373,
        "close": 185.202,
        "volumeto": 20628701
      },
      {
        "open": 185.9468,
        "high": 187.0391,
        "low": 183.6528,
        "close": 184.1692,
        "volumeto": 25711898
      },
      {
        "open": 184.8246,
        "high": 184.8544,
        "low": 183.4145,
        "close": 183.633,
        "volumeto": 27200447
      },
      {
        "open": 182.1236,
        "high": 183.633,
        "low": 179.4721,
        "close": 180.9021,
        "volumeto": 31663096
      },
      {
        "open": 181.7164,
        "high": 185.2318,
        "low": 181.2696,
        "close": 183.1464,
        "volumeto": 24569201
      },
      {
        "open": 183.9386,
        "high": 185.9766,
        "low": 182.7492,
        "close": 182.8783,
        "volumeto": 25285328
      },
      {
        "open": 182.8187,
        "high": 184.914,
        "low": 182.5208,
        "close": 184.2089,
        "volumeto": 17365235
      },
      {
        "open": 184.9934,
        "high": 185.8872,
        "low": 181.637,
        "close": 183.8217,
        "volumeto": 22737666
      },
      {
        "open": 182.5406,
        "high": 185.9964,
        "low": 182.1434,
        "close": 185.8773,
        "volumeto": 17731343
      },
      {
        "open": 186.483,
        "high": 186.6419,
        "low": 182.2626,
        "close": 182.6399,
        "volumeto": 13954806
      },
      {
        "open": 183.9706,
        "high": 185.1126,
        "low": 182.9974,
        "close": 184.1096,
        "volumeto": 16604248
      },
      {
        "open": 184.1295,
        "high": 187.1225,
        "low": 183.911,
        "close": 186.6618,
        "volumeto": 17485245
      },
      {
        "open": 188.1811,
        "high": 189.3529,
        "low": 187.9825,
        "close": 189.2536,
        "volumeto": 19756634
      },
      {
        "open": 189.3827,
        "high": 189.9487,
        "low": 188.8565,
        "close": 189.0252,
        "volumeto": 15939149
      },
      {
        "open": 187.1881,
        "high": 188.4591,
        "low": 186.3043,
        "close": 186.5724,
        "volumeto": 18831470
      },
      {
        "open": 188.2109,
        "high": 190.0778,
        "low": 187.9924,
        "close": 189.7005,
        "volumeto": 18041131
      },
      {
        "open": 189.7501,
        "high": 190.5048,
        "low": 189.5714,
        "close": 189.9984,
        "volumeto": 12519792
      },
      {
        "open": 190.187,
        "high": 191.3092,
        "low": 189.0897,
        "close": 189.5813,
        "volumeto": 15043110
      },
      {
        "open": 188.4294,
        "high": 190.5346,
        "low": 187.8832,
        "close": 190.1175,
        "volumeto": 15534523
      },
      {
        "open": 190.4452,
        "high": 190.4651,
        "low": 188.6081,
        "close": 189.0748,
        "volumeto": 16393381
      },
      {
        "open": 188.3698,
        "high": 191.2099,
        "low": 188.3698,
        "close": 190.5445,
        "volumeto": 20286752
      },
      {
        "open": 190.4452,
        "high": 191.0907,
        "low": 188.8464,
        "close": 190.1076,
        "volumeto": 20706042
      },
      {
        "open": 189.3529,
        "high": 190.624,
        "low": 188.2407,
        "close": 190.2764,
        "volumeto": 15989365
      },
      {
        "open": 191.1106,
        "high": 192.3123,
        "low": 190.7134,
        "close": 191.6567,
        "volumeto": 18697898
      },
      {
        "open": 191.7165,
        "high": 193.4939,
        "low": 191.0907,
        "close": 193.4641,
        "volumeto": 16826483
      },
      {
        "open": 193.2555,
        "high": 194.5961,
        "low": 192.2625,
        "close": 192.8583,
        "volumeto": 19075964
      },
      {
        "open": 193.6329,
        "high": 193.8315,
        "low": 188.7769,
        "close": 189.6508,
        "volumeto": 24023972
      },
      {
        "open": 190.5644,
        "high": 190.8623,
        "low": 187.7541,
        "close": 188.5883,
        "volumeto": 21029535
      },
      {
        "open": 188.9755,
        "high": 190.8027,
        "low": 188.0222,
        "close": 188.9656,
        "volumeto": 39373038
      },
      {
        "open": 197.7441,
        "high": 200.3558,
        "low": 195.9368,
        "close": 200.0976,
        "volumeto": 67935716
      },
      {
        "open": 199.184,
        "high": 206.9297,
        "low": 198.9556,
        "close": 205.9466,
        "volumeto": 62404012
      },
      {
        "open": 205.5891,
        "high": 207.2872,
        "low": 204.0502,
        "close": 206.5424,
        "volumeto": 33447396
      },
      {
        "open": 206.5524,
        "high": 207.7937,
        "low": 205.6288,
        "close": 207.6149,
        "volumeto": 25425387
      },
      {
        "open": 207.8632,
        "high": 208.0419,
        "low": 205.321,
        "close": 205.6685,
        "volumeto": 25587387
      },
      {
        "open": 204.6159,
        "high": 206.3637,
        "low": 203.0966,
        "close": 205.8076,
        "volumeto": 22525487
      },
      {
        "open": 205.8374,
        "high": 208.32,
        "low": 205.7579,
        "close": 207.4262,
        "volumeto": 23492626
      },
      {
        "open": 206.639,
        "high": 208.373,
        "low": 205.9514,
        "close": 206.8084,
        "volumeto": 24611202
      },
      {
        "open": 206.9778,
        "high": 210.2185,
        "low": 206.9778,
        "close": 208.1438,
        "volumeto": 25890880
      },
      {
        "open": 209.4243,
        "high": 209.8279,
        "low": 207.5359,
        "close": 209.0207,
        "volumeto": 20748010
      },
      {
        "open": 208.4925,
        "high": 210.0073,
        "low": 207.6056,
        "close": 209.509,
        "volumeto": 28807564
      },
      {
        "open": 211.0137,
        "high": 213.0687,
        "low": 210.7347,
        "close": 212.5783,
        "volumeto": 28500367
      },
      {
        "open": 212.6979,
        "high": 217.1922,
        "low": 212.4188,
        "close": 216.8235,
        "volumeto": 35426997
      },
      {
        "open": 217.3417,
        "high": 218.4179,
        "low": 214.3621,
        "close": 214.7108,
        "volumeto": 30287695
      },
      {
        "open": 216.0462,
        "high": 216.4348,
        "low": 213.2808,
        "close": 214.2923,
        "volumeto": 26159755
      },
      {
        "open": 213.3556,
        "high": 215.6077,
        "low": 213.0965,
        "close": 214.3023,
        "volumeto": 19018131
      },
      {
        "open": 213.9037,
        "high": 216.2953,
        "low": 213.8538,
        "close": 214.7407,
        "volumeto": 18883224
      },
      {
        "open": 215.8469,
        "high": 216.1458,
        "low": 214.3621,
        "close": 215.4084,
        "volumeto": 18476356
      },
      {
        "open": 216.395,
        "high": 217.9794,
        "low": 215.5778,
        "close": 217.1822,
        "volumeto": 20525117
      },
      {
        "open": 218.2485,
        "high": 219.7732,
        "low": 218.1588,
        "close": 218.9361,
        "volumeto": 22776766
      },
      {
        "open": 219.3845,
        "high": 222.7129,
        "low": 218.6471,
        "close": 222.2047,
        "volumeto": 27254804
      },
      {
        "open": 222.4738,
        "high": 227.4663,
        "low": 221.6267,
        "close": 224.2476,
        "volumeto": 48793824
      },
      {
        "open": 225.7224,
        "high": 228.0742,
        "low": 225.2142,
        "close": 226.8385,
        "volumeto": 43340134
      },
      {
        "open": 227.6158,
        "high": 228.3831,
        "low": 225.842,
        "close": 227.566,
        "volumeto": 27390132
      },
      {
        "open": 228.1938,
        "high": 228.8714,
        "low": 224.3173,
        "close": 226.0812,
        "volumeto": 33332960
      },
      {
        "open": 225.4434,
        "high": 226.5595,
        "low": 220.5305,
        "close": 222.3243,
        "volumeto": 34289976
      },
      {
        "open": 221.0786,
        "high": 224.5864,
        "low": 219.9426,
        "close": 220.5305,
        "volumeto": 37619810
      },
      {
        "open": 220.1818,
        "high": 221.0786,
        "low": 215.7173,
        "close": 217.5709,
        "volumeto": 39516453
      },
      {
        "open": 217.252,
        "high": 223.5191,
        "low": 215.807,
        "close": 223.0717,
        "volumeto": 35749049
      },
      {
        "open": 224.1579,
        "high": 224.2177,
        "low": 219.0756,
        "close": 220.3013,
        "volumeto": 49278740
      },
      {
        "open": 222.7428,
        "high": 227.556,
        "low": 221.7961,
        "close": 225.6228,
        "volumeto": 41706377
      },
      {
        "open": 224.9651,
        "high": 226.0513,
        "low": 221.7483,
        "close": 223.0617,
        "volumeto": 31999289
      },
      {
        "open": 221.3776,
        "high": 222.1748,
        "low": 216.5146,
        "close": 217.1224,
        "volumeto": 37195133
      },
      {
        "open": 217.0327,
        "high": 221.0786,
        "low": 216.3651,
        "close": 217.4812,
        "volumeto": 31571712
      },
      {
        "open": 217.7403,
        "high": 218.8564,
        "low": 214.5514,
        "close": 217.6107,
        "volumeto": 27123833
      },
      {
        "open": 219.4742,
        "high": 221.5071,
        "low": 218.388,
        "close": 219.265,
        "volumeto": 26608794
      },
      {
        "open": 220.0123,
        "high": 220.5903,
        "low": 216.5345,
        "close": 216.9032,
        "volumeto": 96246748
      },
      {
        "open": 216.0661,
        "high": 220.4907,
        "low": 215.8768,
        "close": 220.0223,
        "volumeto": 27693358
      },
      {
        "open": 218.9859,
        "high": 222.0453,
        "low": 218.9361,
        "close": 221.4174,
        "volumeto": 24554379
      },
      {
        "open": 220.2316,
        "high": 222.972,
        "low": 218.9959,
        "close": 219.6536,
        "volumeto": 23984706
      },
      {
        "open": 223.0418,
        "high": 225.6527,
        "low": 222.7628,
        "close": 224.1678,
        "volumeto": 30181227
      },
      {
        "open": 224.0084,
        "high": 225.0548,
        "low": 223.2411,
        "close": 224.9551,
        "volumeto": 22929364
      },
      {
        "open": 227.1574,
        "high": 228.6223,
        "low": 225.563,
        "close": 226.4698,
        "volumeto": 23600802
      },
      {
        "open": 226.4599,
        "high": 229.2003,
        "low": 225.842,
        "close": 228.4828,
        "volumeto": 24788170
      },
      {
        "open": 229.2501,
        "high": 232.6582,
        "low": 228.9811,
        "close": 231.2631,
        "volumeto": 28654799
      },
      {
        "open": 229.9776,
        "high": 231.5421,
        "low": 225.9417,
        "close": 227.1973,
        "volumeto": 32042000
      },
      {
        "open": 227.1674,
        "high": 227.6158,
        "low": 219.813,
        "close": 223.5101,
        "volumeto": 33580463
      },
      {
        "open": 221.4374,
        "high": 224.0184,
        "low": 219.4344,
        "close": 222.992,
        "volumeto": 29663923
      },
      {
        "open": 222.8624,
        "high": 226.4798,
        "low": 221.4735,
        "close": 226.0812,
        "volumeto": 26891029
      },
      {
        "open": 224.6761,
        "high": 225.563,
        "low": 215.2988,
        "close": 215.6077,
        "volumeto": 41990554
      },
      {
        "open": 213.7741,
        "high": 218.7368,
        "low": 211.5818,
        "close": 213.7044,
        "volumeto": 53124392
      },
      {
        "open": 219.6536,
        "high": 222.105,
        "low": 216.086,
        "close": 221.3377,
        "volumeto": 40337851
      },
      {
        "open": 220.391,
        "high": 221.0587,
        "low": 216.5146,
        "close": 216.6042,
        "volumeto": 30791007
      },
      {
        "open": 218.1688,
        "high": 222.2147,
        "low": 216.009,
        "close": 221.3776,
        "volumeto": 29183963
      },
      {
        "open": 221.5271,
        "high": 221.8659,
        "low": 218.5774,
        "close": 220.4209,
        "volumeto": 22885397
      },
      {
        "open": 217.1025,
        "high": 218.976,
        "low": 212.2594,
        "close": 215.2689,
        "volumeto": 32581315
      },
      {
        "open": 217.3018,
        "high": 220.4907,
        "low": 216.674,
        "close": 218.5475,
        "volumeto": 33078726
      },
      {
        "open": 219.0258,
        "high": 222.5834,
        "low": 218.1787,
        "close": 219.8828,
        "volumeto": 28792082
      },
      {
        "open": 215.0796,
        "high": 222.4738,
        "low": 213.9535,
        "close": 221.9556,
        "volumeto": 38767846
      },
      {
        "open": 221.826,
        "high": 223.4504,
        "low": 213.794,
        "close": 214.3421,
        "volumeto": 40925163
      },
      {
        "open": 216.953,
        "high": 220.6103,
        "low": 215.9964,
        "close": 219.0358,
        "volumeto": 29855768
      },
      {
        "open": 215.1493,
        "high": 219.4244,
        "low": 211.9305,
        "close": 215.5479,
        "volumeto": 47258375
      },
      {
        "open": 218.4279,
        "high": 218.9261,
        "low": 205.3734,
        "close": 211.502,
        "volumeto": 45935520
      },
      {
        "open": 210.4158,
        "high": 214.4318,
        "low": 208.5424,
        "close": 212.5584,
        "volumeto": 36659990
      },
      {
        "open": 216.1259,
        "high": 219.6835,
        "low": 215.8668,
        "close": 218.099,
        "volumeto": 38358933
      },
      {
        "open": 218.2884,
        "high": 221.5869,
        "low": 216.0562,
        "close": 221.4473,
        "volumeto": 58323180
      },
      {
        "open": 208.8214,
        "high": 212.9071,
        "low": 204.7157,
        "close": 206.7586,
        "volumeto": 91328654
      },
      {
        "open": 203.5896,
        "high": 203.6793,
        "low": 197.481,
        "close": 200.8891,
        "volumeto": 66163669
      },
      {
        "open": 201.2179,
        "high": 204.0082,
        "low": 200.9887,
        "close": 203.0615,
        "volumeto": 31882881
      },
      {
        "open": 205.2538,
        "high": 209.3296,
        "low": 203.4202,
        "close": 209.22,
        "volumeto": 33424434
      },
      {
        "open": 209.98,
        "high": 210.12,
        "low": 206.75,
        "close": 208.49,
        "volumeto": 25362636
      },
      {
        "open": 205.55,
        "high": 206.01,
        "low": 202.25,
        "close": 204.47,
        "volumeto": 34365750
      },
      {
        "open": 199,
        "high": 199.85,
        "low": 193.79,
        "close": 194.17,
        "volumeto": 51135518
      },
      {
        "open": 191.63,
        "high": 197.18,
        "low": 191.4501,
        "close": 192.23,
        "volumeto": 46882936
      },
      {
        "open": 193.9,
        "high": 194.48,
        "low": 185.93,
        "close": 186.8,
        "volumeto": 60800957
      },
      {
        "open": 188.39,
        "high": 191.97,
        "low": 186.9,
        "close": 191.41,
        "volumeto": 46478801
      },
      {
        "open": 190.5,
        "high": 194.9695,
        "low": 189.46,
        "close": 193.53,
        "volumeto": 36928253
      },
      {
        "open": 190,
        "high": 190.7,
        "low": 184.99,
        "close": 185.86,
        "volumeto": 41920872
      },
      {
        "open": 178.37,
        "high": 181.47,
        "low": 175.51,
        "close": 176.98,
        "volumeto": 67825247
      },
      {
        "open": 179.73,
        "high": 180.27,
        "low": 176.55,
        "close": 176.78,
        "volumeto": 31124210
      },
      {
        "open": 174.94,
        "high": 176.595,
        "low": 172.1,
        "close": 172.29,
        "volumeto": 23623972
      },
      {
        "open": 174.24,
        "high": 174.95,
        "low": 170.26,
        "close": 174.62,
        "volumeto": 44998520
      },
      {
        "open": 171.51,
        "high": 174.77,
        "low": 170.88,
        "close": 174.24,
        "volumeto": 41387377
      },
      {
        "open": 176.73,
        "high": 181.29,
        "low": 174.93,
        "close": 180.94,
        "volumeto": 46062539
      },
      {
        "open": 182.66,
        "high": 182.8,
        "low": 177.7,
        "close": 179.55,
        "volumeto": 41769992
      },
      {
        "open": 180.29,
        "high": 180.33,
        "low": 177.03,
        "close": 178.58,
        "volumeto": 39531549
      },
      {
        "open": 184.46,
        "high": 184.94,
        "low": 181.21,
        "close": 184.82,
        "volumeto": 40798002
      },
      {
        "open": 180.95,
        "high": 182.3899,
        "low": 176.27,
        "close": 176.69,
        "volumeto": 41344282
      },
      {
        "open": 171.76,
        "high": 174.78,
        "low": 170.42,
        "close": 174.72,
        "volumeto": 43098410
      },
      {
        "open": 173.49,
        "high": 174.49,
        "low": 168.3,
        "close": 168.49,
        "volumeto": 42281631
      },
      {
        "open": 165,
        "high": 170.09,
        "low": 163.33,
        "close": 169.6,
        "volumeto": 62025994
      },
      {
        "open": 171.66,
        "high": 171.79,
        "low": 167,
        "close": 168.63,
        "volumeto": 47281665
      },
      {
        "open": 170.4,
        "high": 171.92,
        "low": 169.02,
        "close": 169.1,
        "volumeto": 35627674
      },
      {
        "open": 170.49,
        "high": 172.57,
        "low": 169.55,
        "close": 170.95,
        "volumeto": 31897827
      },
      {
        "open": 169,
        "high": 169.08,
        "low": 165.28,
        "close": 165.48,
        "volumeto": 40703710
      },
      {
        "open": 165.45,
        "high": 168.35,
        "low": 162.73,
        "close": 163.94,
        "volumeto": 44287922
      },
      {
        "open": 165.38,
        "high": 167.53,
        "low": 164.39,
        "close": 166.07,
        "volumeto": 33841518
      },
      {
        "open": 166,
        "high": 167.45,
        "low": 159.09,
        "close": 160.89,
        "volumeto": 49047297
      },
      {
        "open": 160.4,
        "high": 162.11,
        "low": 155.3,
        "close": 156.83,
        "volumeto": 64772960
      },
      {
        "open": 156.86,
        "high": 158.16,
        "low": 149.63,
        "close": 150.73,
        "volumeto": 95744384
      },
      {
        "open": 148.15,
        "high": 151.55,
        "low": 146.59,
        "close": 146.83,
        "volumeto": 37169232
      },
      {
        "open": 148.3,
        "high": 157.23,
        "low": 146.72,
        "close": 157.17,
        "volumeto": 58582544
      },
      {
        "open": 155.84,
        "high": 156.77,
        "low": 150.07,
        "close": 156.15,
        "volumeto": 53117065
      },
      {
        "open": 157.5,
        "high": 158.52,
        "low": 154.55,
        "close": 156.23,
        "volumeto": 42291424
      },
      {
        "open": 158.53,
        "high": 159.36,
        "low": 156.48,
        "close": 157.74,
        "volumeto": 35003466
      },
      {
        "open": 154.89,
        "high": 158.85,
        "low": 154.23,
        "close": 157.92,
        "volumeto": 37039737
      },
      {
        "open": 143.98,
        "high": 145.72,
        "low": 142,
        "close": 142.19,
        "volumeto": 91312195
      },
      {
        "open": 144.53,
        "high": 148.5499,
        "low": 143.8,
        "close": 148.26,
        "volumeto": 58607070
      },
      {
        "open": 148.7,
        "high": 148.83,
        "low": 145.9,
        "close": 147.93,
        "volumeto": 54777764
      },
      {
        "open": 149.56,
        "high": 151.82,
        "low": 148.52,
        "close": 150.75,
        "volumeto": 41025314
      },
      {
        "open": 151.29,
        "high": 154.53,
        "low": 149.63,
        "close": 153.31,
        "volumeto": 45099081
      },
      {
        "open": 152.5,
        "high": 153.97,
        "low": 150.86,
        "close": 153.8,
        "volumeto": 35780670
      },
      {
        "open": 152.88,
        "high": 153.7,
        "low": 151.51,
        "close": 152.29,
        "volumeto": 27023241
      },
      {
        "open": 150.85,
        "high": 151.27,
        "low": 149.22,
        "close": 150,
        "volumeto": 32439186
      },
      {
        "open": 150.27,
        "high": 153.39,
        "low": 150.05,
        "close": 153.07,
        "volumeto": 28710324
      },
      {
        "open": 153.08,
        "high": 155.88,
        "low": 153,
        "close": 154.94,
        "volumeto": 30569706
      },
      {
        "open": 154.2,
        "high": 157.66,
        "low": 153.26,
        "close": 155.86,
        "volumeto": 29821160
      },
      {
        "open": 157.5,
        "high": 157.88,
        "low": 155.9806,
        "close": 156.82,
        "volumeto": 33751023
      }
    ];
    assert(stock != null);
    final String lastSale = '\$${stock.close.toStringAsFixed(2)}';
    String changeInPrice = '${stock.percentChange.toStringAsFixed(2)}%';
    if (stock.percentChange > 0) changeInPrice = '+' + changeInPrice;

    final TextStyle headings = Theme.of(context).textTheme.body2;
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Text('${stock.symbol}', style: Theme.of(context).textTheme.display2),
          arrow,
        ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
        Text('Last Sale', style: headings),
        Text('$lastSale ($changeInPrice)'),
        Container(height: 8.0),
        Text('Volume', style: headings),
        Text('${stock.volume.toStringAsFixed(2)}'),
        Container(height: 8.0),
        new Container(
          height: 250.0,
          child: new OHLCVGraph(
              data: sampleData,
              enableGridLines: true,
              volumeProp: 0.2,
              gridLineAmount: 5,
              gridLineColor: Colors.grey[300],
              gridLineLabelColor: Colors.grey),
        ),
        new Container(
          height: 20.0,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: 'Upper notification limit'),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: 'Lower notification limit'),
        ),
        new RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.lightBlueAccent,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {},
          child: new Text("Set notifications"),
        ),
        new Container(
          height: 20.0,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: 'Amount to add'),
        ),
        new RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.lightBlueAccent,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {},
          child: new Text("Add to my account"),
        ),
      ], mainAxisSize: MainAxisSize.min),
    );
  }
}

class StockSymbolPage extends StatelessWidget {
  const StockSymbolPage({this.symbol, this.stocks});

  final String symbol;
  final StockData stocks;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: stocks,
      builder: (BuildContext context, Widget child) {
        final Stock stock = stocks[symbol];
        return Scaffold(
            appBar: AppBar(title: Text(stock?.symbol)),
            body: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Card(
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 300),
                        firstChild: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        secondChild: stock != null
                            ? _StockSymbolView(
                                stock: stock,
                                arrow: Hero(
                                  tag: stock,
                                  child: StockArrow(
                                      percentChange: stock.percentChange),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(child: Text('$symbol not found')),
                              ),
                        crossFadeState: stock == null && stocks.loading
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ))));
      },
    );
  }
}

class StockSymbolBottomSheet extends StatelessWidget {
  const StockSymbolBottomSheet({this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black26))),
        child: _StockSymbolView(
            stock: stock,
            arrow: StockArrow(percentChange: stock.percentChange)));
  }
}
