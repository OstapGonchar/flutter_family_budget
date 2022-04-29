import 'package:family_budget/models/account.dart';
import 'package:family_budget/models/transaction.dart';

class TransactionService {
  List<Transaction> getTransactions() {
    var account = const Account('Nordea', id: 1);
    return [
      Transaction('Transaction 1', 100, "USD", DateTime(2022, 4, 12), account),
      Transaction('Transaction 2', 10, "USD", DateTime(2022, 4, 13), account),
      Transaction('Transaction 3', 20, "USD", DateTime(2022, 4, 13), account),
    ];
  }
}
