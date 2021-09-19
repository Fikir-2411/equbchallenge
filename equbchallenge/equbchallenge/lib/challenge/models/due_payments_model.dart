class DuePaymentModel {
  final String name, id, owedAmount;
  final int totalRounds, paidRounds;
  final DateTime createdAt, dueDate;

  DuePaymentModel(
      {required this.name,
      required this.id,
      required this.owedAmount,
      required this.totalRounds,
      required this.paidRounds,
      required this.dueDate,
      required this.createdAt});

  factory DuePaymentModel.fromJson(Map<String, dynamic> json) {
    return DuePaymentModel(
        id: json["id"],
        name: json["name"],
        owedAmount: json["owedAmount"],
        totalRounds: json["totalRounds"],
        createdAt: DateTime.parse(json["createdAt"]),
        dueDate: DateTime.parse(json["dueDate"]),
        paidRounds: json["paidRounds"]);
  }
}
