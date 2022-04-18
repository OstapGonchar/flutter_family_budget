import 'package:flutter/material.dart';

import 'accounts_widget.dart';
import 'budget_widget.dart';
import 'debt_widget.dart';
import 'income_widget.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: const IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null,
            ),
            title: const Text('List of transactions'),
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
                Tab(text: 'ACCOUNTS'),
                Tab(text: 'BUDGET')
              ],
            ),
          ),
          // body is the majority of the screen.
          body: const TabBarView(
            children: [
              DebtWidget(),
              IncomeWidget(),
              AccountsWidget(),
              BudgetWidget()
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
