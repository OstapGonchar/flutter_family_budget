import 'package:family_budget/models/transaction.dart';
import 'package:family_budget/utils/transactions_list_builder.dart';
import 'package:flutter/material.dart';

class TransactionsListWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsListWidget(
    this.transactions, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransactionListBuilder().buildListView(transactions);
  }
}
