class ActivityTile {
  String date;
  String action;
  String address;
  String tokenFrom;
  String tokenTo;
  String tokenSent;
  String tokenReceived;
  double amount;

  ActivityTile(
      {required this.date,
      required this.action,
      required this.address,
      required this.tokenFrom,
      required this.tokenTo,
      required this.tokenSent,
      required this.tokenReceived,
      required this.amount});
}
