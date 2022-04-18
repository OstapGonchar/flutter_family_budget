import 'package:flutter/material.dart';

class DebtWidget extends StatelessWidget {
  const DebtWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dividerSubtextStyle = Theme.of(context).textTheme.bodyText2?.copyWith(
        fontSize: 12.0, color: Theme.of(context).textTheme.caption?.color);
    return ListView(
      children: [
        buildDivider(),
        buildDividerSubText('18.04.2022', dividerSubtextStyle),
        const ListTile(
          title: Text('Train Tickets'),
          subtitle: Text('5. Transport'),
          trailing: Text('927.00 DKK'),
        ),
        buildDivider(),
        buildDividerSubText('17.04.2022', dividerSubtextStyle),
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

  Divider buildDivider() {
    return const Divider(
      height: 32.0,
      indent: 16,
      thickness: 5.0,
      color: Colors.blueAccent,
    );
  }

  Container buildDividerSubText(
      String dateText, TextStyle? dividerSubtextStyle) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          dateText,
          style: dividerSubtextStyle,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
