import 'package:family_budget/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:family_budget/widgets/debt_widget.dart';
import 'package:family_budget/widgets/income_widget.dart';

class TransactionsWidget extends StatelessWidget {
  const TransactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Transactions'),
            actions: const [
              IconButton(
                icon: Icon(Icons.more_vert),
                tooltip: 'Settings',
                onPressed: null,
              )
            ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'DEBT'),
                Tab(text: 'INCOME'),
              ],
            ),
          ),
          drawer: const NavigationDrawer(),
          // body is the majority of the screen.
          body: const TabBarView(
            children: [
              DebtWidget(),
              IncomeWidget(),
            ],
          ),
          floatingActionButton: const FloatingActionButton(
            tooltip: 'Add transaction', // used by assistive technologies
            child: Icon(Icons.add),
            onPressed: null,
          ),
        ));
  }
}