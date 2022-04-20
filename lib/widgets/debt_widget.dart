import 'package:flutter/material.dart';
import 'transaction_date_divider.dart';

class DebtWidget extends StatelessWidget {
  const DebtWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildDivider('18.04.2022'),
        const ListTile(
          title: Text('Train Tickets'),
          subtitle: Text('5. Transport'),
          trailing: Text('927.00 DKK'),
        ),
        buildDivider('17.04.2022'),
        const ListTile(
          title: Text('Fish'),
          subtitle: Text('1. Food'),
          trailing: Text('1,005.00 DKK'),
        ),
        const ListTile(
          title: Text('Food'),
          subtitle: Text('1. Food'),
          trailing: Text('634.0 DKK'),
        ),
        const ListTile(
          title: Text('Bouldering'),
          subtitle: Text('4. Sport'),
          trailing: Text('215.00 DKK'),
        ),
      ],
    );
  }
}
