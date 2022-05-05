import 'package:family_budget/services/transaction_service.dart';
import 'package:family_budget/utils/transactions_list_builder.dart';
import 'package:flutter/material.dart';

class DebtWidget extends StatelessWidget {
  final _transactionService = TransactionService();

  DebtWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransactionListBuilder()
        .buildListView(_transactionService.getDebtTransactions());
  }
}
