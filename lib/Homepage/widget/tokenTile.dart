import 'package:flutter/material.dart';

class TokenTile extends StatelessWidget {
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
  final double changePercentage;

  const TokenTile({Key? key,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.changePercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(imageUrl),
              ),
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    symbol,
                    style: const TextStyle(
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price.toDouble().toString(),
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  changePercentage.toDouble() < 0
                      ? changePercentage.toDouble().toString() + '%'
                      : '+' + changePercentage.toDouble().toString() + '%',
                  style: TextStyle(
                    color: changePercentage.toDouble() < 0
                        ? Colors.red
                        : Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}