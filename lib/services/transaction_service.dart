import 'package:family_budget/models/account.dart';
import 'package:family_budget/models/category.dart';
import 'package:family_budget/models/transaction.dart';

class TransactionService {
  List<Transaction> getDebtTransactions() {
    const account = Account('Nordea', id: 1);
    return [
      Transaction('Train Tickets', 927.00, 'DKK', DateTime(2022, 4, 18), account, category: const Category('5. Transport')),
      Transaction('Fish', 1005.00, 'DKK', DateTime(2022, 4, 17), account, category: const Category('1. Food')),
      Transaction('Food', 634.00, 'DKK', DateTime(2022, 4, 17), account, category: const Category('1. Food')),
      Transaction('Bouldering', 215.00, 'DKK', DateTime(2022, 4, 17), account, category: const Category('4. Sport')),
    ];
  }

  List<Transaction> getIncomeTransactions() {
    const account = Account('Nordea', id: 1);
    return [
      Transaction('Salary', 53000.00, 'DKK', DateTime(2022, 3, 30), account, category: const Category('1. Salary')),
    ];
  }
}
