import 'package:family_budget/services/transaction_service.dart';
import 'package:family_budget/widgets/add_transaction_widget.dart';
import 'package:family_budget/widgets/transactions_list_widget.dart';
import 'package:family_budget/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {

  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final TransactionService _transactionService = TransactionService();

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
          body: TabBarView(
            children: [
              TransactionsListWidget(_transactionService.getDebtTransactions()),
              TransactionsListWidget(_transactionService.getIncomeTransactions()),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Add transaction', // used by assistive technologies
            child: const Icon(Icons.add),
            onPressed: () {
              _addTransactionPage(context);
            },
          ),
        ));
  }

  _addTransactionPage(BuildContext context) async {
    final transaction = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddTransactionWidget()));
    setState(() {
      _transactionService.addDebtTransaction(transaction);
    });
  }
}
