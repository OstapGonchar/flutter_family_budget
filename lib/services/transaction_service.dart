import 'package:family_budget/models/account.dart';
import 'package:family_budget/models/category.dart';
import 'package:family_budget/models/transaction.dart';

class TransactionService {
  static const _account = Account('Nordea', id: 1);

  final List<Transaction> _debtTransactions = [
    Transaction('Train Tickets', 927.00, 'DKK', DateTime(2022, 4, 18), _account, category: const Category('5. Transport')),
    Transaction('Fish', 1005.00, 'DKK', DateTime(2022, 4, 17), _account, category: const Category('1. Food')),
    Transaction('Food', 634.00, 'DKK', DateTime(2022, 4, 17), _account, category: const Category('1. Food')),
    Transaction('Bouldering', 215.00, 'DKK', DateTime(2022, 4, 17), _account, category: const Category('4. Sport')),
  ];

  List<Transaction> getDebtTransactions() {
    return _debtTransactions;
  }

  addDebtTransaction(Transaction transaction) {
    _debtTransactions.add(transaction);
    _debtTransactions.sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  List<Transaction> getIncomeTransactions() {
    return [
      Transaction('Salary', 53000.00, 'DKK', DateTime(2022, 3, 30), _account, category: const Category('1. Salary')),
    ];
  }
}
