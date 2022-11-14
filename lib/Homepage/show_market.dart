import 'dart:async';
import 'dart:convert';

import 'package:acy_ipay/Homepage/widget/tokenTile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/coin.dart';

class ShowMarket extends StatefulWidget {
  const ShowMarket({Key? key}) : super(key: key);

  @override
  State<ShowMarket> createState() => _ShowMarketState();
}

class _ShowMarketState extends State<ShowMarket> {
  bool isLoading = true;
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        if (this.mounted) {
          setState(() {
            isLoading = false;
            coinList;
          });
        }
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(const Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget columnFunction = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Text("Name"),
            SizedBox(width: 15),
            Text("Vol"),
          ],
        ),
        Row(
          children: [
            Text("Price"),
            SizedBox(width: 15),
            Text("24H"),
            SizedBox(width: 20),
          ],
        )
      ],
    );

    return Column(
      children: [
        columnFunction,
        isLoading ? Center(child: const CircularProgressIndicator()) : Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            itemCount: coinList.length,
            itemBuilder: (context, index) {
              return TokenTile(
                name: coinList[index].name,
                symbol: coinList[index].symbol.toUpperCase(),
                imageUrl: coinList[index].imageUrl,
                price: coinList[index].price.toDouble(),
                changePercentage: coinList[index].changePercentage.toDouble(),
              );
            },
          ),
        ),
      ],
    );
  }
}
