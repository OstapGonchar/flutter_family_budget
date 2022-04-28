import 'package:family_budget/models/category.dart';

class Transaction {
  final int? id;
  final double amount;
  final String currency;
  final Category? category;
  final DateTime dateTime;

  const Transaction(this.amount, this.currency, this.dateTime,
      {this.id, this.category});

  @override
  String toString() {
    return '{id=$id, amount=$amount, currency=$currency, dateTime=$dateTime}';
  }
}
