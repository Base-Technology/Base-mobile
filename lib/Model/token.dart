class Token {
  final String symbol;
  final String name;
  final String assetPath;

  const Token(
      {required this.symbol, required this.name, required this.assetPath});

  factory Token.fromJson(Map<String, dynamic> json) => Token(
      symbol: json['symbol'], name: json['name'], assetPath: json['assetPath']);

  Map<String, dynamic> toJson() =>
      {'symbol': symbol, 'name': name, 'assetPath': assetPath};
}
