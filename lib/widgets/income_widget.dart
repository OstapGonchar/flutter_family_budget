import 'package:flutter/material.dart';
import 'package:family_budget/widgets/transaction_date_divider.dart';

class IncomeWidget extends StatelessWidget {
  const IncomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildDivider('30.03.2022'),
        const ListTile(
          title: Text('Salary'),
          subtitle: Text('1. Salary'),
          trailing: Text('53000.00 DKK'),
        )
      ],
    );
  }
}
