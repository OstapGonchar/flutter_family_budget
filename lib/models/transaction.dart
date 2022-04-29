import 'package:family_budget/models/account.dart';
import 'package:family_budget/models/budget.dart';
import 'package:family_budget/models/category.dart';

class Transaction {
  final int? id;
  final String title;
  final double amount;
  final String currency;
  final DateTime dateTime;
  final Account account;
  final Category? category;
  final Budget? budget;
  final String description;

  const Transaction(
      this.title, this.amount, this.currency, this.dateTime, this.account,
      {this.id, this.description = '', this.category, this.budget});

  @override
  String toString() {
    return '{id=$id, title=$title, amount=$amount, currency=$currency, dateTime=$dateTime, account=${account.name}, description=$description';
  }
}
