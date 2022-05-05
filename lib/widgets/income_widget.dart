import 'package:family_budget/services/transaction_service.dart';
import 'package:family_budget/utils/transactions_list_builder.dart';
import 'package:flutter/material.dart';

class IncomeWidget extends StatelessWidget {
  final _transactionService = TransactionService();

  IncomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransactionListBuilder()
        .buildListView(_transactionService.getIncomeTransactions());
  }
}
