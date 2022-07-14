class Transaction {
  final String? id;
  final String? title;
  final double? amount;
  final DateTime? date;

  Transaction({
    required this.id,
    this.title,
    this.amount,
    this.date,
  });
}
