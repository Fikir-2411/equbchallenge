class CollectedMoneyModel {
  final String id;
  final String title;
  final double amount;
  final int frequency, membersCount;
  final DateTime createdAt;

  CollectedMoneyModel(
      {required this.id,
      required this.title,
      required this.amount,
      required this.frequency,
      required this.membersCount,
      required this.createdAt});

  factory CollectedMoneyModel.fromJson(Map<String, dynamic> json) {
    return CollectedMoneyModel(
        id: json["id"],
        title: json["title"],
        amount: double.parse(json["amount"]),
        frequency: json["frequency"],
        createdAt: DateTime.parse(json["createdAt"]),
        membersCount: json["membersCount"]);
  }
}
