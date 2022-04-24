import 'package:family_budget/utils/md5.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeaderWidget(),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Accounts'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.savings),
            title: const Text('Budget'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.gravatar.com/avatar/${generateMd5('ostap.gonchar@gmail.com')}'),
                backgroundColor: Colors.brown.shade800,
                child: const Text('AH')),
          ),
          Text('Ostap Gonchar', style: Theme.of(context).textTheme.headline5),
          const Text('ostap.gonchar@gmail.com')
        ],
      ),
    );
  }
}
