import 'package:family_budget/models/transaction.dart';
import 'package:family_budget/widgets/transaction_date_divider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListBuilder {
  final DateFormat _dateFormat = DateFormat("yyyy-MM-dd");

  ListView buildListView(List<Transaction> transactions) {
    var date = transactions[0].dateTime;

    return ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0 || transactions[index].dateTime != date) {
            date = transactions[index].dateTime;
            return Column(children: [
              buildDivider(_dateFormat.format(transactions[index].dateTime)),
              ListTile(
                title: Text(transactions[index].title),
                subtitle: Text(transactions[index].category?.name ?? ''),
                trailing: Text(
                    '${transactions[index].amount} ${transactions[index].currency}'),
              )
            ]);
          } else {
            return ListTile(
              title: Text(transactions[index].title),
              subtitle: Text(transactions[index].category?.name ?? ''),
              trailing: Text(
                  '${transactions[index].amount} ${transactions[index].currency}'),
            );
          }
        },
        itemCount: transactions.length);
  }
}
